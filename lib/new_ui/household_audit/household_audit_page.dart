import 'package:aku_new_community_manager/const/saas_api.dart';
import 'package:aku_new_community_manager/gen/assets.gen.dart';
import 'package:aku_new_community_manager/new_ui/household_audit/household_audio_agree.dart';
import 'package:aku_new_community_manager/new_ui/household_audit/household_audio_all.dart';
import 'package:aku_new_community_manager/new_ui/household_audit/household_audio_reject.dart';
import 'package:aku_new_community_manager/new_ui/household_audit/household_audio_verify.dart';
import 'package:aku_new_community_manager/saas_models/household_audit/household_audit_list_model.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/common/bee_divider.dart';
import 'package:aku_new_community_manager/ui/widgets/common/car_bottom_button.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/aku_tab_bar.dart';
import 'package:aku_new_community_manager/utils/extension/list_extension.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/src/extensions/iterable_ext.dart';
import 'package:velocity_x/src/extensions/num_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';

class HouseholdAuditPage extends StatefulWidget {
  const HouseholdAuditPage({Key? key}) : super(key: key);

  @override
  _HouseholdAuditPageState createState() => _HouseholdAuditPageState();
}

class _HouseholdAuditPageState extends State<HouseholdAuditPage>
    with SingleTickerProviderStateMixin {
  List<String> _tabs = ['全部', '待审核', '已驳回', '已同意'];
  List<EasyRefreshController> _refreshControllers = [];
  late TabController _tabController;

  @override
  void initState() {
    _refreshControllers = List.filled(_tabs.length, EasyRefreshController());
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _refreshControllers.forEach((element) {
      element.dispose();
    });
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '住户审核',
      appBarBottom: PreferredSize(
          preferredSize: Size.fromHeight(107.w),
          child: AkuTabBar(
            controller: _tabController,
            tabs: _tabs,
          )),
      body: TabBarView(
          controller: _tabController,
          children: [
            HouseholdAudioAll(refreshController: _refreshControllers[0]),
            HouseholdAudioVerify(refreshController: _refreshControllers[1]),
            HouseholdAudioReject(refreshController: _refreshControllers[2]),
            HouseholdAudioAgree(refreshController: _refreshControllers[3]),
          ],
      ),
    );
  }
}
