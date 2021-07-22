import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:aku_community_manager/models/common/img_model.dart';

part 'system_message_house_keeping_model.g.dart';

@JsonSerializable()
class SystemMessageHouseKeepingModel extends Equatable {
  final int id;
  final String proposerName;
  final String proposerTel;
  final String roomName;
  final int type;
  final String content;
  final int status;
  final int? completion;
  final String? handlerName;
  final String? handlerTel;
  final String? processDescription;
  final String? handlingTime;
  final List<ImgModel> handlerImgList;
  final num? payFee;
  final int? evaluation;
  final String? evaluationContent;
  final String? evaluationTime;
  final List<ImgModel> evaluationImgList;
  final String createDate;
  final List<ImgModel> submitImgList;
  SystemMessageHouseKeepingModel({
    required this.id,
    required this.proposerName,
    required this.proposerTel,
    required this.roomName,
    required this.type,
    required this.content,
    required this.status,
    this.completion,
    this.handlerName,
    this.handlerTel,
    this.processDescription,
    this.handlingTime,
    required this.handlerImgList,
    this.payFee,
    this.evaluation,
    this.evaluationContent,
    this.evaluationTime,
    required this.evaluationImgList,
    required this.createDate,
    required this.submitImgList,
  });
  factory SystemMessageHouseKeepingModel.fromJson(Map<String, dynamic> json) =>
      _$SystemMessageHouseKeepingModelFromJson(json);
  @override
  List<Object?> get props {
    return [
      id,
      proposerName,
      proposerTel,
      roomName,
      type,
      content,
      status,
      completion,
      handlerName,
      handlerTel,
      processDescription,
      handlingTime,
      handlerImgList,
      payFee,
      evaluation,
      evaluationContent,
      evaluationTime,
      evaluationImgList,
      createDate,
      submitImgList,
    ];
  }
}
