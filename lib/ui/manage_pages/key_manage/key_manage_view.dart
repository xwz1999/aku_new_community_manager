// Flutter imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/key_manage/key_manage_all_key_model.dart';
import 'package:aku_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:aku_community_manager/ui/manage_pages/key_manage/key_manage_card.dart';
import 'package:velocity_x/velocity_x.dart';

class KeyManageView extends StatefulWidget {
  final int index;
  KeyManageView({Key? key, required this.index}) : super(key: key);

  @override
  _KeyManageViewState createState() => _KeyManageViewState();
}

class _KeyManageViewState extends State<KeyManageView> {
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
        path: widget.index == 0
            ? API.manage.getAllkeyList
            : API.manage.getNOReturnList,
        controller: _refreshController,
        convert: (models) {
          return models.tableList!
              .map((e) => KeyMangeAllKeyModel.fromJson(e))
              .toList();
        },
        builder: (items) {
          return ListView.separated(
            padding: EdgeInsets.all(24.w),
              itemBuilder: (context, index) {
                return KeyManageCard(
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
