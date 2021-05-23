import 'package:aku_community_manager/ui/manage_pages/clock_in_out/clock_in_out_main_page.dart';
import 'package:aku_community_manager/ui/manage_pages/clock_in_out/clock_in_out_view.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClockInOutPage extends StatefulWidget {
  ClockInOutPage({Key key}) : super(key: key);

  @override
  _ClockInOutPageState createState() => _ClockInOutPageState();
}

class _ClockInOutPageState extends State<ClockInOutPage>
    with TickerProviderStateMixin {
  TabController _tabController;
  List<String> _tabs = ['考勤打卡', '打卡记录', '申请情况'];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '考勤管理',
      appBarBottom: PreferredSize(
        child: AkuTabBar(controller: _tabController, tabs: _tabs),
        preferredSize: Size.fromHeight(88.w),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(_tabs.length, (index) {
         
          if (index == 0) {
            return ClockInOutMainPage();
          } else {
           return ClockInOutView(
              index: index,
            );
          }
        }),
      ),
    );
  }
}
