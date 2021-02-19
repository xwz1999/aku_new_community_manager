// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:common_utils/common_utils.dart';
import 'package:extended_text/extended_text.dart';
import 'package:get/route_manager.dart';

// Project imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/agreements/agreement_page.dart';
import 'package:aku_community_manager/ui/agreements/privacy_page.dart';
import 'package:aku_community_manager/ui/login/login_sms_page.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_back_button.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _textController = TextEditingController();

  bool get phoneValid {
    return RegexUtil.isMobileSimple(_textController.text);
  }

  bool get emptyText {
    return TextUtil.isEmpty(_textController.text);
  }

  @override
  void dispose() {
    _textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      backgroundColor: Colors.white,
      leading: AkuBackButton.close(),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 40.w,
          horizontal: 32.w,
        ),
        children: [
          Text(
            '欢迎登录小蜜蜂',
            style: TextStyle(
              color: AppStyle.primaryTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 48.sp,
            ),
          ),
          AkuBox.h(184),
          Text(
            '手机号码',
            style: TextStyle(
              color: AppStyle.primaryTextColor,
              fontSize: 24.sp,
            ),
          ),
          Container(
            width: double.infinity,
            child: TextField(
              controller: _textController,
              onChanged: (text) {
                setState(() {});
              },
              maxLength: 11,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                counterText: '',
                suffixIconConstraints: BoxConstraints(
                  minHeight: 0,
                  minWidth: 0,
                ),
                suffixIcon: emptyText
                    ? SizedBox()
                    : GestureDetector(
                        onTap: () {
                          _textController.clear();
                          setState(() {});
                        },
                        child: Icon(
                          CupertinoIcons.clear_circled_solid,
                          size: 30.w,
                          color: Color(0xFF999999),
                        ),
                      ),
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
              color: AppStyle.primaryColor,
              onPressed: phoneValid
                  ? () => Get.off(LoginSMSPage(phone: _textController.text))
                  : null,
              nullColor: Color(0xFFFFE67D),
              radius: 8.w,
              child: Text(
                '获取验证码',
                style: TextStyle(
                  color: phoneValid
                      ? AppStyle.primaryTextColor
                      : AppStyle.minorTextColor,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                  onTap: () {
                    Get.to(AgreementPage());
                  },
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
                  onTap: () {
                    Get.to(PrivacyPage());
                  },
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
