// Flutter imports:
import 'package:aku_community_manager/ui/agreements/about_page.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/agreements/agreement_page.dart';
import 'package:aku_community_manager/ui/agreements/privacy_page.dart';
import 'package:aku_community_manager/ui/home/home_page.dart';
import 'package:aku_community_manager/ui/settings/setting_feedback_page.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_tile.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _info = false;
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return AkuScaffold(
      title: '设置',
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 16.w,
        ),
        children: [
          AkuTile(
            title: Text('是否接受信息通知'),
            arrow: false,
            suffix: CupertinoSwitch(
              value: _info,
              onChanged: (value) {
                setState(() {
                  _info = value;
                });
              },
            ),
          ),
          Divider(height: 1.w),
          AkuTile(
            title: Text('关于我们'),
            arrow: true,
            onTap: () {
              Get.to(() => AboutPage());
            },
          ),
          Divider(height: 1.w),
          AkuTile(
            title: Text('意见反馈'),
            arrow: true,
            onTap: () => Get.to(() => SettingFeedBackPage()),
          ),
          Divider(height: 1.w),
          AkuTile(
            title: Text('清理缓存'),
            arrow: true,
            onTap: () => BotToast.showText(text: '缓存清理完成'),
          ),
          Divider(height: 1.w),
          AkuTile(
            title: Text('隐私政策'),
            arrow: true,
            onTap: () => Get.to(() => PrivacyPage()),
          ),
          Divider(height: 1.w),
          AkuTile(
            title: Text('用户协议'),
            arrow: true,
            onTap: () => Get.to(() => AgreementPage()),
          ),
          AkuBox.h(320),
          userProvider.isLogin
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 64.w),
                  child: AkuMaterialButton(
                    radius: 8.w,
                    color: AppStyle.primaryColor,
                    onPressed: () {
                      userProvider.logout();
                      Get.offAll(HomePage());
                    },
                    child: Text(
                      '退出登录',
                      style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 32.w,
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
