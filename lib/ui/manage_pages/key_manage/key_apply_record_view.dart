// Flutter imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/key_manage/key_manage_record_list_model.dart';
import 'package:aku_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:aku_community_manager/ui/manage_pages/key_manage/key_apply_record_card.dart';
import 'package:velocity_x/velocity_x.dart';

class KeyApplyRecordView extends StatefulWidget {
  final int index;
  KeyApplyRecordView({Key? key, required this.index}) : super(key: key);

  @override
  _KeyApplyRecordViewState createState() => _KeyApplyRecordViewState();
}

class _KeyApplyRecordViewState extends State<KeyApplyRecordView>
    with TickerProviderStateMixin {
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
        path: API.manage.keyRecordList,
        extraParams: {
          "recordStatus": widget.index == 0 ? null : widget.index,
        },
        controller: _refreshController,
        convert: (models) {
          return models.tableList!
              .map((e) => KeyManageRecordListModel.fromJson(e))
              .toList();
        },
        builder: (items) {
          return ListView.separated(
              padding: EdgeInsets.all(24.w),
              itemBuilder: (context, index) {
                return KeyApplyRecordCard(
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
