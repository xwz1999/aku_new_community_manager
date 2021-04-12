import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:dio/dio.dart';

class BussinessFunc{
  static Future getBussinessModelList(int backlogStatus) async {
    Response response =
        await NetUtil().dio.get(API.manage.backlogList, queryParameters: {
      "backlogStatus": backlogStatus,
    });
    return response.data['data'] as List;
  }
}