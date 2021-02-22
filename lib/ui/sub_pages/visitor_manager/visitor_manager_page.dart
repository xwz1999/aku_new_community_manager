// Flutter imports:
import 'package:aku_community_manager/models/visitor/visitor_cards_model.dart';
import 'package:aku_community_manager/tools/aku_map.dart';
import 'package:aku_community_manager/utils/manage_func.dart';
import 'package:aku_community_manager/utils/network/base_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/sub_pages/visitor_manager/visitor_manager_card.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_tab_bar.dart';
import 'package:aku_community_manager/tools/extensions/list_extension_tool.dart';
import 'package:velocity_x/velocity_x.dart';

enum VisitorStatus {
  NOT_VISIT,
  VISIT_DONE,
  OUTDATE,
  CANCEL,
}

class VisitorManagerPage extends StatefulWidget {
  final initIndex;
  VisitorManagerPage({Key key, this.initIndex = 0}) : super(key: key);

  @override
  _VisitorManagerPageState createState() => _VisitorManagerPageState();
}

class _VisitorManagerPageState extends State<VisitorManagerPage>
    with TickerProviderStateMixin {
  List<String> _tabs = ['全部', '未到访', '已到访', '已过期'];
  int _page = 1;
  int _size = 10;
  EasyRefreshController _easyRefreshController;
  TabController _tabController;
  List<VisitorCardsModel> _models = [];

  bool _onload = true;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 4, vsync: this, initialIndex: widget.initIndex);

    _easyRefreshController = EasyRefreshController();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _easyRefreshController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
        title: '访客管理',
        appBarBottom: PreferredSize(
            child: AkuTabBar(
              tabs: _tabs,
              controller: _tabController,
            ),
            preferredSize: Size.fromHeight(88.w)),
        body: TabBarView(
          controller: _tabController,
          children: _tabs.map((e) => _buildListView(_tabs.indexOf(e))).toList(),
        ));
  }

  Widget _empty() {
    return Container();
  }

  Widget _buildListView(int index) {
    // switch (index) {
    //   case 0:
    //     _selectCards = _cards;
    //     break;
    //   case 1:
    //     _selectCards = _cards
    //         .where((element) => element.status == VisitorStatus.NOT_VISIT)
    //         .toList();
    //     break;
    //   case 2:
    //     _selectCards = _cards
    //         .where((element) => element.status == VisitorStatus.VISIT_DONE)
    //         .toList();
    //     break;
    //   case 3:
    //     _selectCards = _cards
    //         .where((element) => element.status == VisitorStatus.OUTDATE)
    //         .toList();
    //     break;
    // }
    return EasyRefresh(
      firstRefresh: true,
      controller: _easyRefreshController,
      header: MaterialHeader(),
      // emptyWidget: Container(),
      onRefresh: () async {
        _page = 1;
        _size = 10;
        BaseListModel baseListModel =
            await ManageFunc.visitorList(_page, _size, statuts: index);
        _models = baseListModel.tableList
            .map((e) => VisitorCardsModel.fromJson(e))
            .toList();
        _onload = false;
        setState(() {});
      },
      onLoad: () async {
        _page++;
        BaseListModel baseListModel =
            await ManageFunc.visitorList(_page, _size, statuts: index);
        _models.addAll(baseListModel.tableList
            .map((e) => VisitorCardsModel.fromJson(e))
            .toList());
        if (_page >= baseListModel.pageCount) {
          _easyRefreshController.finishLoad(noMore: true);
        }
        setState(() {});
      },
      child: _onload
          ? _empty()
          : ListView(
              padding: EdgeInsets.only(
                  left: 32.w, right: 32.w, top: 16.w, bottom: 16.w),
              children: _models
                  .map(
                    (e) => VisitorManagerCard(
                      adress: e.roomName,
                      name: e.name,
                      plate: e.carNum,
                      time: e.visitDate,
                      status: AkuMap.vistorStatus[e.visitorStatus],
                    ),
                  )
                  .toList()
                  .sepWidget(separate: 16.w.heightBox),
            ),
    );
  }
}
