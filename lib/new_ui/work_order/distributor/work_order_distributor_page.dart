import 'package:aku_new_community_manager/const/saas_api.dart';
import 'package:aku_new_community_manager/new_ui/work_order/distributor/distributor_card.dart';
import 'package:aku_new_community_manager/saas_models/work_order/work_order_list_model.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/aku_tab_bar.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class WorkOrderDistributorPage extends StatefulWidget {
  const WorkOrderDistributorPage({Key? key}) : super(key: key);

  @override
  _WorkOrderDistributorPageState createState() =>
      _WorkOrderDistributorPageState();
}

class _WorkOrderDistributorPageState extends State<WorkOrderDistributorPage>
    with SingleTickerProviderStateMixin {
  List<String> _tabs = [
    '全部',
    '待分配',
    '工单池',
    '已接单',
    '处理中',
    '待确认',
    '已完成',
    '已评价',
    '已取消'
  ];
  late TabController _tabController;
  EasyRefreshController _refreshController = EasyRefreshController();
  int _page = 1;
  int _size = 10;
  List<WorkOrderListModel> _models = [];

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '工单管理',
      actions: [
        // IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       CupertinoIcons.plus_circle,
        //       size: 40.w,
        //     ))
      ],
      appBarBottom: PreferredSize(
        preferredSize: Size.fromHeight(88.w),
        child: AkuTabBar(
          isScrollable: true,
          tabs: _tabs,
          controller: _tabController,
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children:
              _tabs.mapIndexed((e, index) => _getOrderView(index)).toList()),
    );
  }

  Widget _getOrderView(int index) {
    return EasyRefresh(
        firstRefresh: true,
        header: MaterialHeader(),
        onRefresh: () async {
          _page = 1;
          var base = await NetUtil().getList(SAASAPI.workOrder.list, params: {
            'pageNum': _page,
            'size': _size,
            'status': index == 0 ? null : index,
          });
          _models =
              base.rows.map((e) => WorkOrderListModel.fromJson(e)).toList();
          setState(() {});
        },
        onLoad: () async {
          _page++;
          var base = await NetUtil().getList(SAASAPI.workOrder.list, params: {
            'pageNum': _page,
            'size': _size,
            'status': index == 0 ? null : index,
          });
          if (_models.length < base.total) {
            _models.addAll(
                base.rows.map((e) => WorkOrderListModel.fromJson(e)).toList());
            setState(() {});
          } else {
            _refreshController.finishLoad();
          }
        },
        child: ListView.separated(
            padding: EdgeInsets.all(24.w),
            itemBuilder: (context, index) {
              return DistributorCard(
                model: _models[index],
                refresh: _refreshController.callRefresh,
              );
            },
            separatorBuilder: (context, index) {
              return 24.w.heightBox;
            },
            itemCount: _models.length));
  }
}
