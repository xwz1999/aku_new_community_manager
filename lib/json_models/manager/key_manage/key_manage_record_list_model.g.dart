// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_manage_record_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KeyManageRecordListModel _$KeyManageRecordListModelFromJson(
    Map<String, dynamic> json) {
  return KeyManageRecordListModel(
    id: json['id'] as int,
    code: json['code'] as String,
    status: json['status'] as int,
    facilityName: json['facilityName'] as String?,
    correspondingPosition: json['correspondingPosition'] as String?,
    storageLocation: json['storageLocation'] as String?,
    auditDate: json['auditDate'] as String?,
    reason: json['reason'] as String?,
  );
}
