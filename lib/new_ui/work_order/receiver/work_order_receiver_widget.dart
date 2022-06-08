import 'package:aku_new_community_manager/const/saas_api.dart';
import 'package:aku_new_community_manager/new_ui/work_order/distributor/distributor_card.dart';
import 'package:aku_new_community_manager/new_ui/work_order/receiver/receiver_card.dart';
import 'package:aku_new_community_manager/saas_models/work_order/work_order_list_model.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/aku_tab_bar.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class WorkOrderReceiverWidget extends StatefulWidget {
  final int index;
  final EasyRefreshController refreshController;

  const WorkOrderReceiverWidget({Key? key, required this.index, required this.refreshController}) : super(key: key);

  @override
  _WorkOrderReceiverWidgetState createState() => _WorkOrderReceiverWidgetState();
}

class _WorkOrderReceiverWidgetState extends State<WorkOrderReceiverWidget>
    with SingleTickerProviderStateMixin {

  int _page = 1;
  int _size = 10;
  List<WorkOrderListModel> _models = [];

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
        firstRefresh: true,
        header: MaterialHeader(),
        onRefresh: () async {
          _models = [];
          _page = 1;
          var base = await NetUtil().getList(SAASAPI.workOrder.list, params: {
            'pageNum': _page,
            'size': _size,
            'status': widget.index == 0 ? null : widget.index ,
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
            'status': widget.index == 0 ? null : widget.index ,
          });
          if (_models.length < base.total) {
            _models.addAll(
                base.rows.map((e) => WorkOrderListModel.fromJson(e)).toList());
            setState(() {});
          } else {
            widget.refreshController.finishLoad();
          }
        },
        child:_models==[]?SizedBox(): ListView.separated(
            padding: EdgeInsets.all(24.w),
            itemBuilder: (context, index) {
              return ReceiverCard(
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
