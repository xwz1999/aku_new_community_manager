import 'package:common_utils/common_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'key_manage_record_list_model.g.dart';

@JsonSerializable()
class KeyManageRecordListModel {
  int id;
  String code;
  int status;
  String? facilityName;
  String? correspondingPosition;
  String? storageLocation;
  String? auditDate;
  String? reason;
  factory KeyManageRecordListModel.fromJson(Map<String, dynamic> json) =>
      _$KeyManageRecordListModelFromJson(json);
  String get auditDateString =>
      DateUtil.formatDateStr(auditDate ?? '', format: 'yyyy-MM-dd HH:mm');

  KeyManageRecordListModel({
    required this.id,
    required this.code,
    required this.status,
    this.facilityName,
    this.correspondingPosition,
    this.storageLocation,
    this.auditDate,
    this.reason,
  });
}
