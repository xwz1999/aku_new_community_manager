import 'package:json_annotation/json_annotation.dart';

part 'engineer_repair_process_model.g.dart';

@JsonSerializable()
class EngineerRepairProcessModel {
  final int id;
  final int repairEngineeringId;
  final String operationDate;
  final int operationType;
  final int operator;
  final int operatorType;
  final String operatorContent;

  factory EngineerRepairProcessModel.fromJson(Map<String, dynamic> json) =>
      _$EngineerRepairProcessModelFromJson(json);

  EngineerRepairProcessModel(
      this.id,
      this.repairEngineeringId,
      this.operationDate,
      this.operationType,
      this.operator,
      this.operatorType,
      this.operatorContent);
}
