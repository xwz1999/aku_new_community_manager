import 'package:aku_new_community_manager/models/common/img_model.dart';
import 'package:common_utils/common_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel extends Equatable {
  final int id;
  final String userName;
  final int type;
  final String actualName;
  final String tel;
  final int sex;
  final String userCode;
  final String? birthDay;
  final String? email;
  final int status;
  final int? lastLoginIp;
  final String? lastLoginDate;
  final String? nickName;
  final String? address;
  final String? entryDate;
  final String? remake;
  final List<ImgModel>? imgList;
  final int communityCode;
  final String communityName;
  final String? positionName;
  final int? workOrderJurisdiction;

  String get sexValue {
    if (sex == 1) return '男';
    if (sex == 2) return '女';
    if (sex == 3) return '保密';
    return '未设置';
  }

  DateTime? get birthdayDate => DateUtil.getDateTime(birthDay ?? '');

  String get birthdayValue {
    if (TextUtil.isEmpty(birthDay))
      return '未设置';
    else
      return DateUtil.formatDate(birthdayDate, format: 'yyyy-MM-dd');
  }

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  @override
  List<Object?> get props => [
        id,
        userName,
        type,
        actualName,
        tel,
        sex,
        userCode,
        birthDay,
        email,
        status,
        lastLoginIp,
        lastLoginDate,
        nickName,
        address,
        entryDate,
        remake,
        imgList,
        communityName,
        positionName,
        workOrderJurisdiction
      ];

  const UserInfoModel({
    required this.id,
    required this.userName,
    required this.type,
    required this.actualName,
    required this.tel,
    required this.sex,
    required this.userCode,
    this.birthDay,
    this.email,
    required this.status,
    this.lastLoginIp,
    this.lastLoginDate,
    this.nickName,
    this.address,
    this.entryDate,
    this.remake,
    this.imgList,
    required this.communityCode,
    required this.communityName,
    this.positionName,
    this.workOrderJurisdiction,
  });
}
