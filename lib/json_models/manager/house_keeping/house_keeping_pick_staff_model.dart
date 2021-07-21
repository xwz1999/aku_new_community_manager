import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'house_keeping_pick_staff_model.g.dart';

@JsonSerializable()
class HouseKeepingPickStaffModel extends Equatable {
  final int id;
  final String? userName;
  final String? pwd;
  final String actualName;
  final String tel;
  final int? sex;
  final String? userCode;
  final String? birthday;
  final String? email;
  final String? idCard;
  final int? organizationId;
  final String? organizationIdPath;
  final int? positionId;
  final int? roleId;
  final int? status;
  final int? isDelete;
  final int? createId;
  final String? createDate;
  final int? modifyId;
  final String? modifyDate;
  final String? lastLoginIp;
  final String? lastLoginDate;
  final String? nickName;
  final String? code;
  final String? codeSendDate;
  final String? remake;
  final String? reportTo;
  final String? entryDate;
  HouseKeepingPickStaffModel({
    required this.id,
    this.userName,
    this.pwd,
    required this.actualName,
    required this.tel,
    this.sex,
    this.userCode,
    this.birthday,
    this.email,
    this.idCard,
    this.organizationId,
    this.organizationIdPath,
    this.positionId,
    this.roleId,
    this.status,
    this.isDelete,
    this.createId,
    this.createDate,
    this.modifyId,
    this.modifyDate,
    this.lastLoginIp,
    this.lastLoginDate,
    this.nickName,
    this.code,
    this.codeSendDate,
    this.remake,
    this.reportTo,
    this.entryDate,
  });
  factory HouseKeepingPickStaffModel.fromJson(Map<String, dynamic> json) =>
      _$HouseKeepingPickStaffModelFromJson(json);
  @override
  List<Object?> get props {
    return [
      id,
      userName,
      pwd,
      actualName,
      tel,
      sex,
      userCode,
      birthday,
      email,
      idCard,
      organizationId,
      organizationIdPath,
      positionId,
      roleId,
      status,
      isDelete,
      createId,
      createDate,
      modifyId,
      modifyDate,
      lastLoginIp,
      lastLoginDate,
      nickName,
      code,
      codeSendDate,
      remake,
      reportTo,
      entryDate,
    ];
  }
}
