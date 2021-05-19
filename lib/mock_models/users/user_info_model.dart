// Dart imports:
import 'dart:io';

@Deprecated('use ‘canOpertion/canSendTicket/canPickUpTicke/canPass’ instead')
enum USER_ROLE {
  ///管家角色
  MANAGER,

  ///师傅角色
  FIXER,

  ///保安角色
  SECURITY,

  ///物业角色
  PROPERTY,

  ///无角色
  EMPTY,
}

@Deprecated('use infoModel instead')
class UserInfoModel {
  String nickName;
  File avatar;
  USER_ROLE role;
  String phone;
  String get securePhone {
    if (phone.length < 8)
      return phone;
    else
      return '${phone.substring(0, 3)}****${phone.substring(7)}';
  }

  UserInfoModel({
    this.nickName,
    this.avatar,
    this.role,
    this.phone,
  });

  UserInfoModel.empty({
    this.nickName = '',
    this.avatar,
    this.role = USER_ROLE.MANAGER,
    this.phone = '',
  });

  ///管家角色生成
  ///password 000000
  UserInfoModel.manager({
    this.nickName = '李管家',
    this.avatar,
    this.role = USER_ROLE.MANAGER,
    this.phone = '18819289976',
  });

  ///师傅角色生成
  ///password 000001
  UserInfoModel.fixer({
    this.nickName = '王师傅',
    this.avatar,
    this.role = USER_ROLE.FIXER,
    this.phone = '18927139123',
  });

  ///师傅角色生成
  ///password 000002
  UserInfoModel.security({
    this.nickName = '林保安',
    this.avatar,
    this.role = USER_ROLE.SECURITY,
    this.phone = '13918237877',
  });

  ///师傅角色生成
  ///password 000003
  UserInfoModel.property({
    this.nickName = '刘物业',
    this.avatar,
    this.role = USER_ROLE.PROPERTY,
    this.phone = '18965438676',
  });
}
