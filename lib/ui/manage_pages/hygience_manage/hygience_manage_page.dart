// Flutter imports:
// Project imports:
import 'package:aku_community_manager/ui/manage_pages/hygience_manage/hygience_manage_view.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_tab_bar.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HygienceManagePage extends StatefulWidget {
  HygienceManagePage({Key? key}) : super(key: key);

  @override
  _HygienceManagePageState createState() => _HygienceManagePageState();
}

class _HygienceManagePageState extends State<HygienceManagePage>
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
      title: '卫生管理',
      appBarBottom: PreferredSize(
          preferredSize: Size.fromHeight(88.w),
          child: AkuTabBar(controller: _tabController!, tabs: _tabs)),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(
          _tabs.length,
          (index) => HygienceManageView(
            index: index,
          ),
        ),
      ),
    );
  }
}
