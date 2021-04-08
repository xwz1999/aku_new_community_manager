import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/bussiness_and_fix/dispatch_report_model.dart';
import 'package:aku_community_manager/models/manager/bussiness_and_fix/fixed_detail_model.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:dio/dio.dart';

class ManageFunc {
  ///报事报修详情
  static Future repairDetail(int id) async {
    Response response =
        await NetUtil().dio.get(API.manage.repairDetail, queryParameters: {
      'repairId': id,
    });
    return FixedDetailModel.fromJson(response.data);
  }

  ///派单类型
  static Future dispatchListDetailType() async {
    Response response = await NetUtil().dio.get(
        'http://test.akuhotel.com:8804/IntelligentCommunity' +
            API.manage.dispatchListDetailType);
    return response.data as List;
  }

  ///工单时限
  static Future workOrderTimeType() async {
    BaseModel baseModel = await NetUtil().get(API.manage.workOrderTimeLimit);
    return baseModel.data as List;
  }

  ///工单子类列表
  static Future workOrderTypeDetail(int id) async {
    BaseModel baseModel =
        await NetUtil().get(API.manage.workOrderTypeDetail, params: {
      'workOrderTypeId': id,
    });
    return baseModel.data as List;
  }

  ///派单
  static Future repairDispatch(DispatchReportModel model) async {
    BaseModel baseModel =
        await NetUtil().post(API.manage.repairDispatch, params: {
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

  ///改派
  static Future repairReassignment(int id, int operato) async {
    BaseModel baseModel = await NetUtil().get(API.manage.repairReassignment,
        params: {'dispatchListId': id, 'operator': operato});
    return baseModel;
  }

  ///接单
  static Future recevingOrders(int id) async {
    BaseModel basemodel = await NetUtil()
        .get(API.manage.recevingOrders, params: {'dispatchListId': id});
    return basemodel;
  }

  ///申请延时
  static Future applyDelayed(int id, int delayed, String remark) async {
    BaseModel baseModel =
        await NetUtil().post(API.manage.applyDelayed, params: {
      'dispatchListId': id,
      'delayedTime': delayed,
      'remake': remark,
    });
    return baseModel;
  }

  ///报事报修：处理完成
  static Future handleResult(
      int dispatchListId,
      String detail,
      String materialList,
      double laborCost,
      double materialCost,
      double totalCost,
      int repairResult,
      List<String> fileUrls) async {
    BaseModel baseModel =
        await NetUtil().post(API.manage.handleResult, params: {
      'dispatchListId': dispatchListId,
      'detail': detail,
      'materialList': materialList,
      'laborCost': laborCost,
      'materialCost': materialCost,
      'totalCost': totalCost,
      'repairResult': repairResult,
      'fileUrls': fileUrls,
    });
    return baseModel;
  }
}
