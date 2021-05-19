// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

// Project imports:
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/ui/manage_pages/packages_manage/add_package_page.dart';
import 'package:aku_community_manager/ui/manage_pages/packages_manage/packages_manage_view.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_tab_bar.dart';

class PackagesManagePage extends StatefulWidget {
  PackagesManagePage({Key key}) : super(key: key);

  @override
  _PackagesManagePageState createState() => _PackagesManagePageState();
}

class _PackagesManagePageState extends State<PackagesManagePage>
    with TickerProviderStateMixin {
  List<String> _tabs = ['未领取', '已领取'];
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '包裹管理',
      actions: [
        IconButton(
            icon: SizedBox(
              width: 40.w,
              height: 40.w,
              child: Image.asset(R.ASSETS_MANAGE_ADD_PNG),
            ),
            onPressed: () async {
              await Get.to(() => AddPackagePage());
            })
      ],
      appBarBottom: PreferredSize(
        child: AkuTabBar(controller: _tabController, tabs: _tabs),
        preferredSize: Size.fromHeight(88.w),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(
            _tabs.length,
            (index) => PackagesManageView(
                  index: index,
                )),
      ),
    );
  }
}
