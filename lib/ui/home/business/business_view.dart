import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/bussiness_and_fix/bussiness_and_fix_model.dart';
import 'package:aku_community_manager/models/todo_bussiness/todo_model.dart';
import 'package:aku_community_manager/models/todo_bussiness/todo_outdoor_model.dart';
import 'package:aku_community_manager/ui/home/business/bussiness_func.dart';
import 'package:aku_community_manager/ui/home/business/todo_outdoor_card.dart';
import 'package:aku_community_manager/ui/sub_pages/business_and_fix/business_fix_card.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BussinessView extends StatefulWidget {
  final int backlogStatus;
  BussinessView({Key key, this.backlogStatus}) : super(key: key);

  @override
  _BussinessViewState createState() => _BussinessViewState();
}

class _BussinessViewState extends State<BussinessView>
    with AutomaticKeepAliveClientMixin {
  List _modelList;
  EasyRefreshController _refreshController;
  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _refreshController = EasyRefreshController();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _refreshController?.dispose();
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return EasyRefresh(
      scrollController: _scrollController,
      firstRefresh: true,
      controller: _refreshController,
      header: MaterialHeader(),
      onRefresh: () async {
        var dataList = await BussinessFunc.getBussinessModelList(widget.backlogStatus);
        _modelList = dataList.map((e) => ToDoModel.fromJson(e)).toList();
        setState(() {});
      },
      child: _modelList == null
          ? _emptyWidget()
          : ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
              children: [
                ..._modelList.map((e) {
                  if (e.dynamicModel.runtimeType == BussinessAndFixModel) {
                    return BusinessFixCard(model: e.dynamicModel);
                  } else if (e.dynamicModel.runtimeType == ToDoOutDoorModel) {
                    return ToDoOutDoorCard(
                      model: e.dynamicModel,
                    );
                  }
                }).toList()
              ],
            ),
    );
  }

  Widget _emptyWidget() {
    return SizedBox();
  }

  

  @override
  bool get wantKeepAlive => true;
}