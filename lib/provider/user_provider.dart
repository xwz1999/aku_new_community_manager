import 'dart:io';

import 'package:aku_community_manager/mock_models/users/user_info_model.dart';
import 'package:flutter/material.dart';

//登录状态管理
class UserProvider extends ChangeNotifier {
  bool _isSigned = false;

  ///用户是否登陆
  get isSigned => _isSigned;

  ///设置用户登陆
  setisSigned(bool state) {
    _isSigned = state;
    notifyListeners();
  }

  UserInfoModel _userInfoModel = UserInfoModel.empty();

  UserInfoModel get userInfoModel => _userInfoModel;

  setUserInfo(UserInfoModel model) {
    _userInfoModel = model;
    _isSigned = true;
    notifyListeners();
  }

  setNickName(String name) {
    _userInfoModel.nickName = name;
    notifyListeners();
  }

  setAvatar(File file) {
    _userInfoModel.avatar = file;
    notifyListeners();
  }
}
