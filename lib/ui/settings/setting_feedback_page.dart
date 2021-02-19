// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:aku_ui/common_widgets/aku_material_button.dart';

// Project imports:
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

class SettingFeedBackPage extends StatefulWidget {
  SettingFeedBackPage({Key key}) : super(key: key);

  @override
  _SettingFeedBackPageState createState() => _SettingFeedBackPageState();
}

class _SettingFeedBackPageState extends State<SettingFeedBackPage> {
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
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
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
        onPressed: () {},
        child: Text('提交'),
        color: AppStyle.minorColor,
      ),
    );
  }
}
