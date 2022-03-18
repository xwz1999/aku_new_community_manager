// Flutter imports:
import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/models/manager/green_manage/green_manage_list_model.dart';
// Project imports:
import 'package:aku_new_community_manager/ui/manage_pages/green_manage/green_manage_card.dart';
import 'package:aku_new_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class GreenManageView extends StatefulWidget {
  final int index;
  GreenManageView({Key? key, required this.index}) : super(key: key);

  @override
  _GreenManageViewState createState() => _GreenManageViewState();
}

class _GreenManageViewState extends State<GreenManageView> {
  EasyRefreshController? _refreshController;
  @override
  void initState() {
    super.initState();
    _refreshController = EasyRefreshController();
  }

  @override
  void dispose() {
    _refreshController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BeeListView(
        path: API.manage.greenManageList,
        extraParams: {
          "greenStatus": widget.index + 1,
        },
        controller: _refreshController,
        convert: (models) {
          return models.rows
              .map((e) => GreenManageListModel.fromJson(e))
              .toList();
        },
        builder: (items) {
          return ListView.separated(
              padding: EdgeInsets.all(24.w),
              itemBuilder: (contex, index) {
                return GreenManageCard(
                  index: widget.index,
                  model: items[index],
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
