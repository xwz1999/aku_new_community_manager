// Flutter imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/message/system_message_item_model.dart';
import 'package:aku_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:aku_ui/aku_ui.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

class SystemMessage extends StatefulWidget {
  SystemMessage({Key key}) : super(key: key);

  @override
  _SystemMessageState createState() => _SystemMessageState();
}

class _SystemMessageState extends State<SystemMessage> {
  EasyRefreshController _refreshController = EasyRefreshController();


  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '系统消息',
      body: BeeListView(
        controller: _refreshController,
        builder: (items) {
          return ListView(
            padding: EdgeInsets.only(left: 32.w, right: 32.w, bottom: 40.w),
            children: [],
          );
        },
        path: API.message.systemList,
        convert: (model) => model.tableList
            .map((e) => SystemMessageItemModel.fromJson(e))
            .toList(),
      ),
    );
  }
}
