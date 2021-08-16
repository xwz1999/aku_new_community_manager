import 'package:json_annotation/json_annotation.dart';

part 'engineer_repair_organization_model.g.dart';

@JsonSerializable()
class EngineerRepairOrganizationModel {
  final int id;
  final String name;
  final String? code;
  final int parentId;
  final int? leadingId;
  final int status;
  final int sort;
  final String? remake;
  final int categoryId;
  final int createId;
  final String createDate;
  final int? modifyId;
  final String? modifyDate;
  factory EngineerRepairOrganizationModel.fromJson(Map<String, dynamic> json) =>
      _$EngineerRepairOrganizationModelFromJson(json);

  EngineerRepairOrganizationModel(
      this.id,
      this.name,
      this.code,
      this.parentId,
      this.leadingId,
      this.status,
      this.sort,
      this.remake,
      this.categoryId,
      this.createId,
      this.createDate,
      this.modifyId,
      this.modifyDate);
}
