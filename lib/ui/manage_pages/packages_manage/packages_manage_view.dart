// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

// Project imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/package_manage/package_manage_list_model.dart';
import 'package:aku_community_manager/ui/manage_pages/packages_manage/packages_manage_card.dart';
import 'package:aku_community_manager/ui/widgets/common/bee_list_view.dart';

class PackagesManageView extends StatefulWidget {
  final int index;
  PackagesManageView({Key? key, required this.index}) : super(key: key);

  @override
  _PackagesManageViewState createState() => _PackagesManageViewState();
}

class _PackagesManageViewState extends State<PackagesManageView> {
  EasyRefreshController? _refreshController;
  void callRefresh() {
    _refreshController!.callRefresh();
  }

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
    return BeeListView(
      path: API.manage.packageManageList,
      controller: _refreshController,
      extraParams: {"collectionStatus": widget.index + 1},
      convert: (models) {
        List<PackageManageListModel> modelList = models.tableList!
            .map((e) => PackageManageListModel.fromJson(e))
            .toList();
        print(modelList);
        return modelList;
      },
      builder: (items) {
        return ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
            itemBuilder: (context, index) {
              return PackageManageCard(
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
      },
    );
  }
}
