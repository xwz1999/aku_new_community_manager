// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engineer_repair_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EngineerRepairListModel _$EngineerRepairListModelFromJson(
        Map<String, dynamic> json) =>
    EngineerRepairListModel(
      id: json['id'] as int,
      code: json['code'] as String,
      type: json['type'] as int,
      reportDetail: json['reportDetail'] as String,
      status: json['status'] as int,
      imgUrls: (json['imgUrls'] as List<dynamic>)
          .map((e) => ImgModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createDate: json['createDate'] as String,
    );
