
import 'package:aku_community_manager/ui/sub_pages/items_outdoor/items_outdoor_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_tab_bar.dart';

class ItemsOutdoorPage extends StatefulWidget {
  ItemsOutdoorPage({Key key}) : super(key: key);

  @override
  _ItemsOutdoorPageState createState() => _ItemsOutdoorPageState();
}

class _ItemsOutdoorPageState extends State<ItemsOutdoorPage>
    with TickerProviderStateMixin {
  List<String> _tabs = ['待出户', '已出户', '已驳回', '已作废', '全部'];
  TabController _tabController;
  EasyRefreshController _refreshController = EasyRefreshController();
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
      title: '物品出户',
      appBarBottom: PreferredSize(
        preferredSize: Size.fromHeight(88.w),
        child: AkuTabBar(controller: _tabController, tabs: _tabs),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ItemsOutdoorView(status: 1),
          ItemsOutdoorView(status: 2),
          ItemsOutdoorView(status: 3),
          ItemsOutdoorView(status: 4),
          ItemsOutdoorView(status: null),
        ],
      ),
    );
  }
}
