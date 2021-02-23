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
  String get updateTel =>'/user/personalData/updateTel';
  
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

  ///报事报修：根据报事报修id查询报修详情
  String get repairDetail => '/user/repair/findById';

  ///报事报修：查询派工单详情表-派工类型
  String get dispatchListDetailType => '/manage/dataDictionary/findSysDispatchListDetailType';

  ///报事报修：查询所有的工单时限信息(id and name)
  String get workOrderTimeLimit => '/user/repair/findWorkOrderTimeLimit';

  ///报事报修：查询所有的工单类型明细信息（工单子类信息）
  String get workOrderTypeDetail => '/user/repair/findWorkOrderTypeDetail';

  ///报事报修：报事报修：派单
  String get repairDispatch => '/user/repair/dispatch';

  ///报事报修：改派
  String get repairReassignment => '/user/repair/reassignment';
}
