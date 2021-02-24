import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/borrow/borrow_status_item_model.dart';
import 'package:aku_community_manager/ui/sub_pages/borrow_manager/borrow_manager_card.dart';
import 'package:aku_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class BorrowManagerView extends StatefulWidget {
  final int status;
  BorrowManagerView({Key key, this.status}) : super(key: key);

  @override
  _BorrowManagerViewState createState() => _BorrowManagerViewState();
}

class _BorrowManagerViewState extends State<BorrowManagerView>
    with AutomaticKeepAliveClientMixin {
  EasyRefreshController _refreshController = EasyRefreshController();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BeeListView(
      path: API.manage.borrowStatusList,
      extraParams: {'borrowStatus': widget.status},
      controller: _refreshController,
      convert: (model) => model.tableList
          .map((e) => BorrowStatusItemModel.fromJson(e))
          .toList(),
      builder: (items) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return BorrowManagerCard(model: items[index]);
          },
          itemCount: items.length,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
