import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/inspection/inspection_list_model.dart';
import 'package:aku_community_manager/ui/manage_pages/inspection_manage/inspection_manage_card.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class InspectionMangeView extends StatefulWidget {
  final int inspectionStatus;
  InspectionMangeView({Key key, this.inspectionStatus}) : super(key: key);

  @override
  _InspectionMangeViewState createState() => _InspectionMangeViewState();
}

class _InspectionMangeViewState extends State<InspectionMangeView> {
  EasyRefreshController _easyRefreshController;
  @override
  void initState() {
    _easyRefreshController = EasyRefreshController();
    super.initState();
  }

  @override
  void dispose() {
    _easyRefreshController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BeeListView(
      path: API.manage.inspectionList,
      controller: _easyRefreshController,
      extraParams: {"inspectionStatus": widget.inspectionStatus},
      convert: (models) {
        return models.tableList
            .map((e) => InspectionListModel.fromJson(e))
            .toList();
      },
      builder: (items) {
        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          itemBuilder: (context, index) {
            return InspectionManageCard(cardModel: items[index]);
          },
          separatorBuilder: (context, index) {
            return 8.w.heightBox;
          },
          itemCount: items.length,
        );
      },
    );
  }
}
