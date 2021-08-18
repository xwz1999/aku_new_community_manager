import 'package:aku_community_manager/models/common/img_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'engineer_repair_work_report_model.g.dart';

@JsonSerializable()
class EngineerRepairWorkReportModel {
  final int id;
  final int repairEngineeringId;
  final String content;
  final int createId;
  final String createName;
  final String createDate;
  final List<ImgModel>? workReportImgLists;

  factory EngineerRepairWorkReportModel.fromJson(Map<String, dynamic> json) =>
      _$EngineerRepairWorkReportModelFromJson(json);

  EngineerRepairWorkReportModel(this.id, this.repairEngineeringId, this.content,
      this.createId, this.createName, this.createDate, this.workReportImgLists);
}
