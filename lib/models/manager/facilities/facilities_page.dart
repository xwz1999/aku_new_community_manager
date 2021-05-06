import 'package:aku_community_manager/models/manager/facilities/facilities_view.dart';
import 'package:aku_community_manager/tools/user_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class FacilitiesPage extends StatefulWidget {
  FacilitiesPage({Key key}) : super(key: key);

  @override
  _FacilitiesPageState createState() => _FacilitiesPageState();
}

class _FacilitiesPageState extends State<FacilitiesPage>
    with TickerProviderStateMixin {
  List<String> get _tabs {
    return UserTool.userProvider.infoModel.canOperation
        ? ['待检查', '未完成', '已完成']
        : ['待检查', '已完成'];
  }

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
      title: '设施检查',
      appBarBottom: PreferredSize(
        child: AkuTabBar(controller: _tabController, tabs: _tabs),
        preferredSize: Size.fromHeight(88.w),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(_tabs.length, (index) => FacilitiesView(index: index,)),
      ),
    );
  }
}
