// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/tools/screen_tool.dart';
import 'package:aku_new_community_manager/ui/home/business/business_view.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/aku_tab_bar.dart';

class BusinessPage extends StatefulWidget {
  ///DEFAULT IS 0
  final int initIndex;
  BusinessPage({Key? key, this.initIndex = 0}) : super(key: key);

  @override
  _BusinessPageState createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage>
    with TickerProviderStateMixin {
  List<String> _tabs = ['待处理', '处理中', '已处理', '全部'];
 late TabController _tabController;

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
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '全部事项',
      appBarBottom: PreferredSize(
        child: AkuTabBar(
          controller: _tabController,
          tabs: _tabs,
        ),
        preferredSize: Size.fromHeight(88.w),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(
          _tabs.length,
          (index) => BussinessView(
            backlogStatus: index + 1,
          ),
        ),
      ),
    );
  }

  // Widget _buildTabPage(int status) {
    // return ListView.builder(
    //   padding: EdgeInsets.symmetric(horizontal: 32.w),
    //   itemBuilder: (context, index) {
    //     final item = list[index];
    //     if (item is DecorationListModel) {
    //       return DecorationManagerCard(model: item);
    //     } else if (item is BussinessAndFixModel) {
    //       return BusinessFixCard(model: item);
    //     } else
    //       return SizedBox();
    //   },
    //   itemCount: list.length,
    // );
  //   return BussinessView(
  //     backlogStatus: status,
  //   );
  // }
}
