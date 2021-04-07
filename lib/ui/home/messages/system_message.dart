// Flutter imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/message/system_message_item_model.dart';
import 'package:aku_community_manager/ui/home/messages/systen_message_card.dart';
import 'package:aku_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// Package imports:
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:aku_community_manager/style/app_style.dart';
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
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
              itemBuilder: (context, index) {
                return SystemMessageCard(model: items[index]);
              },
              separatorBuilder: (context, index) {
                return 10.w.heightBox;
              },
              itemCount: items.length);
        },
        path: API.message.systemList,
        convert: (model) => model.tableList
            .map((e) => SystemMessageItemModel.fromJson(e))
            .toList(),
      ),
    );
  }
}
