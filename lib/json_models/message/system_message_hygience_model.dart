import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'system_message_hygience_model.g.dart';
@JsonSerializable()
class SystemMessageHygineceModel extends Equatable {
  final int id;
  final String name;
  final String tel;
  final String areaName;
  SystemMessageHygineceModel({
    required this.id,
    required this.name,
    required this.tel,
    required this.areaName,
  });

  factory SystemMessageHygineceModel.fromJson(Map<String, dynamic> json) =>
      _$SystemMessageHygineceModelFromJson(json);

  @override
  List<Object> get props => [id, name, tel, areaName];
}
