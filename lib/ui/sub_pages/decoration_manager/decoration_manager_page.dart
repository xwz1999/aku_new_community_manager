import 'package:aku_community_manager/mock_models/decoration/decoration_data.dart';
import 'package:aku_community_manager/mock_models/decoration/decoration_model.dart';
import 'package:aku_community_manager/mock_models/users/user_info_model.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/ui/sub_pages/decoration_manager/decoration_manager_card.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_tab_bar.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DecorationManagerPage extends StatefulWidget {
  DecorationManagerPage({Key key}) : super(key: key);

  @override
  _DecorationManagerPageState createState() => _DecorationManagerPageState();
}

class _DecorationManagerPageState extends State<DecorationManagerPage>
    with TickerProviderStateMixin {
  TabController _tabController;
  USER_ROLE get role =>
      Provider.of<UserProvider>(context, listen: false).userInfoModel.role;

  List<String> get tabs {
    switch (role) {
      case USER_ROLE.MANAGER:
        return ['待指派', '已指派', '已执行', '全部'];
        break;

      case USER_ROLE.PROPERTY:
        return ['待执行', '已执行', '全部'];
        break;
      default:
        return ['装修中', '装修完成', '全部'];
        break;
    }
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '装修管理',
      appBarBottom: PreferredSize(
        child: AkuTabBar(
          controller: _tabController,
          tabs: tabs,
        ),
        preferredSize: Size.fromHeight(96.w),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _getViews(),
      ),
    );
  }

  List<Widget> _getViews() {
    switch (role) {
      case USER_ROLE.MANAGER:
        return [
          _getSingleListView(
              DecorationData.getModels(DecorationType.WAIT_HAND_OUT)),
          _getSingleListView(DecorationData.getModels(DecorationType.HAND_OUT)),
          _getSingleListView(DecorationData.getModels(DecorationType.DONE)),
          _getSingleListView(DecorationData.allModels),
        ];
        break;
      case USER_ROLE.PROPERTY:
        return [
          _getSingleListView(DecorationData.getModels(DecorationType.HAND_OUT)),
          _getSingleListView(DecorationData.getModels(DecorationType.DONE)),
          _getSingleListView(DecorationData.allPropertyModels),
        ];
      default:
        return [
          _getSingleListView(
              DecorationData.getTypeModels(DecorationStatusType.PROGRESS)),
          _getSingleListView(
              DecorationData.getTypeModels(DecorationStatusType.DONE)),
          _getSingleListView(DecorationData.allPropertyModels),
        ];
        break;
    }
  }

  _getSingleListView(List<DecorationModel> models) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return DecorationManagerCard(model: models[index]);
      },
      itemCount: models.length,
      padding: EdgeInsets.symmetric(horizontal: 32.w),
    );
  }
}
