// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    UserInfoModel(
      id: json['id'] as int,
      userName: json['userName'] as String,
      type: json['type'] as int,
      actualName: json['actualName'] as String,
      tel: json['tel'] as String,
      sex: json['sex'] as int,
      userCode: json['userCode'] as String,
      birthDay: json['birthDay'] as String?,
      email: json['email'] as String?,
      status: json['status'] as int,
      lastLoginIp: json['lastLoginIp'] as int?,
      lastLoginDate: json['lastLoginDate'] as String?,
      nickName: json['nickName'] as String?,
      address: json['address'] as String?,
      entryDate: json['entryDate'] as String,
      remake: json['remake'] as String?,
      imgList: (json['imgList'] as List<dynamic>?)
          ?.map((e) => ImgModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      communityName: json['communityName'] as String,
      positionName: json['positionName'] as String,
      workOrderJurisdiction: json['workOrderJurisdiction'] as int?,
    );
