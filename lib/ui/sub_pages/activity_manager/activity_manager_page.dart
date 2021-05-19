// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_easyrefresh/easy_refresh.dart';

// Project imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/activity_item_model.dart';
import 'package:aku_community_manager/ui/sub_pages/activity_manager/activity_manager_card.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:aku_community_manager/utils/network/base_list_model.dart';

class ActivityManagerPage extends StatefulWidget {
  ActivityManagerPage({Key key}) : super(key: key);

  @override
  _ActivityManagerPageState createState() => _ActivityManagerPageState();
}

class _ActivityManagerPageState extends State<ActivityManagerPage> {
  EasyRefreshController _refreshController = EasyRefreshController();
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '活动管理',
      body: BeeListView(
        builder: (List<dynamic> items) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ActivityManagerCard(model: items[index]);
            },
            itemCount: items.length,
          );
        },
        controller: _refreshController,
        convert: (BaseListModel model) {
          return model.tableList
              .map((e) => ActivityItemModel.fromJson(e))
              .toList();
        },
        path: API.manage.acitivityList,
      ),
    );
  }
}
