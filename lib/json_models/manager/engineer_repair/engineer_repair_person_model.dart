import 'package:json_annotation/json_annotation.dart';

part 'engineer_repair_person_model.g.dart';

@JsonSerializable()
class EngineerRepairPersonModel {
  final int id;
  final String userName;
  final String pwd;
  final String actualName;
  final String tel;
  final int sex;
  final String userCode;
  final String birthday;
  final String email;
  final String idCard;
  final int organizationId;
  final String organizationPath;
  final int positionId;
  final int roleId;
  final int status;
  final int isDelete;
  final int createId;
  final String createDate;
  final int modifyId;
  final String modifyDate;
  final int lastLoginIp;
  final String lastLoginDate;
  final String nickName;
  final String code;
  final String codeSendDate;
  final String remake;
  final int reportTo;
  final String entryDate;
  factory EngineerRepairPersonModel.fromJson(Map<String, dynamic> json) =>
      _$EngineerRepairPersonModelFromJson(json);
  EngineerRepairPersonModel(
      this.id,
      this.userName,
      this.pwd,
      this.actualName,
      this.tel,
      this.sex,
      this.userCode,
      this.birthday,
      this.email,
      this.idCard,
      this.organizationId,
      this.organizationPath,
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
      this.entryDate);
}
