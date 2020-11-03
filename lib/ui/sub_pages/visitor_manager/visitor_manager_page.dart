import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VisitorManagerPage extends StatefulWidget {
  final initIndex;
  VisitorManagerPage({Key key, this.initIndex = 0}) : super(key: key);

  @override
  _VisitorManagerPageState createState() => _VisitorManagerPageState();
}

class _VisitorManagerPageState extends State<VisitorManagerPage>
    with TickerProviderStateMixin {
  List tabs = ['全部', '未到访', '已到访', '已过期'];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 4, vsync: this, initialIndex: widget.initIndex);
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '访客管理',
      appBarBottom: PreferredSize(
          child: TabBar(
            tabs: tabs.map((e) => Tab(text: e)).toList(),
            labelStyle: AppStyle().primaryStyle,
            labelColor: AppStyle.primaryTextColor,
            unselectedLabelColor: AppStyle.minorTextColor,
            unselectedLabelStyle: TextStyle(fontSize:28.sp),
            controller: _tabController,
            indicatorColor: Color(0xFFFFC40C),
            indicatorSize: TabBarIndicatorSize.label,
          ),
          preferredSize: Size.fromHeight(88.w)),
      body: ListView(
        children: [],
      ),
    );
  }
}
