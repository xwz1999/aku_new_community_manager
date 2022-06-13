// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeModel _$NoticeModelFromJson(Map<String, dynamic> json) => NoticeModel(
    id: json['id'] as int,
    type: json['type'] as int,
    status: json['status'] as int,
    title: json['title'] as String,
    content: json['content'] as String,
    sendDate: json['sendDate'] as String,
    jumpId: json['jumpId'] as int,
);