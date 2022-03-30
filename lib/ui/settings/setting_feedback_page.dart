// Dart imports:
import 'dart:io';

// Project imports:
import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/saas_models/net_model/base_model.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/tools/screen_tool.dart';
import 'package:aku_new_community_manager/ui/widgets/app_widgets/bee_pick_image_widget.dart';
// Flutter imports:
import 'package:aku_new_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
// Package imports:
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingFeedBackPage extends StatefulWidget {
  SettingFeedBackPage({Key? key}) : super(key: key);

  @override
  _SettingFeedBackPageState createState() => _SettingFeedBackPageState();
}

class _SettingFeedBackPageState extends State<SettingFeedBackPage> {
  late List<File> _files;
  List<String?>? _imgeUrls;
  String? _content;
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '意见反馈',
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            height: 20.w,
            color: AppStyle.backgroundColor,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 24.w,
              horizontal: 32.w,
            ),
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) {
                    _content = value;
                  },
                  minLines: 5,
                  maxLines: 99,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    hintText: '请输入你的意见和建议',
                    hintStyle: TextStyle(
                      color: Color(0xFF999999),
                      fontSize: 28.sp,
                    ),
                  ),
                ),
                BeePickImageWidget(
                  size: 202.w,
                  onChanged: (newFile) {
                    _files = newFile;
                  },
                )
              ],
            ),
            decoration: BoxDecoration(
              color: AppStyle.backgroundColor,
              borderRadius: BorderRadius.circular(16.w),
            ),
          ),
        ],
      ),
      bottom: AkuMaterialButton(
        onPressed: () async {
          _imgeUrls =
              await NetUtil().uploadFiles(_files, API.upload.uploadAdvices);
          BaseModel baseModel =
              await NetUtil().post(API.user.feedbackSubmit, params: {
            "content": _content,
            "fileUrls": _imgeUrls,
          });
          if (baseModel.success) {
            BotToast.showText(text: baseModel.msg);
            Get.back();
          } else {
            BotToast.showText(text: baseModel.msg);
          }
        },
        child: Text('提交'),
        color: AppStyle.minorColor,
      ),
    );
  }
}
