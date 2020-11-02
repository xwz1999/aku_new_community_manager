import 'package:aku_community_manager/ui/sub_pages/activity_manager/activity_manager_card.dart';
import 'package:aku_community_manager/ui/sub_pages/activity_manager/fake_activity_model.dart';
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
      body: ListView.builder(
        itemBuilder: (context, index) {
          final model = fakeAcitivityManagerModels[index];
          return ActivityManagerCard(model: model);
        },
        itemCount: fakeAcitivityManagerModels.length,
      ),
    );
  }
}
