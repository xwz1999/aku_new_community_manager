// Dart imports:

// Flutter imports:

// Project imports:
import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/const/saas_api.dart';
import 'package:aku_new_community_manager/models/manager/decoration/decoration_detail_model.dart';
import 'package:aku_new_community_manager/models/manager/inspection/inspection_detail_model.dart';
import 'package:aku_new_community_manager/models/manager/inspection/inspection_point_model.dart';
import 'package:aku_new_community_manager/models/manager/inspection/inspection_point_submit_model.dart';
import 'package:aku_new_community_manager/saas_models/net_model/base_model.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
import 'package:dio/dio.dart';
// Package imports:

class ManageFunc {
  static Future<DecorationDetailModel> getDetcorationDetail(int id) async {
    Response response = await NetUtil()
        .dio!
        .get(API.manage.decorationFindByld, queryParameters: {
      'decorationId': id,
    });
    return DecorationDetailModel.fromJson(response.data);
  }

  static Future getContactOwner(int id) async {
    BaseModel baseModel = await NetUtil().get(
      API.manage.goodsOutContactOwner,
      params: {
        'estateId': id,
      },
    );
    return baseModel.data;
  }

  static Future<InspectionDetailModel> getInspectionDetail(
      int /*!*/ executeId) async {
    BaseModel baseModel =
        await NetUtil().get(SAASAPI.inspection.detail, params: {
      "executeId": executeId,
    });
    return InspectionDetailModel.fromJson(baseModel.data);
  }

  static Future<List<InspectionPointModel>> getInspectionPointByPlanId(
      {required int planId}) async {
    BaseModel baseModel =
        await NetUtil().get(SAASAPI.inspection.findPointByPlanId, params: {
      "planId": planId,
    });
    return (baseModel.data as List)
        .map((e) => InspectionPointModel.fromJson(e))
        .toList();
  }

  static Future<List<InspectionPointModel>> getInspectionPointByExcuteId(
      {required int /*!*/ excuteId}) async {
    BaseModel baseModel =
        await NetUtil().get(SAASAPI.inspection.findPointByExecuteId, params: {
      "executeId": excuteId,
    });
    return (baseModel.data as List)
        .map((e) => InspectionPointModel.fromJson(e))
        .toList();
  }

  static Future<BaseModel> getInspectionFindCheckDetailByQr(
      int executeId, String executePointCode) async {
    BaseModel baseModel = await NetUtil().get(
        SAASAPI.inspection.findCheckDetailByQR,
        params: {"executeId": executeId, "executePointCode": executePointCode});
    return baseModel;
  }

  static Future getSubmitPoint(InspectionPointSubmitModel model) async {
    BaseModel baseModel =
        await NetUtil().post(SAASAPI.inspection.submit, params: {
      "id": model.executePointId,
      "executeCheckList": model.executeCheckList!
          .map((e) => ExecuteCheckList(e.id, e.status, e.remakes).toJson())
          .toList(),
      "inspectionFaceImg": model.inspectionFaceImg,
      "inspectionSpaceImg": model.inspectionSpaceImg
    });

    return baseModel;
  }

  static Future getInspectionPointCheckDetail(int executePointId) async {
    BaseModel baseModel =
        await NetUtil().get(SAASAPI.inspection.findExecutePointInfo, params: {
      "executePointId": executePointId,
    });
    return baseModel;
  }

  static Future getInspectionPointCheckDetailUnbegin(int planPointId) async {
    BaseModel baseModel =
        await NetUtil().get(SAASAPI.inspection.findExecutePointInfo, params: {
      "planPointId": planPointId,
    });
    return baseModel;
  }
}
