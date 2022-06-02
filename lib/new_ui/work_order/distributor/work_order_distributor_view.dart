import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../const/saas_api.dart';
import '../../../saas_models/work_order/work_order_list_model.dart';
import '../../../utils/network/net_util.dart';
import 'distributor_card.dart';

class WorkOrderDistributorView extends StatefulWidget {
  final EasyRefreshController refreshController;
  final int index;
  const WorkOrderDistributorView({Key? key, required this.refreshController, required this.index}) : super(key: key);

  @override
  _WorkOrderDistributorViewState createState() => _WorkOrderDistributorViewState();
}

class _WorkOrderDistributorViewState extends State<WorkOrderDistributorView> {
  int _page = 1;
  int _size = 10;
  List<WorkOrderListModel> _models = [];

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
        firstRefresh: true,
        header: MaterialHeader(),
        onRefresh: () async {
          _page = 1;
          var base = await NetUtil().getList(SAASAPI.workOrder.list, params: {
            'pageNum': _page,
            'size': _size,
            'status': widget.index == 0 ? null : widget.index,
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
            'status': widget.index == 0 ? null : widget.index,
          });
          if (_models.length < base.total) {
            _models.addAll(
                base.rows.map((e) => WorkOrderListModel.fromJson(e)).toList());
            setState(() {});
          } else {
            widget.refreshController.finishLoad();
          }
        },
        child: ListView.separated(
            padding: EdgeInsets.all(24.w),
            itemBuilder: (context, index) {
              return DistributorCard(
                model: _models[index],
                refresh: widget.refreshController.callRefresh,
              );
            },
            separatorBuilder: (context, index) {
              return 24.w.heightBox;
            },
            itemCount: _models.length));
  }
}
