import 'package:aku_new_community_manager/models/common/img_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'work_order_detail_model.g.dart';

@JsonSerializable()
class WorkOrderDetailModel extends Equatable {
  final int id;
  final String code;
  final int status;
  final String workOrderTypeName;
  final String reserveAddress;
  final String reserveDate;
  final int identity;
  final int applicantId;
  final String applicantName;
  final String applicantTel;
  final List<ImgModel>? applicantImgList;
  final String buildingName;
  final String unitName;
  final String estateName;
  final String content;
  final String createDate;
  final List<ImgModel>? imgList;
  final List<ImgModel>? servicePersonnelImgList;
  final int newReportNum;
  final int? evaluateLevel;
  final String? evaluateContent;
  final String? evaluateDate;
  final double totalCost;

  factory WorkOrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderDetailModelFromJson(json);

  @override
  List<Object?> get props => [
        code,
        status,
        workOrderTypeName,
        reserveAddress,
        reserveDate,
        identity,
        applicantId,
        applicantName,
        applicantTel,
        buildingName,
        unitName,
        estateName,
        content,
        createDate,
        imgList,
        servicePersonnelImgList,
        newReportNum,
        evaluateLevel,
        evaluateContent,
        evaluateDate,
        totalCost,
        applicantImgList,
      ];

  const WorkOrderDetailModel({
    required this.id,
    required this.code,
    required this.status,
    required this.workOrderTypeName,
    required this.reserveAddress,
    required this.reserveDate,
    required this.identity,
    required this.applicantId,
    required this.applicantName,
    required this.applicantTel,
    this.applicantImgList,
    required this.buildingName,
    required this.unitName,
    required this.estateName,
    required this.content,
    required this.createDate,
    this.imgList,
    this.servicePersonnelImgList,
    required this.newReportNum,
    this.evaluateLevel,
    this.evaluateContent,
    this.evaluateDate,
    required this.totalCost,
  });
}
