import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/json_models/manager/house_keeping/house_keeping_list_model.dart';
import 'package:aku_new_community_manager/tools/user_tool.dart';
import 'package:aku_new_community_manager/ui/manage_pages/house_keeping/house_keeping_card.dart';
import 'package:aku_new_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class HouseKeepingView extends StatefulWidget {
  final int index;
  HouseKeepingView({Key? key, required this.index}) : super(key: key);

  @override
  _HouseKeepingViewState createState() => _HouseKeepingViewState();
}

class _HouseKeepingViewState extends State<HouseKeepingView> {
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

  int? get housekeepingServiceStatus {
    switch (UserTool.userProvider.userInfoModel!.type) {
      // case HKAUTH.PICK:
      case 1:
        if (widget.index == 0) {
          return null;
        } else {
          return widget.index + 1;
        }
      // case HKAUTH.SEND:
      case 2:
        return widget.index == 0 ? null : widget.index;
      default:
        return widget.index == 0 ? null : widget.index;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BeeListView(
        path: API.manage.newHouseKeepingList,
        extraParams: {
          "housekeepingServiceStatus": housekeepingServiceStatus,
        },
        controller: _refreshController,
        convert: (models) {
          return models.rows
              .map((e) => HouseKeepingListModel.fromJson(e))
              .toList();
        },
        builder: (items) {
          return ListView.separated(
              padding: EdgeInsets.all(24.w),
              itemBuilder: (context, index) {
                return HouseKeepingCard(
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
