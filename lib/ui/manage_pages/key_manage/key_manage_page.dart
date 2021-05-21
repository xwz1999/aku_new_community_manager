// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

// Project imports:
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/manage_pages/key_manage/key_apply_record_page.dart';
import 'package:aku_community_manager/ui/manage_pages/key_manage/key_manage_view.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_tab_bar.dart';

class KeyManagePage extends StatefulWidget {
  KeyManagePage({Key key}) : super(key: key);

  @override
  _KeyManagePageState createState() => _KeyManagePageState();
}

class _KeyManagePageState extends State<KeyManagePage>
    with TickerProviderStateMixin {
  List<String> _tabs = ['钥匙列表', '未归还钥匙'];
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
      actions: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 26.w, horizontal: 32.w),
          child: InkWell(
            onTap: () {
              Get.to(() => KeyApplyRecordPage());
            },
            child: '申请记录'.text.size(26.sp).color(kTextPrimaryColor).make(),
          ),
        ),
      ],
      appBarBottom: PreferredSize(
        child: AkuTabBar(controller: _tabController, tabs: _tabs),
        preferredSize: Size.fromHeight(88.w),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(
            _tabs.length,
            (index) => KeyManageView(
                  index: index,
                )),
      ),
      // bottom: AkuBottomButton(
      //   title: '立即申请',
      //   onTap: () {
      //     Get.to(() => SelectPlacePage());
      //   },
      // ),
    );
  }
}
