import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_todo_list_model.g.dart';

@JsonSerializable()
class HomeTodoListModel extends Equatable {
  final int id;
  final int type;
  final String code;
  final int status;
  final String pendingDate;

  factory HomeTodoListModel.fromJson(Map<String, dynamic> json) =>
      _$HomeTodoListModelFromJson(json);

  const HomeTodoListModel({
    required this.id,
    required this.type,
    required this.code,
    required this.status,
    required this.pendingDate,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        code,
        status,
        pendingDate,
      ];
}
