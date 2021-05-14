import 'package:aku_community_manager/ui/manage_pages/key_manage/key_apply_record_view.dart';
import 'package:aku_community_manager/ui/manage_pages/key_manage/select_place_page.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KeyApplyRecordPage extends StatefulWidget {
  KeyApplyRecordPage({Key key}) : super(key: key);

  @override
  _KeyApplyRecordPageState createState() => _KeyApplyRecordPageState();
}

class _KeyApplyRecordPageState extends State<KeyApplyRecordPage>
    with TickerProviderStateMixin {
  List<String> _tabs = ['全部', '审核中', '已通过', '已驳回'];
  TabController _tabController;
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
      title: '钥匙管理',
      appBarBottom: PreferredSize(
        child: AkuTabBar(controller: _tabController, tabs: _tabs),
        preferredSize: Size.fromHeight(88.w),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(
            _tabs.length,
            (index) => KeyApplyRecordView(
                  index: index,
                )),
      ),
      bottom: AkuBottomButton(
        title: '立即申请',
        onTap: () {
          SelectPlacePage();
        },
      ),
    );
  }
}
