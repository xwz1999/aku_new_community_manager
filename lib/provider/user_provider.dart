// Dart imports:
import 'dart:io';

// Project imports:
import 'package:aku_new_community_manager/const/api.dart';
// Flutter imports:
import 'package:aku_new_community_manager/models/user/user_info_model.dart';
import 'package:aku_new_community_manager/models/user/user_profile_model.dart';
import 'package:aku_new_community_manager/provider/message_provider.dart';
import 'package:aku_new_community_manager/utils/hive_store.dart';
import 'package:aku_new_community_manager/utils/network/base_file_model.dart';
import 'package:aku_new_community_manager/utils/network/base_model.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
import 'package:aku_new_community_manager/utils/websocket/web_socket_util.dart';
// Package imports:
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:provider/provider.dart';

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
    _profileModel = await updateProfile();
    _infoModel = await updateUserInfo();
    if (isLogin) {
      WebSocketUtil().setUser(_infoModel?.id.toString() ?? '');
      WebSocketUtil().startWebSocket();
    }
    // await setCurrentHouse((_userDetailModel?.estateNames?.isEmpty ?? true)
    //     ? ''
    //     : _userDetailModel?.estateNames?.first);
    notifyListeners();
  }

  UserProfileModel? _profileModel;

  UserProfileModel? get profileModel => _profileModel;
  UserInfoModel? _infoModel;

  UserInfoModel? get infoModel => _infoModel;

  ///更新用户profile
  Future<UserProfileModel?> updateProfile() async {
    final messageProvider =
        Provider.of<MessageProvider>(Get.context!, listen: false);
    messageProvider.updateMessage();
    BaseModel? model = await NetUtil().get(API.user.profile);
    if (model.data == null)
      return null;
    else
      return UserProfileModel.fromJson(model.data);
  }

  Future<UserInfoModel?> updateUserInfo() async {
    BaseModel? model = await NetUtil().get(API.user.info);

    if (model.data == null)
      return null;
    else {
      var userModel = UserInfoModel.fromJson(model.data);
      JPush().setAlias(userModel.id.toString());
      print('jpush alias is ${userModel.id}');
      return userModel;
    }
  }

  ///注销登录
  logout() async {
    await NetUtil().get(API.auth.logout, showMessage: true);
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

  ///设置用户登陆
  setisSigned(bool state) {
    _isSigned = state;
    notifyListeners();
  }

  ///修改昵称
  setNickName(String name) {
    _infoModel!.nickName = name;
    notifyListeners();
  }

  ///修改头像
  setAvatar(File file) async {
    Function cancel = BotToast.showLoading();
    BaseFileModel fileModel = await NetUtil().upload(API.upload.avatar, file);
    if (fileModel.status == true) {
      await NetUtil().post(
        API.user.updateAvatar,
        params: {
          'fileUrls': [fileModel.url],
        },
        showMessage: true,
      );
      _profileModel = await updateProfile();
      cancel();
      notifyListeners();
    }
  }

  ///修改手机
  setTel(String tel) {
    _profileModel!.tel = tel;
    notifyListeners();
  }
}
