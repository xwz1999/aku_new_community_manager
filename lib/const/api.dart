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
  static _Upload upload = _Upload();
  static _Message message = _Message();
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

  ///个人资料：修改管家用户头像
  String get updateAvatar => '/user/personalData/updateHeadPortrait';
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
  String get dispatchListDetailType =>
      '/manage/dataDictionary/findSysDispatchListDetailType';

  ///报事报修：查询所有的工单时限信息(id and name)
  String get workOrderTimeLimit => '/user/repair/findWorkOrderTimeLimit';

  ///报事报修：查询所有的工单类型明细信息（工单子类信息）
  String get workOrderTypeDetail => '/user/repair/findWorkOrderTypeDetail';

  ///报事报修：报事报修：派单
  String get repairDispatch => '/user/repair/dispatch';

  ///报事报修：改派
  String get repairReassignment => '/user/repair/reassignment';

  ///报事报修：报事报修：接单
  String get recevingOrders => '/user/repair/receivingOrders';

  ///报事报修：申请延时
  String get applyDelayed => '/user/repair/applyDelayed';

  ///报事报修：处理完成
  String get handleResult => '/user/repair/handleResult';

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

  ///借还管理：修改物品明细信息
  String get borrowEdit => '/user/borrow/updateArticleDetail';

  ///物品出户：查询所有的物品出户信息(包含搜索条件)
  String get goodsOutList => '/user/articleOut/list';

  ///物品出户：根据物品出户主键id查询出户详情
  String get goodsOutDetail => '/user/articleOut/findById';

  ///物品出户：放行
  String get goodsOutRelease => '/user/articleOut/release';

  ///物品出户：不放行
  String get goodsOutNotRelease => '/user/articleOut/noRelease';

  ///装修管理：查询装修管理信息list列表
  String get decorationList => '/user/decoration/list';

  ///装修管理：根据装修主键id查询装修详情
  String get decorationFindByld => '/user/decoration/findById';

  ///物品出户：根据房产id查询业主名称和手机号（联系业主）
  String get goodsOutContactOwner => '/user/articleOut/contactOwner';

  ///巡检管理：查询所有的巡检管理信息
  String get inspectionList => '/user/inspection/list';

  ///巡检管理：根据巡检执行情况主键id查询巡检详情
  String get inspectionFindDetailByld => '/user/inspection/findDetailById';

  ///巡检管理：根据巡检计划主键id查询巡检点部分信息（开始巡检前调用）
  String get inspectionPointByPlanId => '/user/inspection/findPointByPlanId';

  ///巡检管理：开始巡检
  String get inspectionStart => '/user/inspection/startInspection';

  ///巡检管理：根据巡检执行情况主键id查询巡检点部分信息（开始巡检后调用）
  String get inspecntionFindPointByExecuteId =>
      '/user/inspection/findPointByExecuteId';
}

class _Upload {
  ///上传个人资料头像照片
  String get avatar => '/user/upload/butlerAppHeadSculpture';

  ///报事报修：根据报事报修id查询报修详情
  String get repairDetail => '/user/repair/findById';

  ///报事报修：查询派工单详情表-派工类型
  String get dispatchListDetailType =>
      '/manage/dataDictionary/findSysDispatchListDetailType';

  ///报事报修：查询所有的工单时限信息(id and name)
  String get workOrderTimeLimit => '/user/repair/findWorkOrderTimeLimit';

  ///报事报修：查询所有的工单类型明细信息（工单子类信息）
  String get workOrderTypeDetail => '/user/repair/findWorkOrderTypeDetail';

  ///上传物品信息详情照片
  String get uploadArticleDetail => '/user/upload/uploadArticleDetail';

  ///报事报修：处理完成
  String get handleResult => '/user/repair/handleResult';

  ///上传物品信息照片
  String get uploadArtical => '/user/upload/uploadArticle';
}

class _Message {
  ///消息中心
  String get messageCenter => '/user/message/messageCenter';

  ///消息中心：查询所有的系统通知
  String get systemList => '/user/message/sysMessageList';

  ///消息中心：查询所有的评论通知
  String get commentList => '/user/message/sysCommentMessageList';

  ///公告管理：管家app，查询所有的社区公告
  String get announcementList => '/user/announcement/list';

  ///公告管理（管家app）：根据社区公告主键id查询社区公告信息
  String get announcementFindByld => '/user/announcement/findById';
}
