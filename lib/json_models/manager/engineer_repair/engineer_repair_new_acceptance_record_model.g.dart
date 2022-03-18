// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engineer_repair_new_acceptance_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EngineerRepairNewAcceptanceRecordModel
    _$EngineerRepairNewAcceptanceRecordModelFromJson(
            Map<String, dynamic> json) =>
        EngineerRepairNewAcceptanceRecordModel(
          json['id'] as int,
          json['repairEngineeringId'] as int,
          json['content'] as String?,
          json['billMaterials'] as String?,
          (json['maintenanceImgLists'] as List<dynamic>?)
              ?.map((e) => ImgModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          json['createName'] as String,
          json['createDate'] as String,
          json['results'] as int,
          json['advice'] as String,
          json['acceptancePeople'] as int,
          json['acceptancePeopleName'] as String,
          json['acceptanceDate'] as String,
          (json['acceptanceImgLists'] as List<dynamic>?)
              ?.map((e) => ImgModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        );
