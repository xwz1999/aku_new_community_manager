import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:dio/dio.dart';

class ManageFunc {
  static Future repairDetail(int id) async {
    Response response =
        await NetUtil().dio.get(API.manage.repairDetail, queryParameters: {
      'repairId': id,
    });
    return response.data;
  }

  static Future dispatchListDetailType() async {
    Response response =
        await NetUtil().dio.get(API.manage.dispatchListDetailType);
    return response.data as List;
  }
}
