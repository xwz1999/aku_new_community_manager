// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:aku_community_manager/mock_models/borrow/borrow_data.dart';
import 'package:aku_community_manager/mock_models/borrow/borrow_model.dart';
import 'package:aku_community_manager/mock_models/users/user_info_model.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/sub_pages/borrow_manager/all_borrow_goods.dart';
import 'package:aku_community_manager/ui/sub_pages/borrow_manager/borrow_manager_card.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_tab_bar.dart';

class BorrowManagerPage extends StatefulWidget {
  BorrowManagerPage({Key key}) : super(key: key);

  @override
  _BorrowManagerPageState createState() => _BorrowManagerPageState();
}

class _BorrowManagerPageState extends State<BorrowManagerPage>
    with TickerProviderStateMixin {
  USER_ROLE get role =>
      Provider.of<UserProvider>(context, listen: false).userInfoModel.role;
  TabController _tabController;
  List<String> get _tabs {
    switch (role) {
      case USER_ROLE.MANAGER:
        return ['全部', '出借中', '待检查', '已归还'];
      default:
        return ['全部', '出借中', '已归还'];
    }
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
            controller: _tabController,
            tabs: _tabs,
          ),
          preferredSize: Size.fromHeight(96.w)),
      actions: [
        AkuMaterialButton(
          minWidth: 178.w,
          onPressed: () {
            Get.to(AllBorrowGoods());
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
    switch (role) {
      case USER_ROLE.MANAGER:
        return [
          getView(BorrowData.models),
          getView(BorrowData.borrowModels),
          getView(BorrowData.checkModels),
          getView(BorrowData.doneModels),
        ];
        break;
      default:
        return [
          getView(BorrowData.models),
          getView(BorrowData.borrowModels),
          getView(BorrowData.doneModels),
        ];
    }
  }
}

Widget getView(List<BorrowModel> models) {
  return ListView.builder(
    itemBuilder: (context, index) {
      return BorrowManagerCard(
        model: models[index],
      );
    },
    itemCount: models.length,
  );
}
