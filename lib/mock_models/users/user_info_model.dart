import 'dart:io';

enum USER_ROLE {
  ///管家角色
  MANAGER,

  ///修理师傅角色
  FIXER,

  ///保安角色
  SECURITY,

  ///无角色
  EMPTY,
}

class UserInfoModel {
  String nickName;
  File avatar;
  USER_ROLE role;
  UserInfoModel({
    this.nickName,
    this.avatar,
    this.role,
  });

  UserInfoModel.empty({
    this.nickName = '',
    this.avatar,
    this.role = USER_ROLE.EMPTY,
  });

  ///管家角色生成
  ///password 000000
  UserInfoModel.manager({
    this.nickName = '李管家',
    this.avatar,
    this.role = USER_ROLE.MANAGER,
  });

  ///师傅角色生成
  ///password 000001
  UserInfoModel.fixer({
    this.nickName = '王师傅',
    this.avatar,
    this.role = USER_ROLE.FIXER,
  });

  ///师傅角色生成
  ///password 000002
  UserInfoModel.security({
    this.nickName = '林保安',
    this.avatar,
    this.role = USER_ROLE.SECURITY,
  });
}
