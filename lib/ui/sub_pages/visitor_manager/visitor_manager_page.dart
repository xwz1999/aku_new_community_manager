import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/sub_pages/visitor_manager/visitor_manager_card.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum VisitorStatus {
  NOT_VISIT,
  VISIT_DONE,
  OUTDATE,
}

class VisitorCardsModel {
  String adress;
  String name;
  String plate;
  String time;
  VisitorStatus status;
  VisitorCardsModel({this.adress, this.name, this.status,
      this.plate, this.time});
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

  List<VisitorCardsModel> _cards = [
    VisitorCardsModel(
      adress:'深圳华悦茂峰1幢1单元702',
      name:'马泽城',
      status:VisitorStatus.VISIT_DONE,
      plate: '浙BA9899',
      time: '2020-10-24 12:00',
    ),
    VisitorCardsModel(adress:'深圳华悦茂峰2幢2单元702',name:'刘揪心',status: VisitorStatus.NOT_VISIT),
    VisitorCardsModel(adress:'深圳华悦茂峰3幢3单元602', name:'张空间', status:VisitorStatus.OUTDATE),
  ];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 4, vsync: this, initialIndex: widget.initIndex);
  }

  @override
  void dispose() {
    _tabController?.dispose();
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

  Widget _buildListView(int index) {
    List<VisitorCardsModel> _selectCards;
    switch (index) {
      case 0:
        _selectCards = _cards;
        break;
      case 1:
        _selectCards = _cards
            .where((element) => element.status == VisitorStatus.NOT_VISIT)
            .toList();
        break;
      case 2:
        _selectCards = _cards
            .where((element) => element.status == VisitorStatus.VISIT_DONE)
            .toList();
        break;
      case 3:
        _selectCards = _cards
            .where((element) => element.status == VisitorStatus.OUTDATE)
            .toList();
        break;
    }
    return ListView(
      padding: EdgeInsets.only(left: 32.w, right: 32.w),
      children: _selectCards
          .map((e) => VisitorManagerCard(
                adress: e.adress,
                name: e.name,
                plate: e.plate,
                time: e.time,
                status: e.status,
              ))
          .toList(),
    );
  }
}
