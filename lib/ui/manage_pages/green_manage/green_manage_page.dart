// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/manage_pages/green_manage/green_manage_view.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_tab_bar.dart';

class GreenManagePage extends StatefulWidget {
  GreenManagePage({Key? key}) : super(key: key);

  @override
  _GreenManagePageState createState() => _GreenManagePageState();
}

class _GreenManagePageState extends State<GreenManagePage>
    with TickerProviderStateMixin {
  List<String> _tabs = ['待处理', '已完成', '未完成'];
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '绿化管理',
      appBarBottom: PreferredSize(
          preferredSize: Size.fromHeight(88.w),
          child: AkuTabBar(controller: _tabController!, tabs: _tabs)),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(
          _tabs.length,
          (index) => GreenManageView(
            index: index,
          ),
        ),
      ),
    );
  }
}
