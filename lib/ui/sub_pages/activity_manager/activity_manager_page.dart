import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:flutter/material.dart';

class ActivityManagerPage extends StatefulWidget {
  ActivityManagerPage({Key key}) : super(key: key);

  @override
  _ActivityManagerPageState createState() => _ActivityManagerPageState();
}

class _ActivityManagerPageState extends State<ActivityManagerPage> {
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '活动管理',
      body: ListView(
        children: [
          Text('a'),
        ],
      ),
    );
  }
}
