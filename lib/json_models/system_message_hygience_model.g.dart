// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_message_hygience_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemMessageHygineceModel _$SystemMessageHygineceModelFromJson(
    Map<String, dynamic> json) {
  return SystemMessageHygineceModel(
    id: json['id'] as int,
    name: json['name'] as String,
    tel: json['tel'] as String,
    areaName: json['areaName'] as String,
  );
}

Map<String, dynamic> _$SystemMessageHygineceModelToJson(
        SystemMessageHygineceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tel': instance.tel,
      'areaName': instance.areaName,
    };
