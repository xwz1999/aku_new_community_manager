import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'household_audit_list_model.g.dart';

@JsonSerializable()
class HouseholdAuditListModel extends Equatable {
  final int estateReviewId;
  final String name;
  final String tel;
  final int estateId;
  final String estateName;
  final String unitName;
  final String buildingName;
  final int identity;
  final String idCard;
  final int status;
  final String estateTypeName;

  factory HouseholdAuditListModel.fromJson(Map<String, dynamic> json) =>
      _$HouseholdAuditListModelFromJson(json);

  String get houseName => buildingName + '栋' + unitName + '单元' + estateName;

  const HouseholdAuditListModel({
    required this.estateReviewId,
    required this.name,
    required this.tel,
    required this.estateId,
    required this.estateName,
    required this.unitName,
    required this.buildingName,
    required this.identity,
    required this.idCard,
    required this.status,
    required this.estateTypeName,
  });

  @override
  List<Object?> get props => [
        estateReviewId,
        name,
        tel,
        estateId,
        estateName,
        unitName,
        buildingName,
        identity,
        idCard,
        status,
        estateTypeName,
      ];
}
