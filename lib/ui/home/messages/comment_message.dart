// Flutter imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/message/comment_message_item_model.dart';
import 'package:aku_community_manager/ui/home/messages/comment_message_card.dart';
import 'package:aku_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// Package imports:
import 'package:aku_ui/common_widgets/aku_common_widgets.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

class CommentMessage extends StatefulWidget {
  CommentMessage({Key key}) : super(key: key);

  @override
  _CommentMessageState createState() => _CommentMessageState();
}

class _CommentMessageState extends State<CommentMessage> {
  EasyRefreshController _refreshController = EasyRefreshController();

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '评论消息',
      body: BeeListView(
        controller: _refreshController,
        path: API.message.commentList,
        convert: (model) => model.tableList
            .map((e) => CommentMessageItemModel.fromJson(e))
            .toList(),
        builder: (items) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
              itemBuilder: (context, index) {
                return CommentMessageCard(itemModel: items[index]);
              },
              separatorBuilder: (context, index) {
                return 10.w.heightBox;
              },
              itemCount: items.length);
        },
      ),
    );
  }
}
