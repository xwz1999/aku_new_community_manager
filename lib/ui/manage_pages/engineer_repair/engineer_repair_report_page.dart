import 'dart:io';

import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/manage_pages/engineer_repair/engineer_repair_func.dart';
import 'package:aku_community_manager/ui/widgets/app_widgets/aku_pick_image_widget.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class EngineerRepairReportPage extends StatefulWidget {
  final int repairId;

  const EngineerRepairReportPage({Key? key, required this.repairId})
      : super(key: key);

  @override
  _EngineerRepairReportPageState createState() =>
      _EngineerRepairReportPageState();
}

class _EngineerRepairReportPageState extends State<EngineerRepairReportPage> {
  String _reportDetail = '';
  List<File> _files = [];

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '工作汇报',
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.w),
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                '维修进度'.text.size(36.sp).color(kTextPrimaryColor).make(),
                40.w.heightBox,
                '工作描述'.text.size(28.sp).color(kTextPrimaryColor).make(),
                24.w.heightBox,
                Container(
                  width: 686.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    border: Border.all(
                      width: 2.w,
                      color: Color(0xFFE8E8E8),
                    ),
                  ),
                  child: TextField(
                    autofocus: false,
                    onChanged: (value) {
                      setState(() {
                        _reportDetail = value;
                      });
                    },
                    minLines: 5,
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: '请输入具体描述',
                      hintStyle: TextStyle(
                        fontSize: 28.sp,
                        color: kTextSubColor,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 24.w, horizontal: 24.w),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
                40.w.heightBox,
                '上传照片'.text.size(28.sp).color(kTextPrimaryColor).make(),
                24.w.heightBox,
                AkuPickImageWidget(onChanged: (files) {
                  _files.clear();
                  _files.addAll(files);
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
          List<String> urls = [];
          Function cancel = BotToast.showLoading();
          urls = await EngineerRepairFunc.uploadReportImages(_files);
          var result = await EngineerRepairFunc.submitReport(
              widget.repairId, _reportDetail, urls);
          if (result) {
            Get.back();
          }
          cancel();
        },
      ),
    );
  }
}
