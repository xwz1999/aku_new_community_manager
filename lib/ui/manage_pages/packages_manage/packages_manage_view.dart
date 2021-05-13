import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/package_manage/package_manage_list_model.dart';
import 'package:aku_community_manager/ui/manage_pages/packages_manage/packages_manage_card.dart';
import 'package:aku_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class PackagesManageView extends StatefulWidget {
  final int index;
  PackagesManageView({Key key, this.index}) : super(key: key);

  @override
  _PackagesManageViewState createState() => _PackagesManageViewState();
}

class _PackagesManageViewState extends State<PackagesManageView> {
  EasyRefreshController _refreshController;
  List<PackageManageListModel> _models;
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
        return models.tableList
            .map((e) => PackageManageListModel.fromJson(e))
            .toList();
      },
      builder: (items) {
        return ListView.separated(
            itemBuilder: (context, index) {
              return PackageManageCard(
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
      },
    );
  }
}
