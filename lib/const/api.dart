class API {
  ///HOST
  static const String host = 'http://test.akuhotel.com:8804';

  ///接口基础地址
  static const String baseURL = '$host/IntelligentCommunity/butlerApp';

  ///静态资源路径
  static String get resource => '$host/static';

  static String image(String path) => '$resource$path';

  static const int networkTimeOut = 10000;
  static _Auth auth = _Auth();
  static _User user = _User();
}

class _Auth {
  ///登录/退出：发送短信验证码
  String get sendSMS => '/login/sendMMSLogin';

  ///登录/退出：管家app用户短信登录
  String get login => '/login/loginSMSUser';

  ///登录/退出：管家用户退出账户
  String get logout => '/user/signOut';
}

class _User {
  ///个人资料：查询个人资料信息
  String get profile => '/user/personalData/findPersonalData';

  ///个人资料：获取用户信息
  String get info => '/user/personalData/getUserDetail';

  ///个人资料：修改管家用户昵称
  String get updateNickName => '/user/personalData/updateNickName';
}
