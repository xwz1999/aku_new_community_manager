import 'dart:io';

import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/const/resource.dart';
import 'package:aku_new_community_manager/json_models/manager/engineer_repair/engineer_repair_new_acceptance_record_model.dart';
import 'package:aku_new_community_manager/json_models/manager/engineer_repair/engineer_repair_result_model.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/tools/widget_tool.dart';
import 'package:aku_new_community_manager/ui/manage_pages/engineer_repair/engineer_repair_acceptance_record_list_page.dart';
import 'package:aku_new_community_manager/ui/manage_pages/engineer_repair/engineer_repair_func.dart';
import 'package:aku_new_community_manager/ui/widgets/app_widgets/bee_pick_image_widget.dart';
import 'package:aku_new_community_manager/ui/widgets/app_widgets/aku_single_check_button.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/aku_title_box.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'engineer_repair_map.dart';

class EngineerRepairAcceptancePage extends StatefulWidget {
  final int repairId;
  final int status;
  final EngineerRepairResultModel resultModel;

  const EngineerRepairAcceptancePage(
      {Key? key,
      required this.repairId,
      required this.resultModel,
      required this.status})
      : super(key: key);

  @override
  _EngineerRepairAcceptancePageState createState() =>
      _EngineerRepairAcceptancePageState();
}

class _EngineerRepairAcceptancePageState
    extends State<EngineerRepairAcceptancePage> {
  int _selectResult = 0;
  String _reportDetail = '';
  List<File> _files = [];

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '????????????',
      body: ListView(
        children: [
          _buildInfo(),
          _buildCheckBox(),
          GestureDetector(
            onTap: () async {
              List<EngineerRepairNewAcceptanceRecordModel> models = [];
              models.addAll(await EngineerRepairFunc.getAcceptanceRecordList(
                  widget.repairId));
              await Get.to(
                  () => EngineerRepairAcceptanceRecordListPage(models: models));
            },
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(32.w),
              child: Row(
                children: [
                  '??????????????????'.text.size(28.sp).color(kTextPrimaryColor).make(),
                  Spacer(),
                  Icon(
                    CupertinoIcons.chevron_right,
                    size: 40.w,
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottom: AkuBottomButton(
        title: '????????????',
        onTap: () async {
          Function cancel = BotToast.showLoading();
          List<String> urls = [];
          urls = await EngineerRepairFunc.uploadAcceptanceImages(_files);
          var result = await EngineerRepairFunc.submitAcceptance(
              widget.resultModel.id,
              widget.repairId,
              _selectResult,
              _reportDetail,
              urls);
          cancel();
          if (result) {
            Get.back();
          }
        },
      ),
    );
  }

  Widget _buildCheckBox() {
    return AkuTitleBox(
      title: '????????????',
      children: [
        40.w.heightBox,
        '????????????'.text.size(28.sp).color(kTextPrimaryColor).make(),
        16.w.heightBox,
        Row(
          children: [
            AkuSingleCheckButton(
              text: '??????',
              value: 1,
              gropValue: _selectResult,
              onPressed: () {
                _selectResult = 1;
                setState(() {});
              },
            ),
            80.w.widthBox,
            AkuSingleCheckButton(
              text: '??????',
              value: 2,
              gropValue: _selectResult,
              onPressed: () {
                _selectResult = 2;
                setState(() {});
              },
            ),
          ],
        ),
        40.w.heightBox,
        '????????????'.text.size(28.sp).color(kTextPrimaryColor).make(),
        16.w.heightBox,
        Container(
          width: 686.w,
          height: 300.w,
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
              setState(() {
                _reportDetail = value;
              });
            },
            decoration: InputDecoration(
              hintText: '?????????????????????????????????',
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
        16.w.heightBox,
        '????????????????????????'.text.size(28.sp).color(kTextPrimaryColor).make(),
        16.w.heightBox,
        BeePickImageWidget(onChanged: (value) {
          _files.clear();
          _files.addAll(value);
          setState(() {});
        }),
        16.w.heightBox,
      ],
    );
  }

  _buildInfo() {
    return AkuTitleBox(
      title: '????????????',
      suffix: Text(
        ERMap.statusString(widget.status),
        style: TextStyle(color: Color(0xFFFF4501)),
      ),
      children: [
        AkuBox.h(16),
        _buildTile(
          R.ASSETS_MESSAGE_IC_PEOPLE_PNG,
          '????????????',
          widget.resultModel.content ?? '',
        ),
        _buildTile(
          R.ASSETS_MESSAGE_IC_PHONE_PNG,
          '????????????',
          widget.resultModel.billMaterials ?? '',
        ),
        _buildTile(R.ASSETS_MESSAGE_IC_AREA_PNG, '????????????',
            widget.resultModel.createDate),
        AkuBox.h(8),
        Text(
          '????????????',
          style: TextStyle(
            color: AppStyle.primaryTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 28.w,
          ),
        ),
        GridView(
          padding: EdgeInsets.only(top: 16.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.w,
          ),
          children: widget.resultModel.maintenanceImgLists.map((e) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(4.w),
              child: FadeInImage.assetNetwork(
                placeholder: R.ASSETS_PLACEHOLDER_WEBP,
                image: API.image(e.url!),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    R.ASSETS_PLACEHOLDER_WEBP,
                  );
                },
              ),
            );
          }).toList(),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }

  Widget _buildTile(String asset, String title, String subTitle) {
    return Row(
      children: [
        AkuBox.h(56),
        Image.asset(
          asset,
          height: 40.w,
          width: 40.w,
        ),
        AkuBox.w(4),
        Text(
          title,
          style: TextStyle(
            fontSize: 28.sp,
            color: AppStyle.minorTextColor,
          ),
        ),
        Spacer(),
        Text(
          subTitle,
          style: TextStyle(
            fontSize: 28.sp,
            color: AppStyle.primaryTextColor,
          ),
        ),
      ],
    );
  }
}
