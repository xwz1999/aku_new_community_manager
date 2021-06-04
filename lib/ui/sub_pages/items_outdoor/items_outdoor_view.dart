// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/goods_out/goods_out_item_model.dart';
import 'package:aku_community_manager/ui/sub_pages/items_outdoor/items_outdoor_card.dart';
import 'package:aku_community_manager/ui/widgets/common/bee_list_view.dart';

class ItemsOutdoorView extends StatefulWidget {
  final int? status;
  ItemsOutdoorView({Key? key, required this.status}) : super(key: key);

  @override
  _ItemsOutdoorViewState createState() => _ItemsOutdoorViewState();
}

class _ItemsOutdoorViewState extends State<ItemsOutdoorView>
    with AutomaticKeepAliveClientMixin {
  EasyRefreshController _refreshController = new EasyRefreshController();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BeeListView(
      path: API.manage.goodsOutList,
      extraParams: {'articleOutStatus': widget.status},
      controller: _refreshController,
      convert: (model) =>
          model.tableList!.map((e) => GoodsOutItemModel.fromJson(e)).toList(),
      builder: (items) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ItemsOutdoorCard(
              model: items[index],
              callRefresh: () {
                _refreshController.callRefresh();
              },
            );
          },
          padding: EdgeInsets.only(left: 32.w, right: 32.w),
          itemCount: items.length,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
