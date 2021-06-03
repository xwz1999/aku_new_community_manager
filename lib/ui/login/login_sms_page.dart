// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:aku_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:flutter/material.dart';

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/home/home_page.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_back_button.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';

class LoginSMSPage extends StatefulWidget {
  final String phone;
  LoginSMSPage({Key key, this.phone}) : super(key: key);

  @override
  _LoginSMSPageState createState() => _LoginSMSPageState();
}

class _LoginSMSPageState extends State<LoginSMSPage> {
  TextEditingController _textEditingController = TextEditingController();
  int _count = 60;
  Timer _countTimer;
  bool get canResend => _count <= 0;
  String get countString {
    if (_count <= 0)
      return '';
    else
      return '$_count\s';
  }

  startTick() {
    _count = 60;
    _countTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_count >= 0)
        _count--;
      else {
        _countTimer?.cancel();
      }
      setState(() {});
    });
  }

  sendSMS() {
    NetUtil().post(
      API.auth.sendSMS,
      params: {'tel': widget.phone},
      showMessage: true,
    );
  }

  @override
  void initState() {
    super.initState();
    sendSMS();
    startTick();
  }

  @override
  void dispose() {
    _textEditingController?.dispose();
    _countTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return AkuScaffold(
      backgroundColor: Colors.white,
      leading: AkuBackButton(),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 32.w,
          vertical: 40.w,
        ),
        children: [
          Text(
            '请输入短信验证码',
            style: TextStyle(
              color: AppStyle.primaryTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 48.sp,
            ),
          ),
          AkuBox.h(16),
          Text(
            '已向${widget.phone}发送了一个验证码',
            style: TextStyle(
              color: AppStyle.primaryTextColor,
              fontSize: 24.sp,
            ),
          ),
          AkuBox.h(160),
          PinInputTextField(
            controller: _textEditingController,
            autoFocus: true,
            decoration: UnderlineDecoration(
              textStyle: TextStyle(
                color: kTextPrimaryColor,
                fontSize: 32.sp,
              ),
              lineHeight: 1.w,
              colorBuilder: FixedColorBuilder(Color(0xFFE8E8E8)),
            ),
            onChanged: (text) async {
              if (text.length == 6) {
                Function cancel = BotToast.showLoading();
                Response response = await NetUtil().dio.post(
                  API.auth.login,
                  data: {'tel': widget.phone, 'code': text},
                );
                if (response.data['status'] == true) {
                  await userProvider.setLogin(response.data['token']);
                  Get.offAll(HomePage());
                } else {
                  _textEditingController.clear();
                  BotToast.showText(text: '登陆失败');
                }
                cancel();
              }

              // final userProvider =
              //     Provider.of<UserProvider>(context, listen: false);
              // if (text == '000000') {
              //   userProvider.setUserInfo(UserInfoModel.manager());
              //   Get.offAll(HomePage());
              // } else if (text == '000001') {
              //   userProvider.setUserInfo(UserInfoModel.fixer());
              //   Get.offAll(HomePage());
              // } else if (text == '000002') {
              //   userProvider.setUserInfo(UserInfoModel.security());
              //   Get.offAll(HomePage());
              // } else if (text == '000003') {
              //   userProvider.setUserInfo(UserInfoModel.property());
              //   Get.offAll(HomePage());
              // } else {
              //   if (text.length == 6) BotToast.showText(text: '验证码错误');
              // }
            },
          ),
          AkuBox.h(40),
          Row(
            children: [
              AkuMaterialButton(
                onPressed: canResend
                    ? () {
                        sendSMS();
                        startTick();
                      }
                    : null,
                child: Text(
                  '重新发送 $countString',
                  style: TextStyle(
                    color: canResend
                        ? AppStyle.secondaryColor
                        : AppStyle.minorTextColor,
                    fontSize: 28.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
