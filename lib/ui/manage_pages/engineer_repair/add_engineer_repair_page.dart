import 'dart:io';

import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/manage_pages/engineer_repair/engineer_repair_func.dart';
import 'package:aku_community_manager/ui/widgets/app_widgets/aku_pick_image_widget.dart';
import 'package:aku_community_manager/ui/widgets/app_widgets/aku_single_check_button.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:power_logger/power_logger.dart';
import 'package:velocity_x/velocity_x.dart';

class AddEngineerRepairPage extends StatefulWidget {
  const AddEngineerRepairPage({Key? key}) : super(key: key);

  @override
  _AddEngineerRepairPageState createState() => _AddEngineerRepairPageState();
}

class _AddEngineerRepairPageState extends State<AddEngineerRepairPage> {
  int _serviceType = 1;
  List<File> _photos = [];
  String _area = '';
  String _detail = '';

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '工程报修',
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 32.w, horizontal: 32.w),
        children: [
          '报修区域'.text.size(28.sp).color(kTextSubColor).make(),
          55.w.heightBox,
          Row(
            children: [
              Image.asset(
                R.ASSETS_MANAGE_ESTATE_PNG,
                width: 60.w,
                height: 60.w,
              ),
              36.w.widthBox,
              '${S.of(context)!.tempPlotName}'.text.size(28.sp).make(),
            ],
          ),
          24.w.heightBox,
          Container(
            width: 686.w,
            height: 87.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              border: Border.all(
                width: 2.w,
                color: Color(0xFFE8E8E8),
              ),
            ),
            child: TextField(
              autofocus: false,
              inputFormatters: [LengthLimitingTextInputFormatter(12)],
              onChanged: (value) {
                setState(() {
                  _area = value;
                });
              },
              decoration: InputDecoration(
                hintText: '请填写需要维修的区域，不超过12个字',
                hintStyle: TextStyle(
                  fontSize: 28.sp,
                  color: kTextSubColor,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 24.w, horizontal: 24.w),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          40.w.heightBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  '请选择服务类型'.text.color(kTextPrimaryColor).size(32.sp).make()
                ],
              ),
              32.w.heightBox,
              Row(
                children: [
                  AkuSingleCheckButton(
                    text: '工程维修',
                    value: 1,
                    gropValue: _serviceType,
                    onPressed: () {},
                  ),
                  80.w.widthBox,
                  // AkuSingleCheckButton(
                  //   text: '异常',
                  //   value: 1,
                  //   gropValue: 1,
                  //   onPressed: () {
                  //   },
                  // ),
                ],
              ),
              36.w.heightBox,
              '请输入报修内容'.text.size(28.sp).color(kTextPrimaryColor).make(),
              36.w.heightBox,
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
                      _detail = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: '请简要描述一下你要告知我的事情，以便于我们更好地处理…',
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
          ).box.make(),
          36.w.heightBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  '添加照片信息'.text.color(kTextPrimaryColor).size(32.sp).make()
                ],
              ),
              32.w.heightBox,
              AkuPickImageWidget(
                onChanged: (files) {
                  _photos = files;
                  setState(() {});
                },
              )
            ],
          ).box.make(),
        ],
      ),
      bottom: AkuBottomButton(
        title: '确认提交',
        onTap: () async {
          Function cancel = BotToast.showLoading();
          List<String> urls = [];
          try {
            urls = await NetUtil().uploadFiles(
              _photos,
              API.upload.uploadEngineerRepair,
            );
          } catch (e) {
            LoggerData.addData(e.toString());
          }
          var result = await EngineerRepairFunc.addEngineerRepair(
              _area, _serviceType, _detail, urls);
          if (result) {
            Get.back();
          }
          cancel();
        },
      ),
    );
  }
}
