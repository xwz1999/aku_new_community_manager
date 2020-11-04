import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:flutter/material.dart';

class DecorationManagerPage extends StatefulWidget {
  DecorationManagerPage({Key key}) : super(key: key);

  @override
  _DecorationManagerPageState createState() => _DecorationManagerPageState();
}

class _DecorationManagerPageState extends State<DecorationManagerPage> {
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '装修管理',
    );
  }
}
