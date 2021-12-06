import 'package:aku_new_community_manager/models/common/img_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'engineer_repair_detail_model.g.dart';

@JsonSerializable()
class EngineerRepairDetailModel {
  final int id;
  final String createName;
  final String createTel;
  final String repairArea;
  final String code;
  final int type;
  final String reportDetail;
  final int status;
  final int? organizationId;
  final String? organizationName;
  final String? organizationLeadingName;
  final String? organizationLeadingTel;
  final int? maintenanceStaff;
  final String? maintenanceStaffOrganizationName;
  final String? maintenanceStaffName;
  final String? maintenanceStaffTel;
  final String? maintenanceStaffPickSingleDate;
  final int? maintenanceCompanySendSingle;
  final String? maintenanceCompanySendSingleDate;
  final int? maintenancePersonnelSendSingle;
  final String? maintenancePersonnelSendSingleDate;
  final List<ImgModel> imgUrls;
  final int createId;
  final String createDate;

  factory EngineerRepairDetailModel.fromJson(Map<String, dynamic> json) =>
      _$EngineerRepairDetailModelFromJson(json);

  EngineerRepairDetailModel(
      this.id,
      this.createName,
      this.createTel,
      this.repairArea,
      this.code,
      this.type,
      this.reportDetail,
      this.status,
      this.organizationId,
      this.organizationName,
      this.organizationLeadingName,
      this.organizationLeadingTel,
      this.maintenanceStaff,
      this.maintenanceStaffOrganizationName,
      this.maintenanceStaffName,
      this.maintenanceStaffTel,
      this.maintenanceStaffPickSingleDate,
      this.maintenanceCompanySendSingle,
      this.maintenanceCompanySendSingleDate,
      this.maintenancePersonnelSendSingle,
      this.maintenancePersonnelSendSingleDate,
      this.imgUrls,
      this.createId,
      this.createDate);
}
