// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engineer_repair_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EngineerRepairDetailModel _$EngineerRepairDetailModelFromJson(
    Map<String, dynamic> json) {
  return EngineerRepairDetailModel(
    json['id'] as int,
    json['createName'] as String,
    json['createTel'] as String,
    json['repairArea'] as String,
    json['code'] as String,
    json['type'] as int,
    json['reportDetail'] as String,
    json['status'] as int,
    json['organizationId'] as int?,
    json['organizationName'] as String?,
    json['organizationLeadingName'] as String?,
    json['organizationLeadingTel'] as String?,
    json['maintenanceStaff'] as int?,
    json['maintenanceStaffOrganizationName'] as String?,
    json['maintenanceStaffName'] as String?,
    json['maintenanceStaffTel'] as String?,
    json['maintenanceStaffPickSingleDate'] as String?,
    json['maintenanceCompanySendSingle'] as int?,
    json['maintenanceCompanySendSingleDate'] as String?,
    json['maintenancePersonnelSendSingle'] as int?,
    json['maintenancePersonnelSendSingleDate'] as String?,
    (json['imgUrls'] as List<dynamic>)
        .map((e) => ImgModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['createId'] as int,
    json['createDate'] as String,
  );
}
