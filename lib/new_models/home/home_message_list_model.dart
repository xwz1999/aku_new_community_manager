import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_message_list_model.g.dart';

@JsonSerializable()
class HomeMessageListModel extends Equatable {
  final int id;
  final int type;
  final int status;
  final String title;
  final String content;
  final String sendDate;
  final int jumpId;

  factory HomeMessageListModel.fromJson(Map<String, dynamic> json) =>
      _$HomeMessageListModelFromJson(json);

  const HomeMessageListModel({
    required this.id,
    required this.type,
    required this.status,
    required this.title,
    required this.content,
    required this.sendDate,
    required this.jumpId,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        status,
        title,
        content,
        sendDate,
        jumpId,
      ];
}
