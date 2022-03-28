// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_message_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeMessageListModel _$HomeMessageListModelFromJson(
        Map<String, dynamic> json) =>
    HomeMessageListModel(
      id: json['id'] as int,
      type: json['type'] as int,
      status: json['status'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      sendDate: json['sendDate'] as String,
      jumpId: json['jumpId'] as int,
    );
