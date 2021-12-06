import 'package:aku_new_community_manager/models/common/img_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'engineer_repair_list_model.g.dart';

@JsonSerializable()
class EngineerRepairListModel {
  final int id;
  final String code;
  final int type;
  final String reportDetail;
  final int status;
  final List<ImgModel> imgUrls;
  final String createDate;
  EngineerRepairListModel({
    required this.id,
    required this.code,
    required this.type,
    required this.reportDetail,
    required this.status,
    required this.imgUrls,
    required this.createDate,
  });
  factory EngineerRepairListModel.fromJson(Map<String, dynamic> json) =>
      _$EngineerRepairListModelFromJson(json);
}
