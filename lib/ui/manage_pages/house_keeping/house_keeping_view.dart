import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/house_keeping/house_keeping_list_model.dart';
import 'package:aku_community_manager/ui/manage_pages/house_keeping/house_keeping_card.dart';
import 'package:aku_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HouseKeepingView extends StatefulWidget {
  final int index;
  HouseKeepingView({Key? key, required this.index}) : super(key: key);

  @override
  _HouseKeepingViewState createState() => _HouseKeepingViewState();
}

class _HouseKeepingViewState extends State<HouseKeepingView> {
  EasyRefreshController? _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = EasyRefreshController();
  }

  @override
  void dispose() {
    _refreshController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BeeListView(
        path: API.manage.houseKeepingList,
        // extraParams: {"status": widget.index == 0 ? null : widget.index},
        controller: _refreshController,
        convert: (models) {
          return models.tableList!
              .map((e) => HouseKeepingListModel.fromJson(e))
              .toList();
        },
        builder: (items) {
          return ListView.separated(
              padding: EdgeInsets.all(24.w),
              itemBuilder: (context, index) {
                return HouseKeepingCard(
                  callRefresh: () {
                    _refreshController!.callRefresh();
                  },
                );
              },
              separatorBuilder: (_, __) {
                return 24.w.heightBox;
              },
              itemCount: items.length);
        });
  }
}
