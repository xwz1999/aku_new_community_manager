// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:bot_toast/bot_toast.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

// Project imports:
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/ui/settings/update_userinfo_func.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';

class TelChangePage extends StatefulWidget {
  TelChangePage({Key? key}) : super(key: key);

  @override
  _TelChangePageState createState() => _TelChangePageState();
}

class _TelChangePageState extends State<TelChangePage> {
  TextEditingController? _oldTelController;
  TextEditingController? _newTelController;
  TextEditingController? _codeController;
  Timer? _timer;
  bool get validPhone => RegexUtil.isMobileSimple(_newTelController!.text);
  bool get _canGetCode {
    bool timeActive = _timer?.isActive ?? false;
    return (!timeActive) && validPhone;
  }

  startTick() {
    _timer = Timer.periodic(Duration(seconds: 1), (_timer) {
      if (_timer.tick >= 60) {
        _timer.cancel();
        // _timer = null;
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController();
    _newTelController = TextEditingController();
    _oldTelController = TextEditingController();
  }

  @override
  void dispose() {
    _codeController?.dispose();
    _newTelController?.dispose();
    _oldTelController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return AkuScaffold(
      title: '修改手机',
      body: Material(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: ListView(
            children: [
              55.w.heightBox,
              '旧号码'.text.black.size(28.sp).make(),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]*'))
                ],
                controller: _oldTelController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintText: '请输入旧号码',
                  hintStyle:
                      TextStyle(color: Color(0xFF999999), fontSize: 34.sp),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFFEEEEEE),
                    width: 1.w,
                  )),
                ),
              ),
              24.w.heightBox,
              '新号码'.text.black.size(28.sp).make(),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]*')),
                ],
                controller: _newTelController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  suffixIconConstraints:
                      BoxConstraints(minHeight: 0.w, minWidth: 0.w),
                  suffixIcon: MaterialButton(
                    onPressed: _canGetCode
                        ? () async {
                            BaseModel baseModel =
                                await UpdateUserInfoFunc.sendTelUpdateCode(
                                    _newTelController!.text);
                            if (baseModel.status!) {
                              startTick();
                            } else {}
                          }
                        : () {},
                    child: _timer?.isActive ?? false
                        ? '${60 - _timer!.tick}'
                            .text
                            .color(Color(0xFFFFC40C))
                            .size(28.sp)
                            .make()
                        : '获取验证码'
                            .text
                            .color(Color(0xFFFFC40C))
                            .size(28.sp)
                            .make(),
                    padding: EdgeInsets.zero,
                    minWidth: 177.w,
                    height: 62.w,
                    elevation: 0,
                    hoverElevation: 0,
                    focusElevation: 0,
                    highlightElevation: 0,
                    disabledElevation: 0,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                      color: Color(0xFFFFC40C),
                      width: 1.w,
                    )),
                  ),
                  contentPadding: EdgeInsets.only(top: 20.w),
                  hintText: '请输入新号码',
                  hintStyle:
                      TextStyle(color: Color(0xFF999999), fontSize: 34.sp),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFEEEEEE),
                      width: 1.w,
                    ),
                  ),
                ),
              ),
              24.w.heightBox,
              '验证码'.text.black.size(28.sp).make(),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]*'))
                ],
                controller: _codeController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintText: '请输入验证码',
                  hintStyle:
                      TextStyle(color: Color(0xFF999999), fontSize: 34.sp),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFFEEEEEE),
                    width: 1.w,
                  )),
                ),
              ),
              64.w.heightBox,
              MaterialButton(
                onPressed: () async {
                  if (TextUtil.isEmpty(_oldTelController!.text)) {
                    BotToast.showText(text: '旧手机号不能为空');
                  } else if (TextUtil.isEmpty(_newTelController!.text)) {
                    BotToast.showText(text: '新手机号不能为空');
                  } else if (TextUtil.isEmpty(_codeController!.text)) {
                    BotToast.showText(text: '验证码不能为空');
                  } else {
                    BaseModel baseModel = await UpdateUserInfoFunc.updateTel(
                        _oldTelController!.text,
                        _newTelController!.text,
                        _codeController!.text);
                    if (baseModel.status!) {
                      userProvider.setTel(_newTelController!.text);
                      Get.back();
                    } else {
                      BotToast.showText(text: baseModel.message!);
                    }
                  }
                },
                child: '保存'.text.black.size(32.sp).make(),
                color: Color(0xFFFFC40C),
                elevation: 0,
                minWidth: 686.w,
                height: 85.w,
              ),
              24.w.heightBox,
              '注：新手机号将作为您的登录凭证'
                  .text
                  .color(Color(0xFF999999))
                  .size(24.sp)
                  .maxLines(2)
                  .make()
            ],
          ),
        ),
      ),
    );
  }
}
