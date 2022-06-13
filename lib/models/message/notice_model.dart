import 'package:common_utils/common_utils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'notice_model.g.dart';


@JsonSerializable()
class NoticeModel extends Equatable {
  final int id;
  final int type;
  final int status;
  final String title;
  final String content;
  final String sendDate;
  final int jumpId;

  DateTime? get sendDateDT => DateUtil.getDateTime(sendDate);

  int? get month => sendDateDT?.month;

  int? get year => sendDateDT?.year;

  factory NoticeModel.fromJson(Map<String, dynamic> json) =>
      _$NoticeModelFromJson(json);

  const NoticeModel({
    required this.id,
    required this.type,
    required this.status,
    required this.title,
    required this.content,
    required this.sendDate,
    required this.jumpId,
  });

  @override
  List<Object?> get props =>
      [id, type, status, title, content, sendDate, jumpId];

  NoticeModel copyWith({
    int? id,
    int? type,
    int? status,
    String? title,
    String? content,
    String? sendDate,
    int? jumpId,
  }) {
    return NoticeModel(
      id: id ?? this.id,
      type: type ?? this.type,
      content: content ?? this.content,
      sendDate: sendDate ?? this.sendDate,
      status: status ?? this.status,
      title: title ?? this.title,
      jumpId: jumpId ?? this.jumpId,

    );
  }
}