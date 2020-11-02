import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
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
              value: false,
              onChanged: (value) {},
            ),
          ),
          Divider(height: 1.w),
          AkuTile(
            title: Text('关于我们'),
            arrow: true,
          ),
          Divider(height: 1.w),
          AkuTile(
            title: Text('意见反馈'),
            arrow: true,
          ),
          Divider(height: 1.w),
          AkuTile(
            title: Text('清理缓存'),
            arrow: true,
          ),
        ],
      ),
    );
  }
}
