import 'package:aku_community_manager/mock_models/outdoor_models/outdoor_model.dart';
import 'package:aku_community_manager/provider/outdoor_provider.dart';
import 'package:aku_community_manager/ui/sub_pages/items_outdoor/items_outdoor_card.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ItemsOutdoorPage extends StatefulWidget {
  ItemsOutdoorPage({Key key}) : super(key: key);

  @override
  _ItemsOutdoorPageState createState() => _ItemsOutdoorPageState();
}

class _ItemsOutdoorPageState extends State<ItemsOutdoorPage>
    with TickerProviderStateMixin {
  List<String> _tabs = ['待出户', '已出户', '已驳回', '已作废', '全部'];
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
      title: '物品出户',
      appBarBottom: PreferredSize(
        preferredSize: Size.fromHeight(88.w),
        child: AkuTabBar(controller: _tabController, tabs: _tabs),
      ),
      body: TabBarView(
          controller: _tabController,
          children:
              _tabs.map((e) => _buildListView(_tabs.indexOf(e))).toList()),
    );
  }

  Widget _buildListView(int index) {
    final _outdoorModels = Provider.of<OutdoorProvider>(context);
    List<ItemsOutdoorModel> _selectModels =
        _outdoorModels.getOutdoorModels(index);
    return ListView(
      padding: EdgeInsets.only(left: 32.w, right: 32.w),
      children: _selectModels
          .map((e) => ItemsOutdoorCard(
                cardModel: e,
                isdetail: false,
              ))
          .toList(),
    );
  }
}
