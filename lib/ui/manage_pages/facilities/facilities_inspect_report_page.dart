// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/models/manager/facilities/facilities_check_list_model.dart';
import 'package:aku_new_community_manager/saas_models/net_model/base_model.dart';
// Project imports:
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/ui/widgets/app_widgets/bee_pick_image_widget.dart';
import 'package:aku_new_community_manager/ui/widgets/app_widgets/aku_single_check_button.dart';
import 'package:aku_new_community_manager/ui/widgets/app_widgets/bee_grid_image_view.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_button.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class FacilitiesInspectReportPage extends StatefulWidget {
  final int facilitiesType;
  final int id;
  final FacilitiesCheckListModel? model;

  FacilitiesInspectReportPage({
    Key? key,
    /*required*/ required this.facilitiesType,
    /*required*/ required this.id,
    this.model,
  }) : super(key: key);

  @override
  _FacilitiesInspectReportPageState createState() =>
      _FacilitiesInspectReportPageState();
}

class _FacilitiesInspectReportPageState
    extends State<FacilitiesInspectReportPage> {
  // List<File>? _selfPhotos;
  late List<File> _scenePhotos;
  String? _describtion;
  int _scene = 1; //设施设备状况 1为正常 2为异常
  bool get editEnable => widget.model == null;

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '检查报告',
      body: ListView(
        children: [
          // _basicMessageCard(),
          _descriptionCard(
            widget.facilitiesType == 1 ? '设施情况' : '设备情况',
          ),
          _scenePhotoCard(),
          // _selfPhotoCard(),
        ],
      ),
      bottom: _bottomSubmitButton(),
    );
  }

  Widget _bottomSubmitButton() {
    return AkuButton(
      onPressed: () async {
        List<String?> _scenePhotoUrl = await NetUtil().uploadFiles(
          _scenePhotos,
          API.upload.uploadFacilitiCheckPhoto,
        );

        BaseModel baseModel =
            await NetUtil().post(API.manage.submitFacilitiesCheckInfo, params: {
          "id": widget.id,
          "situation": _scene,
          "detail": _describtion,
          "imgUrls": _scenePhotoUrl,
        });
        if (baseModel.success) {
          Get.back();
        }
        BotToast.showText(text: baseModel.msg);
      },
      width: double.infinity,
      height: 100.w,
      child: '立即提交'.text.color(kTextPrimaryColor).bold.size(32.sp).make(),
      color: Color(0xFFFFC40C),
      padding: EdgeInsets.symmetric(vertical: 26.w),
    ).pOnly(bottom: MediaQuery.of(context).padding.bottom);
  }

  // Widget _basicMessageCard() {
  //   return Column(
  //     children: [
  //       Row(
  //         children: [
  //           '基础信息'.text.size(32.sp).color(kTextPrimaryColor).bold.make(),
  //           Spacer(),
  //           '检查中'
  //               .text
  //               .size(30.sp)
  //               .color(FacilitiesMap.insepectColor[2]!)
  //               .bold
  //               .make()
  //         ],
  //       ),
  //       16.w.heightBox,
  //       _buildTile(R.ASSETS_MESSAGE_IC_PEOPLE_PNG, '检查人', '杨建'),
  //       12.w.heightBox,
  //       _buildTile(R.ASSETS_MESSAGE_IC_PHONE_PNG, '联系电话', '15013103152'),
  //       12.w.heightBox,
  //       _buildTile(R.ASSETS_MANAGE_ADDRESS_PNG, '检查场地', '户外3号篮球场'),
  //       12.w.heightBox,
  //       _buildTile(R.ASSETS_MANAGE_CLOCK_PNG, '规定任务时间', '20200202020202020'),
  //     ],
  //   )
  //       .box
  //       .width(double.infinity)
  //       .padding(EdgeInsets.symmetric(vertical: 34.w, horizontal: 32.w))
  //       .color(Colors.white)
  //       .make();
  // }

  // Widget _buildTile(String icon, String title, String text,
  //     {Color color = kTextSubColor}) {
  //   return Row(
  //     children: [
  //       Image.asset(
  //         icon,
  //         width: 40.w,
  //         height: 40.w,
  //       ),
  //       20.w.widthBox,
  //       title.text.size(24.sp).color(kTextSubColor).make(),
  //       Spacer(),
  //       text.text.size(24.sp).color(color).make(),
  //     ],
  //   );
  // }

  Widget _descriptionCard(
    String title,
    // int index,
  ) {
    return Column(
      children: [
        Row(
          children: ['$title'.text.color(kTextPrimaryColor).size(32.sp).make()],
        ),
        32.w.heightBox,
        Row(
          children: [
            AkuSingleCheckButton(
              text: '正常',
              value: 1,
              gropValue: _scene,
              onPressed: !editEnable
                  ? () {}
                  : () {
                      _scene = 1;
                      setState(() {});
                    },
            ),
            80.w.widthBox,
            AkuSingleCheckButton(
              text: '异常',
              value: 2,
              gropValue: _scene,
              onPressed: !editEnable
                  ? () {}
                  : () {
                      _scene = 2;
                      setState(() {});
                    },
            ),
          ],
        ),
        32.w.heightBox,
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
          child: !editEnable
              ? (widget.model!.detail ?? '').text.size(28.sp).black.make()
              : TextField(
                  minLines: 5,
                  maxLines: 10,
                  autofocus: false,
                  onChanged: (value) {
                    _describtion = value;
                  },
                  decoration: InputDecoration(
                    hintText: '请详细描述异常情况',
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

  // Widget _selfPhotoCard() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Row(
  //         children: [
  //           '3.巡更人员自拍人脸'.text.color(kTextPrimaryColor).size(32.sp).bold.make()
  //         ],
  //       ),
  //       32.w.heightBox,
  //       AkuPickImageWidget(
  //         description: '上传自拍',
  //         onChanged: (files) {
  //           _selfPhotos = files;
  //           setState(() {});
  //         },
  //       ),
  //     ],
  //   )
  //       .box
  //       .color(Colors.white)
  //       .padding(EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w))
  //       .make();
  // }

  Widget _scenePhotoCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row(
        //   children: [
        //     '3.巡更人员拍摄现场'.text.color(kTextPrimaryColor).size(32.sp).bold.make()
        //   ],
        // ),
        32.w.heightBox,
        !editEnable
            ? BeeGridImageView(
                urls: (widget.model!.imgList ?? [])
                    .map((e) => API.image(e.url ?? ''))
                    .toList(),
              )
            : BeePickImageWidget(
                description: '上传现场照片',
                onChanged: (files) {
                  _scenePhotos = files;
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
}
