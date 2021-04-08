import 'dart:io';

import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/decoration/decoration_detail_model.dart';
import 'package:aku_community_manager/models/manager/inspection/inspection_check_detail_model.dart';
import 'package:aku_community_manager/models/manager/inspection/inspection_detail_model.dart';
import 'package:aku_community_manager/models/manager/inspection/inspection_point_model.dart';
import 'package:aku_community_manager/models/manager/inspection/inspection_point_submit_model.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ManageFunc {
  static Future<DecorationDetailModel> getDetcorationDetail(int id) async {
    Response response = await NetUtil()
        .dio
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
      int executeId) async {
    BaseModel baseModel =
        await NetUtil().get(API.manage.inspectionFindDetailByld, params: {
      "executeId": executeId,
    });
    return InspectionDetailModel.fromJson(baseModel.data);
  }

  static Future<List<InspectionPointModel>> getInspectionPointByPlanId(
      {@required int planId}) async {
    BaseModel baseModel =
        await NetUtil().get(API.manage.inspectionPointByPlanId, params: {
      "planId": planId,
    });
    return (baseModel.data as List)
        .map((e) => InspectionPointModel.fromJson(e))
        .toList();
  }

  static Future<List<InspectionPointModel>> getInspectionPointByExcuteId(
      {@required int excuteId}) async {
    BaseModel baseModel = await NetUtil()
        .get(API.manage.inspecntionFindPointByExecuteId, params: {
      "executeId": excuteId,
    });
    return (baseModel.data as List)
        .map((e) => InspectionPointModel.fromJson(e))
        .toList();
  }

  static Future<BaseModel> getInspectionFindCheckDetailByQr(
      int executeId, int excutePointId) async {
    BaseModel baseModel = await NetUtil().get(
        API.manage.inspectionFindCheckDetailByQR,
        params: {"executeId": executeId, "executePointId": excutePointId});
    return baseModel;
  }

  static Future getSubmitPoint(InspectionPointSubmitModel model) async {
    BaseModel baseModel =
        await NetUtil().post(API.manage.submitPointDetail, params: {
      "executePointId": model.executePointId,
      "executeCheckList": model.executeCheckList
          .map((e) => ExecuteCheckList(e.id, e.status, e.remarks).toJson())
          .toList(),
      "inspectionFaceImg": model.inspectionFaceImgPath,
      "inspectionSpaceImg": model.inspectionSpaceImgPath
    });

    return baseModel;
  }

  static Future getInspectionPointCheckDetail(
      int executePointId) async {
    BaseModel baseModel =
        await NetUtil().get(API.manage.inspectionPointCheckDetail, params: {
      "executePointId": executePointId,
    });
    return baseModel;
  }

  static Future uploadFace(File file) async {
    BaseModel baseModel = await NetUtil()
        .post(API.upload.uploadInspectionFace, params: {"file": file});
    return baseModel.data as String;
  }

  static Future uploadSpace(File file) async {
    BaseModel baseModel = await NetUtil()
        .post(API.upload.uploadInspectionSpace, params: {"file": file});
    return baseModel.data as String;
  }
}
