import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_tile.dart';
import 'package:aku_community_manager/ui/widgets/inner/pick_image.dart';
import 'package:flutter/material.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class UserInfoPage extends StatefulWidget {
  UserInfoPage({Key key}) : super(key: key);

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
            onTap: () {
              akuPickImage().then((file) {
                if (file != null) userProvider.setAvatar(file);
              });
            },
            title: Text('头像'),
            height: 168.w,
            suffix: CircleAvatar(
              radius: 60.w,
              backgroundColor: Colors.white,
              backgroundImage: userProvider.userInfoModel.avatar == null
                  ? null
                  : FileImage(userProvider.userInfoModel.avatar),
              child: userProvider.userInfoModel.avatar == null
                  ? Icon(Icons.person_outline)
                  : null,
            ),
          ),
          AkuTile(
            onTap: () {},
            title: Text('昵称'),
            suffix: Text(userProvider.userInfoModel.nickName),
          ),
          AkuTile(
            onTap: () {},
            title: Text('手机'),
          ),
        ],
      ),
    );
  }
}
