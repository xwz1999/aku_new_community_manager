import 'package:aku_new_community_manager/models/user/user_info_model.dart';
import 'package:aku_new_community_manager/tools/user_tool.dart';
import 'package:equatable/equatable.dart';

import 'package:aku_new_community_manager/models/common/img_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'house_keeping_list_model.g.dart';

@JsonSerializable()
class HouseKeepingListModel extends Equatable {
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
  HouseKeepingListModel({
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
  factory HouseKeepingListModel.fromJson(Map<String, dynamic> json) =>
      _$HouseKeepingListModelFromJson(json);

  String get statusString {
    switch (this.status) {
      case 1:
        return '待派单';
      case 2:
        if (UserTool.userProvider.infoModel!.houseKeepingAuthority ==
            HKAUTH.PICK) {
          return '已派单';
        } else {
          return '待接单';
        }
      case 3:
        return '处理中';
      case 4:
        return '待支付';
      case 5:
        return '待评价';
      case 6:
        return '已完成';
      case 9:
        return '已取消';
      case 10:
        return '已作废';
      default:
        return '未知';
    }
  }

  String get typeString {
    switch (this.type) {
      case 1:
        return '室内清洁';
      case 2:
        return '洗涤护理';
      default:
        return '未知';
    }
  }

  String get completionString {
    switch (this.completion) {
      case 1:
        return '未完成';
      case 2:
        return '已完成';
      default:
        return '未知';
    }
  }

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
