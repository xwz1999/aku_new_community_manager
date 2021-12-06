import 'package:aku_new_community_manager/models/user/user_info_model.dart';
import 'package:aku_new_community_manager/tools/user_tool.dart';
import 'package:aku_new_community_manager/ui/manage_pages/engineer_repair/add_engineer_repair_page.dart';
import 'package:aku_new_community_manager/ui/manage_pages/engineer_repair/engineer_repair_view.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/aku_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class EngineerRepairPage extends StatefulWidget {
  EngineerRepairPage({Key? key}) : super(key: key);

  @override
  _EngineerRepairPageState createState() => _EngineerRepairPageState();
}

class _EngineerRepairPageState extends State<EngineerRepairPage>
    with TickerProviderStateMixin {
  List<String> get _tabs {
    switch (UserTool.userProvider.infoModel!.engineeringRepairAuthority) {
      case ERAUTH.SENDTOCOMPANY:
        return ['全部', '待派单', '已派单', '处理中', '待验收', '验收驳回', '已完成'];
      case ERAUTH.SENDTOPERSON:
        return ['全部', '待派单', '已派单', '处理中', '待验收', '验收驳回', '已完成'];
      case ERAUTH.PICK:
        return ['全部', '已派单', '处理中', '待验收', '验收驳回', '已完成'];
      default:
        return ['全部', '待派单', '已派单', '处理中', '待验收', '验收驳回', '已完成'];
    }
  }

  late TabController _tabController;
  List<EasyRefreshController> _controllers = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabs.forEach((element) {
      _controllers.add(EasyRefreshController());
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _controllers.map((e) => e.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '工程维修',
      appBarBottom: PreferredSize(
        preferredSize: Size.fromHeight(88.w),
        child: AkuTabBar(
          controller: _tabController,
          tabs: _tabs,
          isScrollable: true,
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: _tabs
              .mapIndexed((currentValue, index) => EngineerRepairView(
                    index: index,
                    controller: _controllers[index],
                  ))
              .toList()),
      bottom: AkuBottomButton(
        title: '新增',
        onTap: () async {
          await Get.to(() => AddEngineerRepairPage());
          _controllers[_tabController.index].callRefresh();
        },
      ),
    );
  }
}
