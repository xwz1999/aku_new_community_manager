// Dart imports:
import 'dart:io';

// Project imports:
import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/const/saas_api.dart';
import 'package:aku_new_community_manager/models/manager/inspection/inspection_point_submit_model.dart';
import 'package:aku_new_community_manager/models/manager/inspection/inspection_qrcode_model.dart';
import 'package:aku_new_community_manager/saas_models/net_model/base_model.dart';
import 'package:aku_new_community_manager/style/app_style.dart';

// Flutter imports:
import 'package:aku_new_community_manager/ui/manage_pages/inspection_manage/inspection_point_submit_page.dart';
import 'package:aku_new_community_manager/ui/manage_pages/inspection_manage/inspection_utils.dart';
import 'package:aku_new_community_manager/ui/sub_pages/manage_func.dart';
import 'package:aku_new_community_manager/ui/widgets/app_widgets/bee_pick_image_widget.dart';
import 'package:aku_new_community_manager/ui/widgets/app_widgets/aku_single_check_button.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_button.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';

// Package imports:
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/src/extensions/num_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/container.dart';
import 'package:velocity_x/src/flutter/padding.dart';
import 'package:velocity_x/src/flutter/widgets.dart';

class InspectionPointInputPage extends StatefulWidget {
  final InspectionQRCodeModel? qrModel;
  final String? inspectionName;

  InspectionPointInputPage({Key? key, this.qrModel, this.inspectionName})
      : super(key: key);

  @override
  _InspectionPointInputPageState createState() =>
      _InspectionPointInputPageState();
}

class _InspectionPointInputPageState extends State<InspectionPointInputPage> {
  late InspectionPointSubmitModel _submitModel;
  InspectionQRCodeModel? _model;
  List<File>? _selfPhotos;
  List<File>? _scenePhots;

