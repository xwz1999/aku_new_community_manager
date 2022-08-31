part 'engineer_repair.dart';

class API {
  ///HOST
  static const String host = 'http://star.kaidalai.cn/';

  ///接口基础地址
  static const String baseURL = '$host/api/butlerApp';

  ///静态资源路径
  static String get resource => '$host/static';

  static String image(String path) => '$resource$path';

  static String file(String path) => '$resource$path';

  static const int networkTimeOut = 10000;
  static _Auth auth = _Auth();
  static _User user = _User();
  static _Manage manage = _Manage();
  static _Upload upload = _Upload();
  static _Message message = _Message();
  static _EngineerRepair engineerRepair = _EngineerRepair();
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

  ///意见反馈：管家app意见反馈提交（建议）
  String get feedbackSubmit => '/user/feedback/submit';
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

  ///借还管理：出借审核
  String get lendingApproval => '/user/borrow/lendingApproval';

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

  ///巡检管理：扫码二维码查询巡检信息
  String get inspectionFindCheckDetailByQR =>
      '/user/inspection/findCheckDetailByQR';

  ///巡检管理：提交巡检点信息
  String get submitPointDetail => '/user/inspection/submitPointDetail';

  ///巡检管理：查询巡检执行点信息（点击已巡检查看详情）
  String get inspectionPointCheckDetail =>
      '/user/inspection/findCheckDetailById';

  ///巡检管理：查询计划巡检点信息（当前巡检执行计划状态为1.待巡检，4.未巡检）
  String get inspectionPointCheckDetailUnbegin =>
      '/user/inspection/findCheckDetailById2';

  ///待办事项：查询处理事项的数量
  String get findItemNum => '/user/backlog/findItemNum';

  ///待办事项：查询所有的待办事务
  String get backlogList => '/user/backlog/list';

  ///借还管理：新增总类
  String get insertArticle => '/user/borrow/insertArticle';

  ///借还管理：删除物品明细信息
  String get borrowDelete => '/user/borrow/delete';

  ///借还管理：新增物品明细
  String get borrowinsertArticleDetail => '/user/borrow/insertArticleDetail';

  ///巡检管理：上传巡检定位信息（开始巡检后，每n秒上传一次）
  String get uploadLocation => '/user/inspection/uploadLocation';

  ///管家app 包裹代收：查询所有的包裹代收信息
  String get packageManageList => '/user/packageCollection/list';

  ///管家app 包裹代收：提醒领取
  String get packageManageRemind => '/user/packageCollection/remind';

  ///管家app 包裹代收：添加包裹代收信息
  String get addPackage => '/user/packageCollection/insert';

  ///管家app 规程管理：查询所有的规程管理信息
  String get rulesManageList => '/user/regulationManage/list';

  ///管家app钥匙管理：查询所有的钥匙信息
  String get getAllkeyList => '/user/key/list';

  ///管家app钥匙管理：查询所有的未归还钥匙信息
  String get getNOReturnList => '/user/key/noReturnList';

  ///管家app钥匙管理：申请钥匙
  String get applyKey => '/user/key/apply';

  ///管家app钥匙管理：归还钥匙
  String get returnKey => '/user/key/returnKey';

  ///管家app钥匙管理：查询所有的申请记录（包含条件搜索）
  String get keyRecordList => '/user/key/record';

  ///管家app绿化管理：查询所有的绿化管理
  String get greenManageList => '/user/green/list';

  ///管家app绿化管理：确认完成
  String get greenManageComplete => '/user/green/complete';

  ///管家app卫生管理：查询所有的卫生管理
  String get hygienceList => '/user/hygiene/list';

  ///管家app卫生管理：确认完成
  String get hygienceComplete => '/user/hygiene/complete';

  ///管家app设施设备检查：查询所有的设施设备检查信息
  String get facilitiesCheckList => '/user/facilitiesCheck/list';

  ///管家app设施设备检查：提交报告
  String get submitFacilitiesCheckInfo => '/user/facilitiesCheck/submitCheck';

  ///管家app 考勤管理：查询当前用户今日打卡记录
  String get todayClockRecord => '/user/attendance/todayClockRecord';

  ///管家app 考勤管理：上下班打卡
  String get clockInOut => '/user/attendance/clock';

  ///管家app 考勤管理：打卡记录
  String get clockRecord => '/user/attendance/clockRecord';

  ///管家app 考勤管理：加班/请假申请记录
  String get clockApplyRecord => '/user/attendance/applyRecord';

  ///管家app 考勤管理：填写加班/请假申请
  String get clockApply => '/user/attendance/apply';

