// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_message_green_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemMessageGreenModel _$SystemMessageGreenModelFromJson(
    Map<String, dynamic> json) {
  return SystemMessageGreenModel(
    id: json['id'] as int,
    name: json['name'] as String,
    tel: json['tel'] as String,
    areaName: json['areaName'] as String,
  );
}

Map<String, dynamic> _$SystemMessageGreenModelToJson(
        SystemMessageGreenModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tel': instance.tel,
      'areaName': instance.areaName,
    };
