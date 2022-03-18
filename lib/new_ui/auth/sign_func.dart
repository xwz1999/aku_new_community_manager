import 'package:aku_new_community_manager/const/saas_api.dart';
import 'package:aku_new_community_manager/models/user/user_info_model.dart';
import 'package:aku_new_community_manager/new_ui/auth/set_nick_nage_page.dart';
import 'package:aku_new_community_manager/new_ui/auth/set_psd_page.dart';
import 'package:aku_new_community_manager/saas_models/net_model/base_model.dart';
import 'package:aku_new_community_manager/tools/user_tool.dart';
import 'package:aku_new_community_manager/ui/home/home_page.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

class SignFunc {
  //发送手机号验证码
  static Future<BaseModel> sendMessageCode(
      String phone, int communityId) async {
    BaseModel baseModel = await NetUtil().post(
      SAASAPI.login.sendSMSCode,
      params: {'tel': phone, 'communityId': communityId},
      showMessage: true,
    );
    return baseModel;
  } //发送手机号验证码

  static Future<BaseModel> sendForgotMessageCode(
      String phone, int communityId) async {
    BaseModel baseModel = await NetUtil().post(
      SAASAPI.user.sendForgotTelCode,
      params: {'tel': phone, 'communityId': communityId},
      showMessage: true,
    );
    return baseModel;
  }

  //验证码登录
  static Future<Response> loginBySms(
      String phone, String code, int communityId) async {
    Response response = await NetUtil().dio!.post(
      SAASAPI.login.loginTelCode,
      data: {
        'tel': phone,
        'code': code,
        'communityId': communityId,
      },
    );
    return response;
  }

  ///更新用户信息
  static Future<UserInformationModel?> getUserInfo() async {
    BaseModel baseModel = await NetUtil().get(SAASAPI.user.userProfile);
    if (baseModel.data == null || !baseModel.success) return null;
    return UserInformationModel.fromJson(baseModel.data);
  }

  ///设置密码（密码不存在时调用
  static Future<bool> settingPsd(String psd) async {
    BaseModel baseModel = await NetUtil().get(SAASAPI.user.settingPsd,
        params: {'password': psd}, showMessage: true);
    if (baseModel.data == null || !baseModel.success) return false;
    return true;
  }

  ///提交修改的新密码（忘记密码）
  static Future<bool> settingForgotPsd(
      String psd, String tel, String telcode) async {
    BaseModel baseModel = await NetUtil().get(SAASAPI.user.settingForgotPsd,
        params: {
          'newPassword': psd,
          'tel': tel,
          'telCode': telcode,
          'communityId':
              UserTool.appProvider.pickedCityAndCommunity!.communityModel!.id
        },
        showMessage: true);
    if (baseModel.data == null || !baseModel.success) return false;
    return true;
  }

  //登录
  static Future<Response> login(
      String phone, String code, int communityId) async {
    Response response = await NetUtil().dio!.post(
      SAASAPI.login.login,
      data: {
        'tel': phone,
        'password': code,
        'communityId': communityId,
      },
    );
    return response;
  }

  static Future checkNameAndAccount() async {
    if (!UserTool.userProvider.userInfoModel!.isExistPassword) {
      await Get.to(() => SetPsdPage());
    } else if (UserTool.userProvider.userInfoModel!.nickName == null) {
      await Get.to(() => SetNickNamePage());
    } else {
      Get.offAll(() => HomePage());
    }
  }

  ///检测昵称是否重复
  static Future<bool> checkNickRepeat(String nick) async {
    BaseModel baseModel = await NetUtil().get(SAASAPI.user.checkNickRepeat,
        params: {
          'nickName': nick,
        },
        showMessage: true);
    return baseModel.msg == '昵称可用';
  }

  ///设置昵称
  static Future<bool> setNickName(String nick) async {
    BaseModel baseModel = await NetUtil().get(SAASAPI.user.setNickName,
        params: {
          'nickName': nick,
        },
        showMessage: true);
    return baseModel.msg == '设置成功';
  }
}
