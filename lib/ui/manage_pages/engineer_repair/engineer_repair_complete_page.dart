import 'dart:io';

import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/const/resource.dart';
import 'package:aku_new_community_manager/json_models/manager/engineer_repair/engineer_repair_detail_model.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/tools/widget_tool.dart';
import 'package:aku_new_community_manager/ui/manage_pages/engineer_repair/engineer_repair_func.dart';
import 'package:aku_new_community_manager/ui/manage_pages/engineer_repair/engineer_repair_map.dart';
import 'package:aku_new_community_manager/ui/widgets/app_widgets/bee_pick_image_widget.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/aku_title_box.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class EngineerRepairCompletePage extends StatefulWidget {
  final EngineerRepairDetailModel detailModel;

  const EngineerRepairCompletePage({Key? key, required this.detailModel})
      : super(key: key);

  @override
  _EngineerRepairCompletePageState createState() =>
      _EngineerRepairCompletePageState();
}

class _EngineerRepairCompletePageState
    extends State<EngineerRepairCompletePage> {
  TextEditingController _reportDetailController = TextEditingController();
  TextEditingController _materialController = TextEditingController();
  List<File> _files = [];

  @override
  void dispose() {
    _materialController.dispose();
    _reportDetailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '维修完成',
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.w),
        children: [
          _buildInfo(),
          16.w.heightBox,
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                '维修结果'.text.size(36.sp).color(kTextPrimaryColor).make(),
                40.w.heightBox,
                '处理描述'.text.size(28.sp).color(kTextPrimaryColor).make(),
                24.w.heightBox,
                _buildTextField(_reportDetailController, '请描述维修结果'),
                24.w.heightBox,
                '材料清单'.text.size(28.sp).color(kTextPrimaryColor).make(),
                24.w.heightBox,
                _buildTextField(_materialController, '请填写材料清单'),
                40.w.heightBox,
                '上传维修完成照片'.text.size(28.sp).color(kTextPrimaryColor).make(),
                24.w.heightBox,
                BeePickImageWidget(onChanged: (value) {
                  _files.clear();
                  _files.addAll(value);
                  setState(() {});
                }),
              ],
            ),
          ),
        ],
      ),
      bottom: AkuBottomButton(
        title: '立即提交',
        onTap: () async {
          Function cancel = BotToast.showLoading();
          List<String> urls = [];
          urls = await EngineerRepairFunc.uploadCompleteImages(_files);
          var result = await EngineerRepairFunc.complete(widget.detailModel.id,
              _reportDetailController.text, _materialController.text, urls);
          cancel();
          if (result) {
            Get.back();
            Get.back();
          }
        },
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText) {
    return Container(
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
        controller: controller,
        autofocus: false,
        onChanged: (value) {
          setState(() {});
        },
        decoration: InputDecoration(
          hintText: hintText,
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
    );
  }

  _buildInfo() {
    return AkuTitleBox(
      title: '报修信息',
      suffix: Text(
        ERMap.statusString(widget.detailModel.status),
        style: TextStyle(color: Color(0xFFFF4501)),
      ),
      children: [
        AkuBox.h(16),
        _buildTile(
          R.ASSETS_MESSAGE_IC_PEOPLE_PNG,
          '报修人',
          widget.detailModel.createName,
        ),
        _buildTile(
          R.ASSETS_MESSAGE_IC_PHONE_PNG,
          '联系电话',
          widget.detailModel.createTel,
        ),
        _buildTile(R.ASSETS_MESSAGE_IC_AREA_PNG, '报修区域',
            '${S.of(context)!.tempPlotName}'),
        AkuBox.h(8),
        Text(
          widget.detailModel.reportDetail,
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
          children: widget.detailModel.imgUrls.map((e) {
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
