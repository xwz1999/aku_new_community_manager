import 'package:aku_community_manager/mock_models/all_model.dart';
import 'package:aku_community_manager/mock_models/decoration/decoration_data.dart';
import 'package:aku_community_manager/mock_models/decoration/decoration_model.dart';
import 'package:aku_community_manager/mock_models/fix/fix_model.dart';
import 'package:aku_community_manager/provider/fix_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/sub_pages/business_and_fix/business_fix_card.dart';
import 'package:aku_community_manager/ui/sub_pages/decoration_manager/decoration_manager_card.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:provider/provider.dart';

class BusinessPage extends StatefulWidget {
  ///DEFAULT IS 0
  final int initIndex;
  BusinessPage({Key key, this.initIndex = 0}) : super(key: key);

  @override
  _BusinessPageState createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage>
    with TickerProviderStateMixin {
  List<String> _tabs = ['待处理', '处理中', '已处理', '全部'];
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
        child: AkuTabBar(
          controller: _tabController,
          tabs: _tabs,
        ),
        preferredSize: Size.fromHeight(88.w),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTabPage(AllModel(context).waitThings),
          _buildTabPage(AllModel(context).processingThings),
          _buildTabPage(AllModel(context).doneThings),
          _buildTabPage(AllModel(context).allThings),
        ],
      ),
    );
  }

  Widget _buildTabPage(List list) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      itemBuilder: (context, index) {
        final item = list[index];
        if (item is DecorationModel) {
          return DecorationManagerCard(model: item);
        } else if (item is FixModel) {
          return BusinessFixCard(model: item);
        } else
          return SizedBox();
      },
      itemCount: list.length,
    );
  }
}
