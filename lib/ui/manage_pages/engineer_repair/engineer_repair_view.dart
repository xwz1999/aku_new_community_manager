import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/json_models/manager/engineer_repair/engineer_repair_list_model.dart';
import 'package:aku_new_community_manager/models/user/user_info_model.dart';
import 'package:aku_new_community_manager/tools/user_tool.dart';
import 'package:aku_new_community_manager/ui/manage_pages/engineer_repair/engineer_repair_card.dart';
import 'package:aku_new_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class EngineerRepairView extends StatefulWidget {
  final int index;
  final EasyRefreshController controller;
  EngineerRepairView({Key? key, required this.index, required this.controller})
      : super(key: key);

  @override
  _EngineerRepairViewState createState() => _EngineerRepairViewState();
}

class _EngineerRepairViewState extends State<EngineerRepairView> {
  int? get repairEngineeringStatus {
    if (widget.index == 0) {
      return null;
    } else if (widget.index == 1) {
      switch (UserTool.userProvider.infoModel!.engineeringRepairAuthority) {
        case ERAUTH.SENDTOCOMPANY:
          return 1;
        case ERAUTH.SENDTOPERSON:
          return 2;
        case ERAUTH.PICK:
          return 3;
        case ERAUTH.HIDE:
          break;
      }
    } else {
      return UserTool.userProvider.infoModel!.engineeringRepairAuthority ==
              ERAUTH.PICK
          ? widget.index + 2
          : widget.index + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BeeListView(
        path: API.engineerRepair.engineerRepairList,
        extraParams: {
          'repairEngineeringStatus': repairEngineeringStatus,
        },
        controller: widget.controller,
        convert: (models) {
          return models.rows
              .map((e) => EngineerRepairListModel.fromJson(e))
              .toList();
        },
        builder: (items) {
          return ListView.separated(
              padding: EdgeInsets.all(32.w),
              itemBuilder: (context, index) {
                var model = items[index];
                return EngineerRepairCard(
                    model: model,
                    callRefresh: () {
                      widget.controller.callRefresh();
                    });
              },
              separatorBuilder: (_, __) {
                return 16.w.heightBox;
              },
              itemCount: items.length);
        });
  }
}
