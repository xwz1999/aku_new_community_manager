import 'package:aku_new_community_manager/const/saas_api.dart';
import 'package:aku_new_community_manager/saas_models/net_model/base_model.dart';
import 'package:aku_new_community_manager/saas_models/work_order/work_order_submit_model.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';

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
  static Future<bool> confirmComplete(WorkOrderSubmitModel model) async {
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
}