  bool get canSubmit {
    if (_selfPhotos == null && _scenePhots == null) {
      return false;
    } else {
      if (_submitModel.executeCheckList!.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _model = widget.qrModel;
    _submitModel = InspectionPointSubmitModel(
      widget.qrModel!.id!,
      [],
    );
    _submitModel.executeCheckList = List.generate(
      widget.qrModel!.checkList!.length,
      (index) => ExecuteCheckList(widget.qrModel!.checkList![index].id, -1, ''),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '巡检点',
      body: ListView(
        children: [
          16.w.heightBox,
          _inspectionHeadCard(),
          16.w.heightBox,
          ..._model!.checkList!
              .map((e) => _meterCard(e.name, _model!.checkList!.indexOf(e)))
              .toList(),
          _selfPhotoCard(),
          _scenePhotoCard(),
        ],
      ),
      bottom: AkuButton(
        onPressed: canSubmit
            ? () async {
                // _submitModel.inspectionFaceImg = await NetUtil()
                //     .uploadFiles(_selfPhotos!, SAASAPI.upload.uploadImg);
                _submitModel.inspectionFaceImg = [];
                // _submitModel.inspectionSpaceImg = await NetUtil()
                //     .uploadFiles(_scenePhots!, SAASAPI.upload.uploadImg);
                _submitModel.inspectionSpaceImg = [];
                BaseModel baseModel =
                    await (ManageFunc.getSubmitPoint(_submitModel));
                if (baseModel.success) {
                  BotToast.showText(text: baseModel.msg);
                  Get.to(() => InspectionPointSubmitPage());
                } else {
                  BotToast.showText(text: baseModel.msg);
                }
              }
            : () {},
        width: double.infinity,
        height: 100.w,
        child: '立即提交'
            .text
            .color(canSubmit ? kTextPrimaryColor : kTextSubColor)
            .bold
            .size(32.sp)
            .make(),
        color: canSubmit ? Color(0xFFFFC40C) : Color(0xFFFFE67D),
        padding: EdgeInsets.symmetric(vertical: 26.w),
      ).pOnly(bottom: MediaQuery.of(context).padding.bottom),
    );
  }

  Widget _selfPhotoCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            '3.巡更人员自拍人脸'.text.color(kTextPrimaryColor).size(32.sp).bold.make()
          ],
        ),
        32.w.heightBox,
        BeePickImageWidget(
          onChanged: (files) {
            _selfPhotos = files;
            setState(() {});
          },
        ),
      ],
    )
        .box
        .color(Colors.white)
        .padding(EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w))
        .make();
  }

  Widget _scenePhotoCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            '3.巡更人员拍摄现场'.text.color(kTextPrimaryColor).size(32.sp).bold.make()
          ],
        ),
        32.w.heightBox,
        BeePickImageWidget(
          onChanged: (files) {
            _scenePhots = files;
            setState(() {});
          },
        )
      ],
    )
        .box
        .color(Colors.white)
        .padding(EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w))
        .make();
  }

  Widget _meterCard(
    String? title,
    int index,
  ) {
    return Column(
      children: [
        Row(
          children: [
            '2.$title'.text.color(kTextPrimaryColor).size(32.sp).make()
          ],
        ),
        32.w.heightBox,
        Row(
          children: [
            AkuSingleCheckButton(
              text: '正常',
              value: 0,
              gropValue: _submitModel.executeCheckList![index].status,
              onPressed: () {
                _submitModel.executeCheckList![index].status = 0;
                setState(() {});
              },
            ),
            80.w.widthBox,
            AkuSingleCheckButton(
              text: '异常',
              value: 1,
              gropValue: _submitModel.executeCheckList![index].status,
              onPressed: () {
                _submitModel.executeCheckList![index].status = 1;
                setState(() {});
              },
            ),
          ],
        ),
        36.w.heightBox,
        // Row(
        //   children: [
        //     '抄表值'.text.color(kTextPrimaryColor).size(28.sp).make(),
        //     Spacer(),
        //     TextField(
        //       controller: _meterCountContrlller,
        //       textAlign: TextAlign.end,
        //       inputFormatters: [
        //         FilteringTextInputFormatter.allow(RegExp('[0-9]*'))
        //       ],
        //       decoration: InputDecoration(
        //         border: InputBorder.none,
        //         hintText: '请输入抄表值',
        //         hintStyle: TextStyle(
        //           fontSize: 28.sp,
        //           color: kTextSubColor,
        //         ),
        //         contentPadding: EdgeInsets.zero,
        //         isDense: true,
        //       ),
        //     )
        //   ],
        // ),
        // 28.w.heightBox,
        // Divider(),
        Container(
          width: 686.w,
          height: 120.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            border: Border.all(
              width: 2.w,
              color: Color(0xFFE8E8E8),
            ),
          ),
          child: TextField(
            minLines: 5,
            maxLines: 10,
            autofocus: false,
            onChanged: (value) {
              _submitModel.executeCheckList![index].remakes = value;
            },
            decoration: InputDecoration(
              hintText: '请输入备注信息',
              hintStyle: TextStyle(
                fontSize: 28.sp,
                color: kTextSubColor,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16.w, horizontal: 24.w),
              border: InputBorder.none,
              isDense: true,
            ),
          ),
        ),
      ],
    )
        .box
        .padding(EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w))
        .color(Colors.white)
        .make();
  }

  Widget _inspectionHeadCard() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        16.w.heightBox,
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 40.w),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              color: Color(0xFFFFFFFF)),
          child: Column(children: [
            Container(
              height: 86.w,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    '巡检点信息',
                    style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontSize: 36.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  // Spacer(),
                  // InspectionUtils.status[widget.detailModel.status].text
                  //     .color(InspectionUtils.color(widget.detailModel.status))
                  //     .bold
                  //     .size(28.sp)
                  //     .make()
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  R.ASSETS_INSPECTION_IC_INSPECTION_NAME_PNG,
                  width: 40.w,
                  height: 40.w,
                ),
                4.w.widthBox,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '巡检名称',
                      style: InspectionUtils.textstyle,
                    ),
                  ],
                ),
                36.w.widthBox,
                Text(
                  widget.inspectionName!,
                  maxLines: 2,
                  textAlign: TextAlign.right,
                  style: AppStyle().primaryStyle,
                ).expand()
              ],
            ),
            12.w.heightBox,
            Row(
              children: [
                Image.asset(
                  R.ASSETS_INSPECTION_IC_DATE_PNG,
                  width: 40.w,
                  height: 40.w,
                ),
                4.w.widthBox,
                Text(
                  '巡检点编号',
                  style: InspectionUtils.textstyle,
                ),
                Spacer(),
                Text(
                  widget.qrModel!.code!,
                  style: AppStyle().primaryStyle,
                )
              ],
            ),
            12.w.heightBox,
            Row(
              children: [
                Image.asset(
                  R.ASSETS_INSPECTION_IC_STATION_PNG,
                  width: 40.w,
                  height: 40.w,
                ),
                4.w.widthBox,
                Text(
                  '巡检点名称',
                  style: InspectionUtils.textstyle,
                ),
                Spacer(),
                Text(
                  '${widget.qrModel!.name}',
                  style: AppStyle().primaryStyle,
                ),
              ],
            ),
            12.w.heightBox,
            Row(
              children: [
                Image.asset(
                  R.ASSETS_INSPECTION_IC_PATTERN_PNG,
                  width: 40.w,
                  height: 40.w,
                ),
                4.w.widthBox,
                Text(
                  '巡检模式',
                  style: InspectionUtils.textstyle,
                ),
                Spacer(),
                Text(
                  '${widget.qrModel!.inspectionPattern}',
                  style: AppStyle().primaryStyle,
                ),
              ],
            )
          ]),
        ),
      ],
    );
  }
}
