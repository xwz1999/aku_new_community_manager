import 'package:aku_community_manager/mock_models/fix/fix_model.dart';
import 'package:aku_community_manager/mock_models/users/user_info_model.dart';
import 'package:aku_community_manager/provider/fix_provider.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/ui/sub_pages/business_and_fix/business_fix_card.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BusinessAndFixPage extends StatefulWidget {
  BusinessAndFixPage({Key key}) : super(key: key);

  @override
  _BusinessAndFixPageState createState() => _BusinessAndFixPageState();
}

class _BusinessAndFixPageState extends State<BusinessAndFixPage>
    with TickerProviderStateMixin {
  TabController _tabController;

  List<String> get _tabs {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    switch (userProvider.userInfoModel.role) {
      case USER_ROLE.MANAGER:
        return ['待派单', '已派单', '处理中', '已处理', '全部'];
        break;
      case USER_ROLE.FIXER:
        return ['待接单', '处理中', '已处理', '全部'];
        break;
      default:
        return ['待接单', '处理中', '已处理', '全部'];
        break;
    }
  }

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '报事报修',
      appBarBottom: PreferredSize(
        preferredSize: Size.fromHeight(88.w),
        child: AkuTabBar(
          controller: _tabController,
          tabs: _tabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((e) => _buildTabView(_tabs.indexOf(e))).toList(),
      ),
    );
  }

  Widget _buildTabView(int index) {
    final fixProvider = Provider.of<FixProvider>(context, listen: false);
    List<FixModel> models = fixProvider.getFixModel(index, context);
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      itemBuilder: (context, index) {
        return BusinessFixCard(model: models[index]);
      },
      itemCount: models.length,
    );
  }
}
