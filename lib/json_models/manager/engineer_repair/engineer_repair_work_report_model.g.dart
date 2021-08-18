// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engineer_repair_work_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EngineerRepairWorkReportModel _$EngineerRepairWorkReportModelFromJson(
    Map<String, dynamic> json) {
  return EngineerRepairWorkReportModel(
    json['id'] as int,
    json['repairEngineeringId'] as int,
    json['content'] as String,
    json['createId'] as int,
    json['createName'] as String,
    json['createDate'] as String,
    (json['workReportImgLists'] as List<dynamic>?)
        ?.map((e) => ImgModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}
