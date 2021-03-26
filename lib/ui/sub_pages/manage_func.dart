import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/decoration/decoration_detail_model.dart';
import 'package:aku_community_manager/models/manager/inspection/inspection_detail_model.dart';
import 'package:aku_community_manager/models/manager/inspection/inspection_point_model.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:dio/dio.dart';

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

  static Future<List> getInspectionPoint(int id) async {
    BaseModel baseModel =
        await NetUtil().get(API.manage.inspectionPointByPlanId, params: {
      "planId": id,
    });
    return baseModel.data as List;
  }
}
