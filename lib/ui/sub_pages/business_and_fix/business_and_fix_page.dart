import 'package:aku_community_manager/mock_models/users/user_info_model.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
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
        return [];
        break;
      case USER_ROLE.FIXER:
        return [];
        break;
      case USER_ROLE.SECURITY:
        return [];
        break;
      default:
        return [];
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
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(88.w),
        child: AkuTabBar(
          controller: _tabController,
          tabs: _tabs,
        ),
      ),
    );
  }
}
