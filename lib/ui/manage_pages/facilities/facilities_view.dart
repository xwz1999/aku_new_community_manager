// Flutter imports:
import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/models/manager/facilities/facilities_check_list_model.dart';
import 'package:aku_new_community_manager/ui/manage_pages/facilities/facilities_card.dart';
import 'package:aku_new_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:

class FacilitiesView extends StatefulWidget {
  final int index;
  final int facilitiesType;
  FacilitiesView({Key? key, required this.index, required this.facilitiesType}) : super(key: key);

  @override
  _FacilitiesViewState createState() => _FacilitiesViewState();
}

class _FacilitiesViewState extends State<FacilitiesView> {
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
        path: API.manage.facilitiesCheckList,
        extraParams: {
          "facilitiesType": widget.facilitiesType,
          "executeStatus": widget.index + 1,
        },
        controller: _refreshController,
        convert: (models) {
          return models.tableList!
              .map((e) => FacilitiesCheckListModel.fromJson(e))
              .toList();
        },
        builder: (items) {
          return ListView.separated(
              padding: EdgeInsets.all(32.w),
              itemBuilder: (context, index) {
                return FacilitiesCard(
                  index: widget.index,
                  facilitiesType: widget.facilitiesType,
                  model: items[index],
                  callRefresh: () {
                    _refreshController!.callRefresh();
                  }, executeStatus: widget.index + 1,
                );
              },
              separatorBuilder: (_, __) {
                return 24.w.heightBox;
              },
              itemCount: items.length);
        });
  }
}
