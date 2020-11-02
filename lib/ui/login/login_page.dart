import 'dart:ui';

import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_back_button.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:extended_text/extended_text.dart';
import 'package:flutter/material.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      backgroundColor: Colors.white,
      leading: AkuBackButton.close(),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 40.w,
              bottom: 184.w,
              left: 32.w,
            ),
            child: Text(
              '欢迎登录小蜜蜂',
              style: TextStyle(
                color: AppStyle.primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 48.sp,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Text(
              '手机号码',
              style: TextStyle(
                color: AppStyle.primaryTextColor,
                fontSize: 24.sp,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            width: double.infinity,
            child: TextField(
              autofocus: true,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFE8E8E8),
                    width: 1.w,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFE8E8E8),
                    width: 2.w,
                  ),
                ),
              ),
            ),
          ),
          AkuBox.h(80),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: AkuMaterialButton(
              color: AppStyle.minorColor,
              onPressed: () {},
              radius: 8.w,
              child: Text('获取验证码'),
            ),
          ),
        ],
      ),
      bottom: Container(
        height: 110.w,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 40.w),
        child: ExtendedText.rich(
          TextSpan(
            style: TextStyle(
              color: AppStyle.minorTextColor,
              fontSize: 22.sp,
            ),
            children: [
              TextSpan(
                text: '登录即代表您已同意我们的',
              ),
              ExtendedWidgetSpan(
                child: GestureDetector(
                  child: Text(
                    '《服务协议》',
                    style: TextStyle(
                      color: AppStyle.secondaryColor,
                      fontSize: 22.sp,
                    ),
                  ),
                ),
              ),
              TextSpan(
                text: '和',
              ),
              ExtendedWidgetSpan(
                child: GestureDetector(
                  child: Text(
                    '《隐私政策》',
                    style: TextStyle(
                      color: AppStyle.secondaryColor,
                      fontSize: 22.sp,
                    ),
                  ),
                ),
              ),
              TextSpan(
                text: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
