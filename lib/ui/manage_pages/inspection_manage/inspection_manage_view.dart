// Flutter imports:
// Project imports:
import 'package:aku_new_community_manager/const/saas_api.dart';
import 'package:aku_new_community_manager/models/manager/inspection/inspection_list_model.dart';
import 'package:aku_new_community_manager/ui/manage_pages/inspection_manage/inspection_manage_card.dart';
import 'package:aku_new_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class InspectionMangeView extends StatefulWidget {
  final int /*!*/ inspectionStatus;
  InspectionMangeView({Key? key, required this.inspectionStatus})
      : super(key: key);

  @override
  _InspectionMangeViewState createState() => _InspectionMangeViewState();
}

class _InspectionMangeViewState extends State<InspectionMangeView> {
  EasyRefreshController? _easyRefreshController;
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
      path: SAASAPI.inspection.list,
      controller: _easyRefreshController,
      extraParams: {"inspectionStatus": widget.inspectionStatus},
      convert: (models) {
        return models.rows.map((e) => InspectionListModel.fromJson(e)).toList();
      },
      builder: (items) {
        return ListView.separated(
          padding: EdgeInsets.fromLTRB(32.w, 16.w, 32.w, 16.w),
          itemBuilder: (context, index) {
            return InspectionManageCard(cardModel: items[index]);
          },
          separatorBuilder: (context, index) {
            return 16.w.heightBox;
          },
          itemCount: items.length,
        );
      },
    );
  }
}
