import 'package:aku_new_community_manager/new_ui/auth/sign_func.dart';
import 'package:aku_new_community_manager/new_ui/auth/widget/login_button_widget.dart';
import 'package:aku_new_community_manager/new_ui/auth/widget/psd_textfield.dart';
import 'package:aku_new_community_manager/new_ui/auth/widget/tel_textfield.dart';
import 'package:aku_new_community_manager/provider/app_provider.dart';
import 'package:aku_new_community_manager/tools/user_tool.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:power_logger/power_logger.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import 'code_message_page.dart';
import 'forgot_psd_page.dart';
import 'login_root_page.dart';

class OtherLoginPage extends StatefulWidget {
  const OtherLoginPage({Key? key}) : super(key: key);

  @override
  _OtherLoginPageState createState() => _OtherLoginPageState();
}

class _OtherLoginPageState extends State<OtherLoginPage> {
  PageController _controller = PageController();
  List<String> _tabs = ['验证码登录', '账号登录'];
  int _currentIndex = 0;
  TextEditingController _tel = TextEditingController();
  TextEditingController _psd = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _tel.dispose();
    _psd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AkuScaffold(
        title: '',
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Row(
              children: [
                24.w.widthBox,
                ..._tabs
                    .mapIndexed((e, index) => _tab(e, index, onTap: (value) {
                          _currentIndex = value;
                          _controller.jumpToPage(_currentIndex);
                          setState(() {});
                        }))
                    .toList(),
              ],
            ),
            Flexible(
              child: PageView(
                controller: _controller,
                children: [_verificationView(), _accountView()],
              ),
            ),
            BottomTip(),
          ],
        ),
      ),
    );
  }

  Widget _accountView() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      children: [
        140.w.heightBox,
        CommunityWidget(
          align: MainAxisAlignment.start,
        ),
        40.w.heightBox,
        TelTextField(
          controller: _tel,
          onChange: (String) {
            setState(() {});
          },
        ),
        40.w.heightBox,
        PsdTextField(
          controller: _psd,
        ),
        100.w.heightBox,
        LoginButtonWidget(
            onTap: () async {
              var check = checkInput();
              if (!check) {
                return;
              }
              var cancel = BotToast.showLoading();
              try {
                var response = await SignFunc.login(
                    _tel.text,
                    _psd.text,
                    UserTool.appProvider.pickedCityAndCommunity!.communityModel!
                        .id);
                if (response.data['success']) {
                  await UserTool.userProvider.setLogin(response.data['data']);
                  await UserTool.dataProvider.addHistories();
                } else {
                  BotToast.showText(text: response.data['msg']);
                }
              } catch (e) {
                print(e.toString());
                LoggerData.addData(e.toString());
              }
              cancel();
            },
            text: '登录'),
        24.w.heightBox,
        TextButton(
            onPressed: () {
              Get.to(() => ForgotPsdPage());
            },
            child: '忘记密码'.text.size(28.sp).color(Color(0xFF5096F1)).make())
      ],
    );
  }

  bool checkInput() {
    if (!RegexUtil.isMobileSimple(_tel.text)) {
      BotToast.showText(text: '请输入正确的手机号！');
      return false;
    }
    if (UserTool.appProvider.pickedCityAndCommunity == null) {
      BotToast.showText(text: '请先选择小区！');
      return false;
    }
    if (_currentIndex == 1 && _psd.text.isEmpty) {
      BotToast.showText(text: '密码不能为空');
      return false;
    }
    return true;
  }

  Widget _verificationView() {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      children: [
        140.w.heightBox,
        CommunityWidget(
          align: MainAxisAlignment.start,
        ),
        40.w.heightBox,
        TelTextField(
          controller: _tel,
          onChange: (String) {
            setState(() {});
          },
        ),
        100.w.heightBox,
        LoginButtonWidget(
            onTap: UserTool.appProvider.second < 60
                ? () {}
                : () async {
                    var check = checkInput();
                    if (!check) {
                      return;
                    }
                    var base = await SignFunc.sendMessageCode(
                        _tel.text,
                        UserTool.appProvider.pickedCityAndCommunity!
                            .communityModel!.id);
                    if (base.success) {
                      Get.to(() => CodeMessagePage(tel: _tel.text));
                      appProvider.startTimer();
                    } else {
                      BotToast.showText(text: base.msg);
                    }
                  },
            text: appProvider.timerStart
                ? '${appProvider.second}秒后重新获取'
                : '获取验证码'),
        24.w.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            '未注册的手机验证后会自动创建账号'
                .text
                .size(28.sp)
                .color(Colors.black.withOpacity(0.25))
                .make(),
          ],
        ),
      ],
    );
  }

  Widget _tab(String text, int index, {required Function(int) onTap}) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
        alignment: Alignment.center,
        child: text.text
            .size(_currentIndex == index ? 36.sp : 32.sp)
            .lineHeight(_currentIndex == index ? 1.2 : 1.2)
            .color(
                Colors.black.withOpacity(_currentIndex == index ? 0.65 : 0.45))
            .make(),
      ),
    );
  }
}
