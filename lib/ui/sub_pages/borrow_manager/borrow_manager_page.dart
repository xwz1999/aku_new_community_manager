// Flutter imports:
// Project imports:
import 'package:aku_new_community_manager/provider/user_provider.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/ui/sub_pages/borrow_manager/all_borrow_goods.dart';
import 'package:aku_new_community_manager/ui/sub_pages/borrow_manager/borrow_manager_view.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/aku_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class BorrowManagerPage extends StatefulWidget {
  BorrowManagerPage({Key? key}) : super(key: key);

  @override
  _BorrowManagerPageState createState() => _BorrowManagerPageState();
}

class _BorrowManagerPageState extends State<BorrowManagerPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  List<String> get _tabs {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return [
      '全部',
      ...userProvider.userInfoModel!.type == 1 ? ['待审核'] : [],
      ...userProvider.userInfoModel!.type == 1 ? ['检查中'] : [],
      '出借中',
      '已归还'
    ];
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '物品清单',
      appBarBottom: PreferredSize(
          child: AkuTabBar(
            controller: _tabController!,
            tabs: _tabs,
          ),
          preferredSize: Size.fromHeight(96.w)),
      actions: [
        AkuMaterialButton(
          minWidth: 178.w,
          onPressed: () {
            Get.to(() => AllBorrowGoods());
          },
          child: Text(
            '全部物品',
            style: TextStyle(
              fontSize: 28.w,
              color: AppStyle.primaryTextColor,
            ),
          ),
        ),
      ],
      body: TabBarView(
        controller: _tabController,
        children: _getChildren(),
      ),
    );
  }

  List<Widget> _getChildren() {
    final userProvider = Provider.of<UserProvider>(context);
    return [
      BorrowManagerView(),
      ...userProvider.userInfoModel!.type == 1
          ? [BorrowManagerView(status: -1)]
          : [],
      ...userProvider.userInfoModel!.type == 1
          ? [BorrowManagerView(status: 3)]
          : [],
      BorrowManagerView(status: 1),
      BorrowManagerView(status: 2),
    ];
  }
}
