// Dart imports:

import 'dart:io';

import 'package:aku_new_community_manager/const/saas_api.dart';
import 'package:aku_new_community_manager/new_ui/auth/sign_func.dart';
import 'package:aku_new_community_manager/saas_models/net_model/base_model.dart';
import 'package:aku_new_community_manager/saas_models/user/user_info_model.dart';
import 'package:aku_new_community_manager/utils/hive_store.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
import 'package:aku_new_community_manager/utils/websocket/web_socket_util.dart';
// Package imports:
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

//登录状态管理
class UserProvider extends ChangeNotifier {
  bool _isLogin = false;

  bool get isLogin => _isLogin;

  ///登陆
  Future setLogin(int token) async {
    _isLogin = true;
    NetUtil().auth(token);
    await HiveStore.appBox!.put('token', token);
    await HiveStore.appBox!.put('login', true);
    if (isLogin) {
      await updateUserInfo();
      WebSocketUtil().startWebSocket();
      await SignFunc.checkNameAndAccount();
    }
    notifyListeners();
  }

  ///注销登录
  logout() async {
    WebSocketUtil().closeWebSocket();
    NetUtil().logout();
    _isLogin = false;
    await HiveStore.appBox!.delete('token');
    await HiveStore.appBox!.put('login', false);
    notifyListeners();
  }

  bool _isSigned = false;

  ///用户是否登陆
  get isSigned => _isSigned;

  ///修改昵称
  setNickName(String name) {
    // _infoModel!.nickName = name;
    notifyListeners();
  }

  ///修改手机
  setTel(String tel) {
    notifyListeners();
  }

  ///saas

  UserInfoModel? _userInfoModel;

  UserInfoModel? get userInfoModel => _userInfoModel;

  ///修改头像
  Future updateAvatar(File file) async {
    var url = '';
    try {
      var base = await NetUtil().upload(SAASAPI.other.file.uploadImg, file);
      if (base.success) {
        url = base.data as String;
      }
    } catch (e) {
      print(e.toString());
    }
    BaseModel model = await NetUtil().post(
      SAASAPI.user.updateAvatar,
      params: {
        'fileUrls': [url]
      },
      showMessage: true,
    );
    if (model.success) {
      await updateUserInfo();
    }
    notifyListeners();
  }

  Future updateUserInfo() async {
    var base = await NetUtil().get(SAASAPI.login.userInfo);
    if (base.success) {
      _userInfoModel = UserInfoModel.fromJson(base.data);
    } else {
      BotToast.showText(text: '用户信息更新失败');
    }
    notifyListeners();
  }
}
