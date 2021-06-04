import 'package:aku_community_manager/ui/sub_pages/decoration_manager/new_renovation/new_renovation_view.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewRenovationPage extends StatefulWidget {
  NewRenovationPage({Key? key}) : super(key: key);

  @override
  _NewRenovationState createState() => _NewRenovationState();
}

class _NewRenovationState extends State<NewRenovationPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  List<String> _tabs = ['检查中', '检查通过','检查不通过'];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '装修管理',
      appBarBottom: PreferredSize(preferredSize: Size.fromHeight(88.w),child: AkuTabBar(controller: _tabController!, tabs: _tabs),),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(_tabs.length, (index) => NewRenovationView(index:index+6))),
    );
  }
}
