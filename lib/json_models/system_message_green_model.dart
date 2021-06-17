import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'system_message_green_model.g.dart';

@JsonSerializable()
class SystemMessageGreenModel extends Equatable {
  final int id;
  final String name;
  final String tel;
  final String areaName;
  SystemMessageGreenModel({
    required this.id,
    required this.name,
    required this.tel,
    required this.areaName,
  });
  factory SystemMessageGreenModel.fromJson(Map<String, dynamic> json) =>
      _$SystemMessageGreenModelFromJson(json);
  @override
  List<Object> get props => [id, name, tel, areaName];

  factory SystemMessageGreenModel.fail() =>
      SystemMessageGreenModel(id: -1, name: '', tel: '', areaName: '');
}
