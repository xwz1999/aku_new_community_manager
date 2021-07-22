import 'dart:io';

import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/json_models/manager/house_keeping/house_keeping_pick_staff_model.dart';
import 'package:aku_community_manager/json_models/manager/house_keeping/house_keeping_process_model.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:bot_toast/bot_toast.dart';

class HouseKeepingFunc {
  ///获取家政服务进程
  static Future<List<HouseKeepingProcessModel>> getHouseKeepingProcess(
      int id) async {
    BaseModel baseModel = await NetUtil().get(API.manage.newHouseKeepingProcess,
        params: {"housekeepingServiceId": id});
    if (baseModel.status ?? false) {
      return (baseModel.data as List)
          .map((e) => HouseKeepingProcessModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  ///催单
  static Future newHouseKeepingUrgeWork(int id) async {
    BaseModel baseModel =
        await NetUtil().get(API.manage.newHouseKeepingUrgeWork, params: {
      "housekeepingServiceId": id,
    });
    if (baseModel.status ?? false) {
      BotToast.showText(text: '已成功催单，请耐心等候');
      return true;
    } else {
      return false;
    }
  }

  ///接单
  static Future newHouseKeepingOrderReceive(int id) async {
    BaseModel baseModel =
        await NetUtil().post(API.manage.newHouseKeepingOrderReceive, params: {
      "id": id,
    });
    if (baseModel.status ?? false) {
      BotToast.showText(text: '接单成功');
      return true;
    } else {
      return false;
    }
  }

  ///获得派单人员列表
  static Future newHouseKeepingPickStaffList() async {
    BaseModel baseModel =
        await NetUtil().get(API.manage.newHouseKeepingPickStaffList);
    if (baseModel.status ?? false) {
      return (baseModel.data as List)
          .map((e) => HouseKeepingPickStaffModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  ///派单
  static Future newHouseKeepingOrderDepart(int id, int handlerId) async {
    BaseModel baseModel =
        await NetUtil().post(API.manage.newHouseKeepingOrderDepart, params: {
      "id": id,
      "handler": handlerId,
    });
    if (baseModel.status ?? false) {
      BotToast.showText(text: '派单成功');
      return true;
    } else {
      BotToast.showText(text: baseModel.message ?? '派单失败');
      return false;
    }
  }

  ///上传处理完成照片
  static Future<List<String>> uploadHouseKeepingHandlePhoto(
      List<File> files) async {
    List<String> urls =
        await NetUtil().uploadFiles(files, API.upload.uploadHandlerPhoto);

    return urls;
  }

  ///提交报告
  static Future newHouseKeepingSubmit(
    int id,
    int completion,
    String description,
    double materialFee,
    double serviceFee,
    double payFee,
    List<String> urls,
  ) async {
    BaseModel baseModel =
        await NetUtil().post(API.manage.newHouseKeepingSubmit, params: {
      "id": id,
      "completion": completion,
      "processDescription": description,
      "materialFee": materialFee,
      "serviceFee": serviceFee,
      "payFee": payFee,
      "handlerImgList": urls,
    });
    if (baseModel.status ?? false) {
      BotToast.showText(text: '提交成功');
      return true;
    } else {
      BotToast.showText(text: baseModel.message ?? '提交失败');
      return false;
    }
  }
}
