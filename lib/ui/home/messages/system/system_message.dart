// Flutter imports:
// Project imports:
import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/models/message/system_message_item_model.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/ui/home/messages/system/system_message_card.dart';
import 'package:aku_new_community_manager/ui/home/messages/system/system_message_green_card.dart';
import 'package:aku_new_community_manager/ui/home/messages/system/system_message_hygience_card.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class SystemMessage extends StatefulWidget {
  SystemMessage({Key? key}) : super(key: key);

  @override
  _SystemMessageState createState() => _SystemMessageState();
}

class _SystemMessageState extends State<SystemMessage> {
  EasyRefreshController _refreshController = EasyRefreshController();

  String? _sendDate;
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
                return _buildCard(items[index], index);
              },
              separatorBuilder: (context, index) {
                return 10.w.heightBox;
              },
              itemCount: items.length);
        },
        path: API.message.systemList,
        convert: (model) =>
            model.rows.map((e) => SystemMessageItemModel.fromJson(e)).toList(),
      ),
    );
  }

  Widget _buildCard(SystemMessageItemModel model, int index) {
    String? _date =
        DateUtil.formatDateStr(model.sendDate!, format: 'yyyy-MM-dd');
    if (_sendDate != null && _sendDate == _date && index != 0) {
      _date = null;
    } else {
      _sendDate = _date;
    }
    switch (model.type) {
      case 1:
        return SystemMessageCard(
          relationId: model.relationId!,
          date: _date,
          type: 1,
        );
      case 2:
        return Container();
      case 3:
        return SystemMessageGreenCard(
            relationId: model.relationId!, date: _date, type: 3);
      case 4:
        return SystemMessageHygienceCard(
            relationId: model.relationId!, date: _date, type: 4);
      case 5:
        return SystemMessageHygienceCard(
            relationId: model.relationId!, date: _date, type: 5);
      default:
        return Container();
    }
  }
}
