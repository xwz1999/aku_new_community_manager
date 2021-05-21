// Flutter imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/hygience_manage/heygience_list_model.dart';
import 'package:aku_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:aku_community_manager/ui/manage_pages/hygience_manage/hygience_manage_card.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HygienceManageView extends StatefulWidget {
  final int index;
  HygienceManageView({Key key, this.index}) : super(key: key);

  @override
  _HygienceManageViewState createState() => _HygienceManageViewState();
}

class _HygienceManageViewState extends State<HygienceManageView> {
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
        path: API.manage.hygienceList,
        controller: _refreshController,
        extraParams: {
          "hygieneStatus":widget.index+1,
        },
        convert: (models) {
          return models.tableList
              .map((e) => HygienceListModel.fromJson(e))
              .toList();
        },
        builder: (items) {
          return ListView.separated(
            padding: EdgeInsets.all(24.w),
              itemBuilder: (context, index) {
                return HyginecManageCard(
                  index: widget.index,
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
}
