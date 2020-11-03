import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';

class BusinessPage extends StatefulWidget {
  ///DEFAULT IS 0
  final int initIndex;
  BusinessPage({Key key, this.initIndex = 0}) : super(key: key);

  @override
  _BusinessPageState createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage>
    with TickerProviderStateMixin {
  List<String> tabs = ['待处理', '处理中', '已处理', '全部'];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: widget.initIndex,
    );
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '全部事项',
      appBarBottom: PreferredSize(
        child: TabBar(
          labelColor: AppStyle.primaryTextColor,
          unselectedLabelColor: AppStyle.minorTextColor,
          labelStyle: TextStyle(
            fontSize: 28.w,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.normal,
          ),
          indicatorColor: AppStyle.primaryColor,
          indicatorSize: TabBarIndicatorSize.label,
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
        preferredSize: Size.fromHeight(88.w),
      ),
    );
  }
}
