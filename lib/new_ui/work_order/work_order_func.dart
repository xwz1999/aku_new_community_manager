import 'package:aku_new_community_manager/const/saas_api.dart';
import 'package:aku_new_community_manager/saas_models/net_model/base_model.dart';
import 'package:aku_new_community_manager/saas_models/work_order/work_order_bill_model.dart';
import 'package:aku_new_community_manager/saas_models/work_order/work_order_progress_model.dart';
import 'package:aku_new_community_manager/saas_models/work_order/work_order_submit_model.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'dialog/work_order_bill_dialog.dart';
import 'dialog/work_order_progress_dialog.dart';

class WorkOrderFuc {
  ///提醒用户确认
  static Future<bool> reminderConfirm(int id) async {
    BaseModel baseModel = await NetUtil().get(SAASAPI.workOrder.reminderConfirm,
        params: {'workOrderId': id}, showMessage: true);
    return baseModel.success;
  }

  ///提醒完成
  static Future<bool> reminderDone(int id) async {
    BaseModel baseModel = await NetUtil().get(SAASAPI.workOrder.reminderDone,
        params: {'workOrderId': id}, showMessage: true);
    return baseModel.success;
  }

  ///提醒处理
  static Future<bool> reminderProcessing(int id) async {
    BaseModel baseModel = await NetUtil().get(
        SAASAPI.workOrder.reminderProcessing,
        params: {'workOrderId': id},
        showMessage: true);
    return baseModel.success;
  }

  ///提醒处理
  static Future<bool> reminderPay(int id) async {
    BaseModel baseModel = await NetUtil().get(SAASAPI.workOrder.reminderPay,
        params: {'workOrderId': id}, showMessage: true);
    return baseModel.success;
  }

  ///开始服务
  static Future<bool> startService(int id) async {
    BaseModel baseModel = await NetUtil().get(SAASAPI.workOrder.startService,
        params: {'workOrderId': id}, showMessage: true);
    return baseModel.success;
  }

  ///加入工单池
  static Future<bool> joinOrderPool(int id) async {
    BaseModel baseModel = await NetUtil().get(SAASAPI.workOrder.joinTicketPool,
        params: {'workOrderId': id}, showMessage: true);
    return baseModel.success;
  }

  ///移至待分配
  static Future<bool> moveToAssignment(int id) async {
    BaseModel baseModel = await NetUtil().get(
        SAASAPI.workOrder.moveToAssignment,
        params: {'workOrderId': id},
        showMessage: true);
    return baseModel.success;
  }

  ///领取任务
  static Future<bool> receiveTask(int id) async {
    BaseModel baseModel = await NetUtil().get(SAASAPI.workOrder.receiveTask,
        params: {'workOrderId': id}, showMessage: true);
    return baseModel.success;
  }

  ///完成工单
  static Future<bool> finish(WorkOrderSubmitModel model) async {
    BaseModel baseModel = await NetUtil().get(SAASAPI.workOrder.finish,
        params: model.toJson(), showMessage: true);
    return baseModel.success;
  }

  ///取消
  static Future<bool> cancel({
    required int workOrderId,
  }) async {
    var base = await NetUtil().get(SAASAPI.workOrder.cancel,
        params: {
          'workOrderId': workOrderId,
        },
        showMessage: true);
    return base.success;
  }

  ///发布工单
  static Future<bool> publish({
    required int estateId,
    required int workOrderTypeId,
    required String reserveDate,
    required String reserveAddress,
    required String content,
    required List<String> imgUrls,
  }) async {
    var base = await NetUtil().post(SAASAPI.workOrder.insert,
        params: {
          'estateId': estateId,
          'workOrderTypeId': workOrderTypeId,
          'reserveDate': reserveDate,
          'reserveAddress': reserveAddress,
          'content': content,
          'imgUrls': imgUrls,
        },
        showMessage: true);

    return base.success;
  }

  ///汇报进度
  static Future<bool> reportProgress({
    required int workOrderId,
    required String content,
    required List<String> imgUrls,
  }) async {
    var base = await NetUtil().post(SAASAPI.workOrder.insert,
        params: {
          'workOrderId': workOrderId,
          'content': content,
          'imgUrls': imgUrls,
        },
        showMessage: true);

    return base.success;
  }

  ///查询工单进度
  static Future getProgress({
    required int workOrderId,
  }) async {
    var base = await NetUtil().get(SAASAPI.workOrder.findScheduleById,
        params: {'workOrderId': workOrderId});
    if (base.success) {
      var models = (base.data as List)
          .map((e) => WorkOrderProgressModel.fromJson(e))
          .toList();
      await Get.bottomSheet(WorkOrderProgressDialog(models: models),
          isScrollControlled: true);
    } else {
      BotToast.showText(text: base.msg);
    }
  }

  ///查询账单
  static Future getBill({
    required int workOrderId,
    required VoidCallback onConfirm,
  }) async {
    var base = await NetUtil()
        .get(SAASAPI.workOrder.orderBill, params: {'workOrderId': workOrderId});
    if (base.success) {
      var models = (base.data as List)
          .map((e) => WorkOrderBillModel.fromJson(e))
          .toList();
      await Get.bottomSheet(WorkOrderBillDialog(
        models: models,
        onConfirm: onConfirm,
      ));
    } else {
      BotToast.showText(text: base.msg);
    }
  }
}
