import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/models/manager/house_keeping/house_keeping_building_model.dart';
import 'package:aku_new_community_manager/saas_models/net_model/base_model.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/tools/aku_divider.dart';
import 'package:aku_new_community_manager/tools/extensions/list_extension_tool.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Response;
import 'package:velocity_x/src/extensions/num_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/widgets.dart';

class HouseKeepingAddPage extends StatefulWidget {
  HouseKeepingAddPage({Key? key}) : super(key: key);

  @override
  _HouseKeepingAddPageState createState() => _HouseKeepingAddPageState();
}

class _HouseKeepingAddPageState extends State<HouseKeepingAddPage> {
  HouseKeepingBuildingModel _buidling = HouseKeepingBuildingModel.init();
  HouseKeepingBuildingModel _united = HouseKeepingBuildingModel.init();
  HouseKeepingBuildingModel _houseProperty = HouseKeepingBuildingModel.init();
  TextEditingController? _nameController;
  TextEditingController? _telController;
  TextEditingController? _numController;
  TextEditingController? _contentController;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _telController = TextEditingController();
    _numController = TextEditingController();
    _contentController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController!.dispose();
    _telController!.dispose();
    _numController!.dispose();
    _contentController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '??????',
      body: ListView(
        children: [
          24.w.heightBox,
          _slectEstate(),
          40.w.heightBox,
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            padding: EdgeInsets.all(32.w),
            child: Column(
              children: [
                _inputRowTile('???????????????', _nameController),
                _inputRowTile('??????????????????', _telController),
                _inputRowTile('??????', _numController),
                _inputRowTile('??????', _contentController),
              ].sepWidget(separate: 40.w.heightBox),
            ),
          ),
        ],
      ),
      bottom: AkuBottomButton(
        title: '????????????',
        onTap: () async {
          await _submit();
        },
      ),
    );
  }

  Future _submit() async {
    BaseModel baseModel = await NetUtil().post(
      API.manage.addHouseKeeping,
      params: {
        "estateId": _houseProperty.value,
        "num": int.parse(_numController!.text),
        "leaderName": _nameController!.text,
        "leaderTel": _telController!.text,
        "content": _contentController!.text,
      },
      showMessage: true,
    );
    if (baseModel.success) {
      Get.back();
    }
  }

  Widget _slectEstate() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 24.w),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
      child: Column(
        children: [
          _buildingslecet(),
          40.w.heightBox,
          _uniteSelect(),
          40.w.heightBox,
          _houseSelect()
        ],
      ),
    );
  }

  _buildingslecet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        '????????????'.text.size(32.sp).color(kTextPrimaryColor).bold.make(),
        InkWell(
            onTap: () async {
              List<HouseKeepingBuildingModel> _models = [];

              Response response = await NetUtil().dio!.get(
                    API.manage.allBuilding,
                  );
              if (response.statusCode == 200) {
                _models = (response.data as List)
                    .map((e) => HouseKeepingBuildingModel.fromJson(e))
                    .toList();
              }
              // showItemSheet(
              //   title: '????????????',
              //   items: _models.map((e) => e.label).toList(),
              // );
              await _showBottomSheet('????????????', _models, onTap: (e) {
                _buidling = e;
                setState(() {});
              });
            },
            child: Column(
              children: [
                32.w.heightBox,
                Row(
                  children: [
                    _buidling.label.isEmptyOrNull
                        ? '???????????????'
                            .text
                            .size(30.sp)
                            .color(kTextSubColor)
                            .bold
                            .make()
                        : _buidling.label!.text
                            .size(28.sp)
                            .color(kTextPrimaryColor)
                            .make(),
                    Spacer()
                  ],
                ).material(color: Colors.transparent),
              ],
            )),
        12.w.heightBox,
        AkuDivider.horizontal(),
      ],
    );
  }

  _uniteSelect() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        '????????????'.text.size(32.sp).color(kTextPrimaryColor).bold.make(),
        InkWell(
            onTap: () async {
              List<HouseKeepingBuildingModel> _models = [];

              if (_buidling.value == -1) {
                BotToast.showText(text: '?????????????????????');
                return;
              }

              Response response = await NetUtil().dio!.get(API.manage.allUnit,
                  queryParameters: {"buildingId": _buidling.value});
              if (response.statusCode == 200) {
                _models = (response.data as List)
                    .map((e) => HouseKeepingBuildingModel.fromJson(e))
                    .toList();
              }
              await _showBottomSheet('????????????', _models, onTap: (e) {
                _united = e;
                setState(() {});
              });
            },
            child: Column(
              children: [
                32.w.heightBox,
                Row(
                  children: [
                    _united.label.isEmptyOrNull
                        ? '???????????????'
                            .text
                            .size(30.sp)
                            .color(kTextSubColor)
                            .bold
                            .make()
                        : _united.label!.text
                            .size(28.sp)
                            .color(kTextPrimaryColor)
                            .make(),
                    Spacer()
                  ],
                ).material(color: Colors.transparent),
              ],
            )),
        12.w.heightBox,
        AkuDivider.horizontal(),
      ],
    );
  }

  _houseSelect() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        '????????????'.text.size(32.sp).color(kTextPrimaryColor).bold.make(),
        GestureDetector(
            onTap: () async {
              List<HouseKeepingBuildingModel> _models = [];

              if (_united.value == -1) {
                BotToast.showText(text: '?????????????????????');
                return;
              }

              Response response = await NetUtil().dio!.get(API.manage.allHous,
                  queryParameters: {"unitId": _united.value});
              if (response.statusCode == 200) {
                _models = (response.data as List)
                    .map((e) => HouseKeepingBuildingModel.fromJson(e))
                    .toList();
              }
              await _showBottomSheet('????????????', _models, onTap: (e) {
                _houseProperty = e;
                setState(() {});
              });
            },
            child: Column(
              children: [
                32.w.heightBox,
                Row(
                  children: [
                    _houseProperty.label.isEmptyOrNull
                        ? '???????????????'
                            .text
                            .size(30.sp)
                            .color(kTextSubColor)
                            .bold
                            .make()
                        : _houseProperty.label!.text
                            .size(28.sp)
                            .color(kTextPrimaryColor)
                            .make(),
                    Spacer()
                  ],
                ).material(color: Colors.transparent),
              ],
            )),
        12.w.heightBox,
        AkuDivider.horizontal(),
      ],
    );
  }

  Future _showBottomSheet(String title, List<HouseKeepingBuildingModel> models,
      {Function(HouseKeepingBuildingModel model)? onTap}) async {
    await Get.bottomSheet(
      CupertinoActionSheet(
        title: title.text
            .size(32.sp)
            .bold
            .color(kTextPrimaryColor)
            .isIntrinsic
            .make(),
        actions: models
            .map(
              (e) => CupertinoActionSheetAction(
                onPressed: () {
                  onTap!(e);
                  Get.back();
                  setState(() {});
                },
                child: e.label!.text
                    .size(28.sp)
                    .color(kTextPrimaryColor)
                    .isIntrinsic
                    .make(),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _inputRowTile(String title, TextEditingController? controller,
      {String? hintText, List<TextInputFormatter>? formatters}) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title.text.size(28.sp).color(kTextPrimaryColor).make(),
          32.w.heightBox,
          TextField(
            inputFormatters: formatters,
            controller: controller,
            textAlign: TextAlign.start,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: hintText ?? '',
              isDense: true,
              contentPadding: EdgeInsets.zero,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 2.w),
              ),
            ),
            style: TextStyle(
              fontSize: 36.sp,
              fontWeight: FontWeight.bold,
              color: kTextPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
