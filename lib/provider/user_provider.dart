import 'dart:io';

import 'package:aku_community_manager/mock_models/users/user_info_model.dart';
import 'package:aku_community_manager/utils/hive_store.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:flutter/material.dart';

//登录状态管理
class UserProvider extends ChangeNotifier {
  bool _isLogin = false;

  bool get isLogin => _isLogin;

  Future setLogin(int token) async {
    _isLogin = true;
    NetUtil().dio.options.headers.putIfAbsent('App-Admin-Token', () => token);
    HiveStore.appBox.put('token', token);
    HiveStore.appBox.put('login', true);
    // await updateProfile();
    // await updateUserDetail();
    // await setCurrentHouse((_userDetailModel?.estateNames?.isEmpty ?? true)
    //     ? ''
    //     : _userDetailModel?.estateNames?.first);
    notifyListeners();
  }

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
