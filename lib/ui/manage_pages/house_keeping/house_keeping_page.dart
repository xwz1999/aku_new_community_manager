import 'package:aku_community_manager/ui/manage_pages/house_keeping/house_keeping_add_page.dart';
import 'package:aku_community_manager/ui/manage_pages/house_keeping/house_keeping_view.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_tab_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HouseKeepingPage extends StatefulWidget {
  HouseKeepingPage({Key? key}) : super(key: key);

  @override
  _HouseKeepingPageState createState() => _HouseKeepingPageState();
}

class _HouseKeepingPageState extends State<HouseKeepingPage>
    with TickerProviderStateMixin {
  List<String> _tabs = ['全部', '待派单', '已派单', '处理中', '待支付', '待评价', '已完成'];
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '家政服务',
      appBarBottom: PreferredSize(
        preferredSize: Size.fromHeight(88.w),
        child: AkuTabBar(controller: _tabController, tabs: _tabs,isScrollable: true,),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(
          _tabs.length,
          (index) => HouseKeepingView(
            index: index,
          ),
        ),
      ),
      actions: [
        IconButton(
            iconSize: 40.w,
            icon: Icon(
              CupertinoIcons.plus_circle,
              size: 40.w,
              color: Colors.black,
            ),
            onPressed: () {
              Get.to(() => HouseKeepingAddPage());
            })
      ],
      // body: HouseKeepingView(
      //   index: 0,
      // ),
    );
  }
}
