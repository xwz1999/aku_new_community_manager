import 'dart:io';

import 'package:aku_new_community_manager/const/saas_api.dart';
import 'package:aku_new_community_manager/new_ui/work_order/work_order_func.dart';
import 'package:aku_new_community_manager/ui/widgets/app_widgets/bee_pick_image_widget.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/common/bee_long_button.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:velocity_x/src/extensions/num_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';

class ReportProgress extends StatefulWidget {
  final int id;

  const ReportProgress({Key? key, required this.id}) : super(key: key);

  @override
  _ReportProgressState createState() => _ReportProgressState();
}

class _ReportProgressState extends State<ReportProgress> {
  TextEditingController _textEditingController = TextEditingController();
  List<File> _photos = [];

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '工单报告',
      body: ListView(
        children: [
          24.w.heightBox,
          Container(
            padding: EdgeInsets.all(32.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16.w)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    '进度汇报'
                        .text
                        .size(28.sp)
                        .color(Colors.black.withOpacity(0.45))
                        .make(),
                  ],
                ),
                32.w.heightBox,
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(16.w)),
                  child: TextField(
                    controller: _textEditingController,
                    autofocus: false,
                    onChanged: (text) => setState(() {}),
                    minLines: 5,
                    maxLength: 200,
                    maxLines: 20,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          32.w.heightBox,
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.06),
                borderRadius: BorderRadius.circular(16.w)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    '上传图片'
                        .text
                        .size(28.sp)
                        .color(Colors.black.withOpacity(0.45))
                        .make(),
                    Spacer(),
                    '建议上传图片不超过6张'
                        .text
                        .size(24.sp)
                        .color(Colors.black.withOpacity(0.25))
                        .make(),
                  ],
                ),
                24.w.heightBox,
                BeePickImageWidget(
                    maxCount: 6,
                    onChanged: (value) {
                      _photos = value;
                    }),
              ],
            ),
          )
        ],
      ),
      bottom: Padding(
        padding: EdgeInsets.only(
            left: 32.w,
            right: 32.w,
            bottom: MediaQuery.of(context).padding.bottom + 32.w),
        child: BeeLongButton(
            onPressed: () async {
              if (!canTap) {
                return;
              }
              var cancel = BotToast.showLoading();
              var imgUrls = <String>[];
              try {
                imgUrls = await NetUtil()
                    .uploadFiles(_photos, SAASAPI.other.file.uploadImg);
              } catch (e) {
                print(e.toString());
              }
              try {
                var re = await WorkOrderFuc.reportProgress(
                    content: _textEditingController.text,
                    imgUrls: imgUrls,
                    workOrderId: widget.id);
                if (re) {
                  Get.back();
                }
              } catch (e) {
                print(e.toString());
              }
              cancel();
            },
            text: '确认发布'),
      ),
    );
  }

  bool get canTap {
    if (_textEditingController.text.isEmpty) {
      BotToast.showText(text: '请输入具体需求');
      return false;
    }
    return true;
  }
}
