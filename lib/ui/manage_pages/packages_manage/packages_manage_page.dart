
import 'package:aku_community_manager/ui/manage_pages/packages_manage/packages_manage_view.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

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
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '包裹管理',
      appBarBottom: PreferredSize(
        child: AkuTabBar(controller: _tabController, tabs: _tabs),
        preferredSize: Size.fromHeight(88.w),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(_tabs.length, (index) => PackagesManageView(index: index,)),
      ),
    );
  }
}
