import 'package:aku_community_manager/models/common/img_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'engineer_repair_result_model.g.dart';

@JsonSerializable()
class EngineerRepairResultModel {
  final int id;
  final int repairEngineeringId;
  final String content;
  final String billMaterials;
  final List<ImgModel> maintenanceImgLists;
  final String createName;
  final String createDate;

  factory EngineerRepairResultModel.fromJson(Map<String, dynamic> json) =>
      _$EngineerRepairResultModelFromJson(json);

  EngineerRepairResultModel(
      this.id,
      this.repairEngineeringId,
      this.content,
      this.billMaterials,
      this.maintenanceImgLists,
      this.createName,
      this.createDate);
}
