import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/bussiness_and_fix/dispatch_report_model.dart';
import 'package:aku_community_manager/models/manager/bussiness_and_fix/fixed_detail_model.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:dio/dio.dart';

class ManageFunc {
  static Future repairDetail(int id) async {
    Response response =
        await NetUtil().dio.get(API.manage.repairDetail, queryParameters: {
      'repairId': id,
    });
    return FixedDetailModel.fromJson(response.data);
  }

  static Future dispatchListDetailType() async {
    Response response = await NetUtil().dio.get(
        'http://test.akuhotel.com:8804/IntelligentCommunity' +
            API.manage.dispatchListDetailType);
    return response.data as List;
  }

  static Future workOrderTimeType() async {
    BaseModel baseModel = await NetUtil().get(API.manage.workOrderTimeLimit);
    return baseModel.data as List;
  }

  static Future workOrderTypeDetail(int id) async {
    BaseModel baseModel =
        await NetUtil().get(API.manage.workOrderTypeDetail, params: {
      'workOrderTypeId': id,
    });
    return baseModel.data as List;
  }

  static Future repairDispatch(DispatchReportModel model) async {
    BaseModel baseModel =
        await NetUtil().get(API.manage.repairDispatch, params: {
      'dispatchListId': model.dispatchListId,
      'workOrderType': model.workOrderTyoe,
      'workOrderTypeDetail': model.workOrderTypeDetail,
      'workOrderTimeLimit': model.workOrderTimeLimit,
      'type': model.type,
      'operator': model.operato,
      'remake': model.remark,
    });
    return baseModel;
  }

  static Future repairReassignment(int id, int operato) async {
    BaseModel baseModel = await NetUtil().get(API.manage.repairReassignment,
        params: {'dispatchListId': id, 'operator': operato});
    return baseModel;
  }
}
