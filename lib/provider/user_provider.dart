// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/mock_models/users/user_info_model.dart';
import 'package:aku_community_manager/models/user/user_profile_model.dart';
import 'package:aku_community_manager/utils/hive_store.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';

import 'package:aku_community_manager/models/user/user_info_model.dart'
    as USER_INFO;

//登录状态管理
class UserProvider extends ChangeNotifier {
  bool _isLogin = false;

  bool get isLogin => _isLogin;

  ///登陆
  Future setLogin(int token) async {
    _isLogin = true;
    NetUtil()
        .dio
        .options
        .headers
        .putIfAbsent('butlerApp-admin-token', () => token);
    HiveStore.appBox.put('token', token);
    HiveStore.appBox.put('login', true);
    _profileModel = await updateProfile();
    _infoModel = await updateUserInfo();
    // await setCurrentHouse((_userDetailModel?.estateNames?.isEmpty ?? true)
    //     ? ''
    //     : _userDetailModel?.estateNames?.first);
    notifyListeners();
  }

  UserProfileModel _profileModel;
  UserProfileModel get profileModel => _profileModel;
  USER_INFO.UserInfoModel _infoModel;
  USER_INFO.UserInfoModel get infoModel => _infoModel;

  ///更新用户profile
  Future<UserProfileModel> updateProfile() async {
    BaseModel model = await NetUtil().get(API.user.profile);
    if (model == null)
      return null;
    else
      return UserProfileModel.fromJson(model.data);
  }

  Future<USER_INFO.UserInfoModel> updateUserInfo() async {
    BaseModel model = await NetUtil().get(API.user.info);
    if (model == null)
      return null;
    else
      return USER_INFO.UserInfoModel.fromJson(model.data);
  }

  ///注销登录
  logout() {
    _isLogin = false;
    HiveStore.appBox.delete('token');
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
