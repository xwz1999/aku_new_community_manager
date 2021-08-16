import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/json_models/manager/engineer_repair/engineer_repair_detail_model.dart';
import 'package:aku_community_manager/json_models/manager/engineer_repair/engineer_repair_organization_model.dart';
import 'package:aku_community_manager/json_models/manager/engineer_repair/engineer_repair_person_model.dart';
import 'package:aku_community_manager/json_models/manager/engineer_repair/engineer_repair_process_model.dart';
import 'package:aku_community_manager/json_models/manager/engineer_repair/engineer_repair_work_report_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';

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
    return model.status ?? false;
  }

  static Future<EngineerRepairDetailModel?> getEngineerRepairDetail(
      int repairEngineeringId) async {
    var model = await NetUtil().get(API.engineerRepair.detail,
        params: {'repairEngineeringId': repairEngineeringId});

    if (model.status ?? false) {
      return EngineerRepairDetailModel.fromJson(model.data);
    } else {
      return null;
    }
  }

  static Future<List<EngineerRepairProcessModel>> getProcess(
      int repairEngineeringId) async {
    var model = await NetUtil().get(API.engineerRepair.process,
        params: {'repairEngineeringId': repairEngineeringId});

    if (model.status ?? false) {
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

    if (model.status ?? false) {
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

    if (model.status ?? false) {
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

    if (model.status ?? false) {
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
    return model.status ?? false;
  }

  static Future<bool> personSend(int repairId, int maintenanceStaffId) async {
    var model = await NetUtil().post(API.engineerRepair.personSend,
        params: {'id': repairId, 'maintenanceStaff': maintenanceStaffId});
    return model.status ?? false;
  }

  static Future<bool> personPick(int repairId) async {
    var model = await NetUtil().post(API.engineerRepair.personPick, params: {
      'id': repairId,
    });
    return model.status ?? false;
  }
}
