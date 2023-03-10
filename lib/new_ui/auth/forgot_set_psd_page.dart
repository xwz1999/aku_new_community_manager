import 'package:aku_new_community_manager/new_ui/auth/other_login_page.dart';
import 'package:aku_new_community_manager/new_ui/auth/psd_verify.dart';
import 'package:aku_new_community_manager/new_ui/auth/sign_func.dart';
import 'package:aku_new_community_manager/new_ui/auth/widget/login_button_widget.dart';
import 'package:aku_new_community_manager/new_ui/auth/widget/psd_textfield.dart';
import 'package:aku_new_community_manager/provider/clock_timer_provider.dart';
import 'package:aku_new_community_manager/tools/user_tool.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class ForgotSetPsdPage extends StatefulWidget {
  final String tel;

  const ForgotSetPsdPage({Key? key, required this.tel}) : super(key: key);

  @override
  _ForgotSetPsdPageState createState() => _ForgotSetPsdPageState();
}

class _ForgotSetPsdPageState extends State<ForgotSetPsdPage> {
  TextEditingController _psdController = TextEditingController();
  TextEditingController _confirmPsdController = TextEditingController();
  TextEditingController _codeController = TextEditingController();

  PSDVERIFY get psdCheck =>
      PsdVerify.check(_psdController.text, _confirmPsdController.text);

  @override
  void initState() {
    _psdController.addListener(() {
      setState(() {});
    });
    _confirmPsdController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _psdController.removeListener(() {});
    _confirmPsdController.removeListener(() {});
    _psdController.dispose();
    _confirmPsdController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ClockTimerProvider clockTimer = Provider.of<ClockTimerProvider>(context);
    return AkuScaffold(
      title: '',
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          24.w.heightBox,
          Row(
            children: [
              48.w.widthBox,
              '?????? '
                  .richText
                  .withTextSpanChildren([
                    widget.tel.textSpan
                        .size(36.sp)
                        .color(Colors.red)
                        .bold
                        .make(),
                    ' ???????????????'
                        .textSpan
                        .size(36.sp)
                        .color(Colors.black.withOpacity(0.65))
                        .bold
                        .make()
                  ])
                  .size(36.sp)
                  .bold
                  .color(Colors.black.withOpacity(0.65))
                  .make(),
              Spacer(),
            ],
          ),
          16.w.heightBox,
          Row(
            children: [
              48.w.widthBox,
              '????????????6-20???????????????????????????????????????????????????'
                  .text
                  .size(28.sp)
                  .color(Colors.black.withOpacity(0.45))
                  .make(),
              Spacer(),
            ],
          ),
          144.w.heightBox,
          Container(
            width: 686.w,
            height: 94.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60.w),
              color: Colors.black.withOpacity(0.06),
            ),
            child: TextField(
              onChanged: (text) {
                setState(() {});
              },
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: _codeController,
              decoration: InputDecoration(
                  isDense: false,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
                  border: InputBorder.none,
                  hintText: '??????????????????',
                  suffixIconConstraints:
                      BoxConstraints(minHeight: 100.w, maxHeight: 100.w),
                  suffixIcon: GestureDetector(
                    onTap: () async {
                      var base = await SignFunc.sendMessageCode(
                          widget.tel,
                          UserTool.appProvider.pickedCityAndCommunity!
                              .communityModel!.id);
                      if (base.success) {
                        Get.to(() => ForgotSetPsdPage(
                              tel: widget.tel,
                            ));
                        clockTimer.startTimer();
                      } else {
                        BotToast.showText(text: base.msg);
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        '???${clockTimer.second < 60 ? '${clockTimer.second}??????????????????' : '???????????????'}'
                            .text
                            .size(28.sp)
                            .color(Color(0xFF5096F1))
                            .make(),
                        20.w.widthBox,
                      ],
                    ),
                  ),
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.25), fontSize: 28.sp)),
            ),
          ),
          24.w.heightBox,
          PsdTextField(controller: _psdController, hintText: '???????????????'),
          24.w.heightBox,
          PsdTextField(controller: _confirmPsdController, hintText: '?????????????????????'),
          16.w.heightBox,
          PsdVerify.checkString(psdCheck)
              .text
              .size(28.sp)
              .color(Color(0xFFCF1322).withOpacity(0.8))
              .make(),
          37.w.heightBox,
          LoginButtonWidget(
              onTap: (psdCheck == PSDVERIFY.correct &&
                      _codeController.text.isNotEmpty)
                  ? () async {
                      var result = await SignFunc.settingForgotPsd(
                          _psdController.text,
                          widget.tel,
                          _codeController.text);
                      if (result) {
                        Get.offAll(() => OtherLoginPage());
                      }
                    }
                  : null,
              text: '??????'),
        ],
      ),
    );
  }
}
