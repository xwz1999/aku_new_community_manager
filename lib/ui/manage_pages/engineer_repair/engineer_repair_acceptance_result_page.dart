import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/json_models/manager/engineer_repair/engineer_repair_new_acceptance_record_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/manage_pages/engineer_repair/engineer_repair_acceptance_record_list_page.dart';
import 'package:aku_community_manager/ui/manage_pages/engineer_repair/engineer_repair_func.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_title_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class EngineerRepairAcceptanceResultPage extends StatefulWidget {
  final EngineerRepairNewAcceptanceRecordModel recordModel;

  const EngineerRepairAcceptanceResultPage(
      {Key? key, required this.recordModel})
      : super(key: key);

  @override
  _EngineerRepairAcceptanceResultPageState createState() =>
      _EngineerRepairAcceptanceResultPageState();
}

class _EngineerRepairAcceptanceResultPageState
    extends State<EngineerRepairAcceptanceResultPage> {
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '验收结果',
      body: ListView(
        children: [
          _buildAcceptanceResult(),
          16.w.heightBox,
          _buildRepairResult(),
          16.w.heightBox,
          GestureDetector(
            onTap: () async {
              List<EngineerRepairNewAcceptanceRecordModel> models = [];
              models.addAll(await EngineerRepairFunc.getAcceptanceRecordList(
                  widget.recordModel.repairEngineeringId));
              await Get.to(
                  () => EngineerRepairAcceptanceRecordListPage(models: models));
            },
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(32.w),
              child: Row(
                children: [
                  '查看验收记录'.text.size(28.sp).color(kTextPrimaryColor).make(),
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
      bottom: widget.recordModel.results == 1
          ? SizedBox()
          : AkuBottomButton(
              title: '开始整改',
              onTap: () async {
                var result = await EngineerRepairFunc.startRectification(
                    widget.recordModel.repairEngineeringId);
                if (result) {
                  Get.back();
                  Get.back();
                }
              },
            ),
    );
  }

  _buildAcceptanceResult() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          '验收单位'.text.size(28.sp).color(kTextSubColor).make(),
          24.w.heightBox,
          '${widget.recordModel.acceptancePeopleName}'
              .text
              .size(32.sp)
              .color(kTextPrimaryColor)
              .bold
              .make(),
          40.w.heightBox,
          '验收结果'.text.size(28.sp).color(kTextSubColor).make(),
          24.w.heightBox,
          '${widget.recordModel.results == 1 ? '通过' : '驳回'}'
              .text
              .size(32.sp)
              .color(Colors.red)
              .bold
              .make(),
          40.w.heightBox,
          '反馈意见'.text.size(28.sp).color(kTextSubColor).make(),
          24.w.heightBox,
          widget.recordModel.advice.text
              .size(28.sp)
              .color(kTextPrimaryColor)
              .make(),
          40.w.heightBox,
          '到现场验收照片'.text.size(28.sp).color(kTextSubColor).make(),
          24.w.heightBox,
          GridView(
            padding: EdgeInsets.only(top: 16.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.w,
            ),
            children: widget.recordModel.acceptanceImgLists.map((e) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(4.w),
                child: FadeInImage.assetNetwork(
                    placeholder: R.ASSETS_PLACEHOLDER_WEBP,
                    image: API.image(e.url!)),
              );
            }).toList(),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
          40.w.heightBox,
          '反馈时间'.text.size(28.sp).color(kTextSubColor).make(),
          24.w.heightBox,
          widget.recordModel.acceptanceDate.text
              .size(28.sp)
              .color(kTextPrimaryColor)
              .make(),
        ],
      ),
    );
  }

  _buildRepairResult() {
    return AkuTitleBox(
      title: '维修结果',
      children: [
        AkuBox.h(16),
        _buildTile(
          R.ASSETS_MESSAGE_IC_PEOPLE_PNG,
          '处理描述',
          widget.recordModel.content,
        ),
        _buildTile(
          R.ASSETS_MESSAGE_IC_PHONE_PNG,
          '材料清单',
          widget.recordModel.billMaterials,
        ),
        _buildTile(R.ASSETS_MESSAGE_IC_AREA_PNG, '完成时间',
            widget.recordModel.createDate),
        AkuBox.h(8),
        Text(
          '现场照片',
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
          children: widget.recordModel.maintenanceImgLists.map((e) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(4.w),
              child: FadeInImage.assetNetwork(
                  placeholder: R.ASSETS_PLACEHOLDER_WEBP,
                  image: API.image(e.url!)),
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
