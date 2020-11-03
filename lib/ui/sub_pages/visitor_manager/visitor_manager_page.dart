import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/sub_pages/visitor_manager/visitor_manager_card.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum VisitorStatus{
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
  VisitorCardsModel(this.adress,this.name, this.status,{this.plate,this.time});
}

class VisitorManagerPage extends StatefulWidget {
  final initIndex;
  VisitorManagerPage({Key key, this.initIndex = 0}) : super(key: key);

  @override
  _VisitorManagerPageState createState() => _VisitorManagerPageState();
}

class _VisitorManagerPageState extends State<VisitorManagerPage>
    with TickerProviderStateMixin {
  List<String> tabs = ['全部', '未到访', '已到访', '已过期'];

  List<VisitorCardsModel> cards=[
    VisitorCardsModel('深圳华悦茂峰1幢1单元702', '马泽城',VisitorStatus.VISIT_DONE, plate:'浙BA9899',time:'2020-10-24 12:00',),
    VisitorCardsModel('深圳华悦茂峰2幢2单元702', '刘揪心',VisitorStatus.NOT_VISIT),
    VisitorCardsModel('深圳华悦茂峰3幢3单元602', '刘揪心',VisitorStatus.OUTDATE),
  ];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 4, vsync: this, initialIndex: widget.initIndex);
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '访客管理',
      appBarBottom: PreferredSize(
          child: AkuTabBar(
            tabs: tabs,           
            controller: _tabController,
          ),
          preferredSize: Size.fromHeight(88.w)),
      body: ListView(
        padding: EdgeInsets.only(left:32.w,right:32.w), 
        children: [
          ...cards.map((e) => VisitorManagerCard(adress: e.adress,name: e.name,plate: e.plate,time: e.time,)).toList(),
        ],
      ),
    );
  }
}
