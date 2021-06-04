// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:aku_community_manager/ui/sub_pages/business_and_fix/bussiness_and_fix_view.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_tab_bar.dart';

class BusinessAndFixPage extends StatefulWidget {
  BusinessAndFixPage({Key? key}) : super(key: key);

  @override
  _BusinessAndFixPageState createState() => _BusinessAndFixPageState();
}

class _BusinessAndFixPageState extends State<BusinessAndFixPage>
    with TickerProviderStateMixin {
  TabController? _tabController;

  List<String> get _tabs {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    // switch (userProvider.userInfoModel.role) {
    //   case USER_ROLE.MANAGER:
    //     return ['待派单', '已派单', '处理中', '已处理', '全部'];
    //     break;
    //   case USER_ROLE.FIXER:
    //     return ['待接单', '处理中', '已处理', '全部'];
    //     break;
    //   default:
    //     return ['待接单', '处理中', '已处理', '全部'];
    //     break;
    // }
    if ((userProvider.infoModel!.canPickUpTicket) &&
        (!userProvider.infoModel!.canSendTicket)) {
      return ['待接单', '处理中', '已处理', '全部'];
    } else if ((!userProvider.infoModel!.canPickUpTicket) &&
        (userProvider.infoModel!.canSendTicket)) {
      return ['待派单', '已派单', '处理中', '已处理', '全部'];
    } else {
      return ['未处理', '处理中', '已处理', '全部'];
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
          controller: _tabController!,
          tabs: _tabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(
            _tabs.length,
            (index) => BussinessAndFixView(
                  status: index == _tabs.length - 1 ? null : index + 1,
                )),
      ),
    );
  }
}
