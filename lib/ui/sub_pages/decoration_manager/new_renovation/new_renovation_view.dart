import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/new_renovation/new_renovation_list_model.dart';
import 'package:aku_community_manager/ui/sub_pages/decoration_manager/new_renovation/new_renovation_card.dart';
import 'package:aku_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class NewRenovationView extends StatefulWidget {
  final int index;
  NewRenovationView({Key key, this.index}) : super(key: key);

  @override
  _NewRenovationState createState() => _NewRenovationState();
}

class _NewRenovationState extends State<NewRenovationView>
    with AutomaticKeepAliveClientMixin {
  EasyRefreshController _refreshController;
  @override
  void initState() {
    super.initState();
    _refreshController = EasyRefreshController();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BeeListView(
        path: API.manage.newRenovationList,
        controller: _refreshController,
        extraParams: {"userDecorationNewStatus": widget.index},
        convert: (models) {
          return models.tableList
              .map((e) => NewRenovationListModel.fromJson(e))
              .toList();
        },
        builder: (items) {
          return ListView.separated(
              padding: EdgeInsets.all(32.w),
              itemBuilder: (context, index) {
                return NewRenovationCard(
                  model: items[index],
                  callRefresh: () {
                    _refreshController.callRefresh();
                  },
                );
              },
              separatorBuilder: (_, __) {
                return 24.w.heightBox;
              },
              itemCount: items.length);
        });
  }

  @override
  bool get wantKeepAlive => true;
}