  ///管家app 客户访谈管理：查询所有客户访谈信息
  String get interviewList => '/user/interview/list';

  ///管家app 客户访谈管理：访谈回复
  String get interviewFeedBack => '/user/interview/feedBack';

  ///管家app 一键报警：添加管家app报警记录
  String get insertAlarmRecord => '/user/alarm/insertAlarmRecord';

  ///管家app 家政服务：查询所有的家政服务信息
  String get houseKeepingList => '/user/housekeeping/list';

  ///管家app 楼栋查询：查询所有楼栋id和name(管家app)
  String get allBuilding => '/user/personalData/findAll';

  ///管家app 单元查询：根据楼栋id查询对应的单元id和name(管家app)
  String get allUnit => '/user/personalData/findByBuildingId';

  ///管家app 单元查询：根据单元id查询对应的房产id和name(管家app)
  String get allHous => '/user/personalData/findByBuildingUnitId';

  ///管家app 家政服务管理：添加家政服务信息
  String get addHouseKeeping => '/user/housekeeping/insert';

  ///管家app 装修管理：查询所有的装修管理信息
  String get newRenovationList => '/user/userDecorationNew/list';

  ///管家app 新版装修：提交检查报告
  String get submitRenovation => '/user/userDecorationNew/submitReport';

  ///管家app 新版家政服务：查询所有的家政服务信息（包含搜索条件）
  String get newHouseKeepingList => '/user/housekeepingService/list';

  ///管家app新版家政服务：根据家政服务主键id查询家政服务服务进程
  String get newHouseKeepingProcess =>
      '/user/housekeepingService/findHousekeepingProcessRecord';

  ///管家app 新版家政服务：催促人员
  String get newHouseKeepingUrgeWork =>
      '/user/housekeepingService/urgedWorkers';

  ///管家app 新版家政服务：接单
  String get newHouseKeepingOrderReceive =>
      '/user/housekeepingService/orderReceiving';

  ///管家app 新版家政服务：查询所有的接单人员
  String get newHouseKeepingPickStaffList =>
      '/user/housekeepingService/findPickUpSinglePersonnel';

  ///管家app 新版家政服务：派单
  String get newHouseKeepingOrderDepart =>
      '/user/housekeepingService/sendSingle';

  ///管家app 新版家政服务：提交报告
  String get newHouseKeepingSubmit => '/user/housekeepingService/submitReport';
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

  ///上传巡更人员拍摄现场
  String get uploadInspectionSpace => '/user/upload/uploadInspectionSpace';

  ///上传巡更人员自拍人脸
  String get uploadInspectionFace => '/user/upload/uploadInspectionFace';

  ///上传咨询建议照片
  String get uploadAdvices => '/user/upload/uploadAdvice';

  ///上传设施设备检查照片
  String get uploadFacilitiCheckPhoto =>
      '/user/upload/uploadFacilitiesCheckPhoto';

  ///家政服务 上传处理完成照片
  String get uploadHandlerPhoto =>
      '/user/upload/uploadHousekeepingServiceHandlerPhone';

  ///上传报事报修工程维修照片
  String get uploadEngineerRepair =>
      '/user/upload/uploadButlerAppEngineeringRepair';

  ///上传报事报修工程维修工作汇报图片照片
  String get uploadEngineerRepairReport =>
      '/user/upload/uploadButlerAppWorkReport';

  ///上传报事报修工程维修完成维修图片照片
  String get engineerRepairComplete =>
      '/user/upload/uploadButlerAppCompleteMaintenance';

  ///上传报事报修工程维修验收照片图片照片
  String get engineerRepairAcceptance =>
      '/user/upload/uploadButlerAppAcceptance';
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

  ///消息中心：根据工单主键id同步查询报事报修评论（同步）
  String get getCommentByDispatchId => '/user/message/findCommentByDispatchId';

  ///消息中心：根据报事报修主键id 同步查询报事报修消息信息（同步）
  String get getSystemByDispatchId => '/user/message/findRepairByRepairId';

  ///消息中心：评论消息全部已读(进入评论消息列表后调用)
  String get allReadCommentMes => '/user/message/allReadComment';

  ///消息中心：系统消息全部已读(进入系统消息列表后调用)
  String get allReadSysMes => '/user/message/allReadSys';

  ///消息中心：根据绿化任务主键id 同步查询绿化任务消息信息（同步）
  String get getSysGreenMessageById => '/user/message/findGreenTaskByGreenId';

  ///消息中心：根据卫生任务主键id 同步查询卫生任务消息信息（同步）
  String get getSysHygienceMessageById =>
      '/user/message/findHygieneTaskByGreenId';
}
