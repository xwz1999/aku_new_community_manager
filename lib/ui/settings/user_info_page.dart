// Dart imports:
import 'dart:io';

// Project imports:
import 'package:aku_new_community_manager/provider/user_provider.dart';
import 'package:aku_new_community_manager/tools/aku_divider.dart';
import 'package:aku_new_community_manager/tools/extensions/list_extension_tool.dart';
import 'package:aku_new_community_manager/tools/extensions/router_extension_tool.dart';
import 'package:aku_new_community_manager/tools/screen_tool.dart';
import 'package:aku_new_community_manager/ui/settings/nick_name_change_page.dart';
import 'package:aku_new_community_manager/ui/settings/tel_change_page.dart';
import 'package:aku_new_community_manager/ui/widgets/app_widgets/aku_avatar.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_tile.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/bee_image_pick.dart';
// Package imports:
import 'package:common_utils/common_utils.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfoPage extends StatefulWidget {
  UserInfoPage({Key? key}) : super(key: key);

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return AkuScaffold(
      title: '个人信息',
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 24.w),
        children: [
          AkuTile(
            onTap: () async {
              File? file = await BeeImagePicker.pick(title: '选择图片');
              if (file != null) await userProvider.updateAvatar(file);
            },
            title: Text('头像'),
            height: 168.w,
            suffix: AkuAvatar(),
          ),
          AkuTile(
            onTap: () async {
              await NickNameChangePage().to();
              setState(() {});
            },
            title: Text('昵称'),
            suffix: Text(userProvider.userInfoModel!.nickName!),
          ),
          AkuTile(
            onTap: () async {
              await TelChangePage().to();
              setState(() {});
            },
            title: Text('手机'),
            suffix: Text(TextUtil.hideNumber(userProvider.userInfoModel!.tel)),
          ),
        ].sepWidget(separate: AkuDivider.horizontal()),
      ),
    );
  }
}
