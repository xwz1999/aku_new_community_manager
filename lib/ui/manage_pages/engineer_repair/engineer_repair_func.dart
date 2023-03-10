import 'dart:io';

import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/json_models/manager/engineer_repair/engineer_repair_detail_model.dart';
import 'package:aku_new_community_manager/json_models/manager/engineer_repair/engineer_repair_new_acceptance_record_model.dart';
import 'package:aku_new_community_manager/json_models/manager/engineer_repair/engineer_repair_organization_model.dart';
import 'package:aku_new_community_manager/json_models/manager/engineer_repair/engineer_repair_person_model.dart';
import 'package:aku_new_community_manager/json_models/manager/engineer_repair/engineer_repair_process_model.dart';
import 'package:aku_new_community_manager/json_models/manager/engineer_repair/engineer_repair_result_model.dart';
import 'package:aku_new_community_manager/json_models/manager/engineer_repair/engineer_repair_work_report_model.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';

class EngineerRepairFunc {
  static Future addEngineerRepair(
      String area, int type, String reportDetail, List<String> urls) async {
    var model =
        await NetUtil().post(API.engineerRepair.engineerRepairInsert, params: {
      'repairArea': area,
      'type': type,
      'reportDetail': reportDetail,
      'fileUrls': urls,
    });
    return model.success;
  }

  static Future<EngineerRepairDetailModel?> getEngineerRepairDetail(
      int repairEngineeringId) async {
    var model = await NetUtil().get(API.engineerRepair.detail,
        params: {'repairEngineeringId': repairEngineeringId});

    if (model.success) {
      return EngineerRepairDetailModel.fromJson(model.data);
    } else {
      return null;
    }
  }

  static Future<List<EngineerRepairProcessModel>> getProcess(
      int repairEngineeringId) async {
    var model = await NetUtil().get(API.engineerRepair.process,
        params: {'repairEngineeringId': repairEngineeringId});

    if (model.success) {
      return (model.data as List)
          .map((e) => EngineerRepairProcessModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  static Future<List<EngineerRepairWorkReportModel>> getWorkReport(
      int repairEngineeringId) async {
    var model = await NetUtil().get(API.engineerRepair.workReport,
        params: {'repairEngineeringId': repairEngineeringId});

    if (model.success) {
      return (model.data as List)
          .map((e) => EngineerRepairWorkReportModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  static Future<List<EngineerRepairOrganizationModel>> getOrganization() async {
    var model = await NetUtil().get(
      API.engineerRepair.organization,
    );

    if (model.success) {
      return (model.data as List)
          .map((e) => EngineerRepairOrganizationModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  static Future<List<EngineerRepairPersonModel>> getPersons(
      int organizationId) async {
    var model = await NetUtil().get(API.engineerRepair.persons,
        params: {'repairOrganizationId': organizationId});

    if (model.success) {
      return (model.data as List)
          .map((e) => EngineerRepairPersonModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  static Future companySend(int repairId, int organizationId) async {
    var model = await NetUtil().post(API.engineerRepair.companySend,
        params: {'id': repairId, 'organizationId': organizationId});
    return model.success;
  }

  static Future<bool> personSend(int repairId, int maintenanceStaffId) async {
    var model = await NetUtil().post(API.engineerRepair.personSend,
        params: {'id': repairId, 'maintenanceStaff': maintenanceStaffId});
    return model.success;
  }

  static Future<bool> personPick(int repairId) async {
    var model = await NetUtil().post(API.engineerRepair.personPick, params: {
      'id': repairId,
    });
    return model.success;
  }

  static Future uploadReportImages(List<File> files) async {
    var model = await NetUtil()
        .uploadFiles(files, API.upload.uploadEngineerRepairReport);
    return model;
  }

  static Future submitReport(
      int repairId, String detail, List<String> urls) async {
    var model = await NetUtil().post(API.engineerRepair.submitReport, params: {
      'repairEngineeringId': repairId,
      'content': detail,
      'workReportImgUrls': urls,
    });
    return model.success;
  }

  static Future complete(
    int repairId,
    String detail,
    String material,
    List<String> urls,
  ) async {
    var model = await NetUtil().post(API.engineerRepair.complete, params: {
      'repairEngineeringId': repairId,
      'content': detail,
      'billMaterials': material,
      'maintenanceImgUrls': urls,
    });
    return model.success;
  }

  static Future uploadCompleteImages(List<File> files) async {
    var model =
        await NetUtil().uploadFiles(files, API.upload.engineerRepairComplete);
    return model;
  }

  static Future getRepairResult(int repairId) async {
    var model = await NetUtil().get(API.engineerRepair.repairResult, params: {
      'repairEngineeringId': repairId,
    });
    if (model.success) {
      return EngineerRepairResultModel.fromJson(model.data);
    } else {
      return null;
    }
  }

  static Future submitAcceptance(int id, int repairId, int result,
      String advice, List<String> urls) async {
    var model =
        await NetUtil().post(API.engineerRepair.submitAcceptance, params: {
      'id': id,
      'repairEngineeringId': repairId,
      'results': result,
      'advice': advice,
      'acceptanceImgUrls': urls,
    });
    return model.success;
  }

  static Future uploadAcceptanceImages(List<File> files) async {
    var model =
        await NetUtil().uploadFiles(files, API.upload.engineerRepairAcceptance);
    return model;
  }

  static Future getAcceptanceRecord(int repairId) async {
    var model =
        await NetUtil().get(API.engineerRepair.acceptanceRecordNew, params: {
      'repairEngineeringId': repairId,
    });
    if (model.success) {
      return EngineerRepairNewAcceptanceRecordModel.fromJson(model.data);
    } else {
      return null;
    }
  }

  static Future<List<EngineerRepairNewAcceptanceRecordModel>>
      getAcceptanceRecordList(int repairId) async {
    var model =
        await NetUtil().get(API.engineerRepair.acceptanceRecordList, params: {
      'repairEngineeringId': repairId,
    });
    if (model.success) {
      return (model.data as List)
          .map((e) => EngineerRepairNewAcceptanceRecordModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  static Future startRectification(int repairId) async {
    var model =
        await NetUtil().post(API.engineerRepair.startRectification, params: {
      'id': repairId,
    });
    return model.success;
  }
}
