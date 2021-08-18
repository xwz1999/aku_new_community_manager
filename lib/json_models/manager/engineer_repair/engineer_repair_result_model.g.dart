// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engineer_repair_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EngineerRepairResultModel _$EngineerRepairResultModelFromJson(
    Map<String, dynamic> json) {
  return EngineerRepairResultModel(
    json['id'] as int,
    json['repairEngineeringId'] as int,
    json['content'] as String?,
    json['billMaterials'] as String?,
    (json['maintenanceImgLists'] as List<dynamic>)
        .map((e) => ImgModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['createName'] as String,
    json['createDate'] as String,
  );
}
