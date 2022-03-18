// Flutter imports:
// Project imports:
import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/models/manager/visitor_item_model.dart';
import 'package:aku_new_community_manager/ui/sub_pages/visitor_manager/visitor_manager_card.dart';
import 'package:aku_new_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VisitorManagerView extends StatefulWidget {
  final int? status;
  VisitorManagerView({Key? key, this.status}) : super(key: key);

  @override
  _VisitorManagerViewState createState() => _VisitorManagerViewState();
}

class _VisitorManagerViewState extends State<VisitorManagerView>
    with AutomaticKeepAliveClientMixin {
  EasyRefreshController _refreshController = EasyRefreshController();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BeeListView(
      path: API.manage.visitorList,
      controller: _refreshController,
      convert: (model) {
        return model.rows.map((e) => VisitorItemModel.fromJson(e)).toList();
      },
      extraParams: {'visitorStatus': widget.status},
      builder: (items) {
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemBuilder: (context, index) {
            final VisitorItemModel item = items[index];
            return VisitorManagerCard(model: item);
          },
          itemCount: items.length,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
