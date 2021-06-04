import 'package:aku_community_manager/ui/manage_pages/interview/interview_view.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InterviewPage extends StatefulWidget {
  InterviewPage({Key? key}) : super(key: key);

  @override
  _InterviewPageState createState() => _InterviewPageState();
}

class _InterviewPageState extends State<InterviewPage> with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() { 
    super.initState();
    _tabController=TabController(length: _tabs.length, vsync: this);
  }
  List<String> _tabs=['待回复','已回复'];
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '访谈管理',
      appBarBottom: PreferredSize(preferredSize: Size.fromHeight(88.w),child: AkuTabBar(controller: _tabController!, tabs: _tabs),),
      body:TabBarView(
        controller: _tabController,
        children: List.generate(_tabs.length, (index) => InterviewView(index:index))),
    );
  }
}
