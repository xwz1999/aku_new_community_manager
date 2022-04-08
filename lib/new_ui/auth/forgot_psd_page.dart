import 'package:aku_new_community_manager/new_ui/auth/sign_func.dart';
import 'package:aku_new_community_manager/new_ui/auth/widget/login_button_widget.dart';
import 'package:aku_new_community_manager/new_ui/auth/widget/tel_textfield.dart';
import 'package:aku_new_community_manager/tools/user_tool.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'forgot_set_psd_page.dart';

class ForgotPsdPage extends StatefulWidget {
  const ForgotPsdPage({Key? key}) : super(key: key);

  @override
  _ForgotPsdPageState createState() => _ForgotPsdPageState();
}

class _ForgotPsdPageState extends State<ForgotPsdPage> {
  TextEditingController _telController = TextEditingController();

  @override
  void dispose() {
    _telController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              '忘记密码'
                  .text
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
              '为了安全，我们会向你的手机发送验证码'
                  .text
                  .size(28.sp)
                  .color(Colors.black.withOpacity(0.45))
                  .make(),
              Spacer(),
            ],
          ),
          144.w.heightBox,
          TelTextField(
            controller: _telController,
            onChange: (text) {
              setState(() {});
            },
          ),
          100.w.heightBox,
          LoginButtonWidget(
              onTap: _telController.text.isNotEmpty
                  ? () async {
                      if (!RegexUtil.isMobileSimple(_telController.text)) {
                        BotToast.showText(text: '请输入正确的手机号！');
                        return;
                      }
                      var base = await SignFunc.sendForgotMessageCode(
                          _telController.text,
                          UserTool.appProvider.pickedCityAndCommunity!
                              .communityModel!.id);
                      if (base.success) {
                        Get.to(() => ForgotSetPsdPage(
                              tel: _telController.text,
                            ));
                        UserTool.appProvider.startTimer();
                      } else {
                        BotToast.showText(text: base.msg);
                      }
                    }
                  : null,
              text: '下一步'),
        ],
      ),
    );
  }
}
