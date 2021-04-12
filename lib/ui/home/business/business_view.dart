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
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BussinessView extends StatefulWidget {
  final int backlogStatus;
  BussinessView({Key key, this.backlogStatus}) : super(key: key);

  @override
  _BussinessViewState createState() => _BussinessViewState();
}

class _BussinessViewState extends State<BussinessView> {
  List _modelList;
  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
        firstRefresh: true,
        header: MaterialHeader(),
        onRefresh: () async {
          List dataList =
              await BussinessFunc.getBussinessModelList(widget.backlogStatus);
          _modelList = dataList.map((e) => ToDoModel.fromJson(e)).toList();
        },
        child: ListView(
          children: [
            ..._modelList.map((e) {
              if (e.runtimeType == BussinessAndFixModel) {
                BusinessFixCard(model: e);
              } else if (e.runtimeType == ToDoOutDoorModel) {
                ToDoOutDoorCard(
                  model: e,
                );
              }
            }).toList()
          ],
        ));
  }
}
