import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/clock_in_out/clock_apply_record_list_model.dart';
import 'package:aku_community_manager/models/manager/clock_in_out/clock_record_list_model.dart';
import 'package:aku_community_manager/ui/manage_pages/clock_in_out/clock_in_out_apply_card.dart';
import 'package:aku_community_manager/ui/manage_pages/clock_in_out/clock_in_out_record_card.dart';
import 'package:aku_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class ClockInOutView extends StatefulWidget {
  final int index;
  ClockInOutView({Key? key, required this.index}) : super(key: key);

  @override
  _ClockInOutViewState createState() => _ClockInOutViewState();
}

class _ClockInOutViewState extends State<ClockInOutView> {
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
    return _getView();
  }

  _getView() {
    switch (widget.index) {
      case 1:
        return BeeListView(
            path: API.manage.clockRecord,
            controller: _refreshController,
            convert: (models) {
              return models.tableList!
                  .map((e) => ClockRecordListModel.fromJson(e))
                  .toList();
            },
            builder: (items) {
              return ListView.separated(
                  padding: EdgeInsets.all(32.w),
                  itemBuilder: (context, index) {
                    return ClockInOutRecordCard(
                      model: items[index],
                    );
                  },
                  separatorBuilder: (_, __) {
                    return 24.w.heightBox;
                  },
                  itemCount: items.length);
            });
      case 2:
        return BeeListView(
            path: API.manage.clockApplyRecord,
            controller: _refreshController,
            convert: (models) {
              return models.tableList!
                  .map((e) => ClockApplyRecordListModel.fromJson(e))
                  .toList();
            },
            builder: (items) {
              return ListView.separated(
                  padding: EdgeInsets.all(32.w),
                  itemBuilder: (context, index) {
                    return ClockInOutApplyCard(
                      model: items[index],
                    );
                  },
                  separatorBuilder: (_, __) {
                    return 24.w.heightBox;
                  },
                  itemCount: items.length);
            });
      default:
    }
  }
}
