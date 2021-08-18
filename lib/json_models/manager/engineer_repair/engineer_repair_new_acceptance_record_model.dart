import 'package:aku_community_manager/models/common/img_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'engineer_repair_new_acceptance_record_model.g.dart';

@JsonSerializable()
class EngineerRepairNewAcceptanceRecordModel {
  final int id;
  final int repairEngineeringId;
  final String? content;
  final String? billMaterials;
  final List<ImgModel>? maintenanceImgLists;
  final String createName;
  final String createDate;
  final int results;
  final String advice;
  final int acceptancePeople;
  final String acceptancePeopleName;
  final String acceptanceDate;
  final List<ImgModel>? acceptanceImgLists;
  factory EngineerRepairNewAcceptanceRecordModel.fromJson(
          Map<String, dynamic> json) =>
      _$EngineerRepairNewAcceptanceRecordModelFromJson(json);
  EngineerRepairNewAcceptanceRecordModel(
      this.id,
      this.repairEngineeringId,
      this.content,
      this.billMaterials,
      this.maintenanceImgLists,
      this.createName,
      this.createDate,
      this.results,
      this.advice,
      this.acceptancePeople,
      this.acceptancePeopleName,
      this.acceptanceDate,
      this.acceptanceImgLists);
}
