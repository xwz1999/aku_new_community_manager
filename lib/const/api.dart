class API {
  ///HOST
  static const String host = 'http://test.akuhotel.com:8804';

  ///接口基础地址
  static const String baseURL = '$host/IntelligentCommunity/manage';

  ///静态资源路径
  static String get resource => '$host/static';

  static String image(String path) => '$resource$path';

  static const int networkTimeOut = 10000;
  static _Login login = _Login();
}

class _Login {
  ///登录/退出：发送短信验证码
  String get sendSMS => '/login/sendMMSLogin';
}
