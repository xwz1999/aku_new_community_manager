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
  static _Manage manage = _Manage();
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

  ///个人资料：发送手机号修改验证码
  String get sendTelUpdateCode => '/user/personalData/sendTelUpdateCode';

  ///个人资料：根据新手机号发送修改验证码
  String get updateTel => '/user/personalData/updateTel';
}

class _Manage {
  ///报事报修：查询 维修部组织信息及人员
  String get fixers => '/user/repair/findRepairOrganization';

  ///活动管理：管家app 查询所有的活动管理信息
  String get acitivityList => '/user/activity/list';

  ///活动管理：管家app 根据活动管理主键id查询活动详情
  String get activityDetail => '/user/activity/findById';

  ///访客管理：管家app显示所有的访客信息 （包含条件搜索）
  String get visitorList => '/user/visitor/list';

  ///报事报修：查询所有的报事报修信息(包含条件搜索)
  String get repairList => '/user/repair/list';

  ///借还管理：查询全部物品
  String get borrowList => '/user/borrow/articleList';

  ///借还管理：根据物品主键id查询所有的物品明细信息
  String get borrowDetailList => '/user/borrow/articleDetailList';

  ///借还管理：根据物品明细id 查询物品信息
  String get borrowItemDetail => '/user/borrow/findById';

  ///借还管理：查询所有的借还信息（包含条件搜索）
  String get borrowStatusList => '/user/borrow/list';

  ///借还管理：提醒归还(管理员发送)
  String get remindUserReturn => '/user/borrow/remind';

  ///借还管理：检查信息
  String get borrowCheckInfo => '/user/borrow/checkItems';

  ///借还管理：提交检查结果
  String get borrowCheck => '/user/borrow/submitCheck';

  ///物品出户：查询所有的物品出户信息(包含搜索条件)
  String get goodsOutList => '/user/articleOut/list';

  ///物品出户：根据物品出户主键id查询出户详情
  String get goodsOutDetail => '/user/articleOut/findById';
}
