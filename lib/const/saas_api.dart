import 'package:aku_new_community_manager/tools/user_tool.dart';

part 'other_api.dart';

class SAASAPI {
  ///HOST
  static const String host = 'http://121.41.26.225:8008';

  ///接口基础地址
  static const String baseURL = '$host';

  ///静态资源路径
  static String get resource =>
      'https://saas.kaidalai.cn/resource/${UserTool.userProvider.userInfoModel!.id}/';

  static String image(String? path) => '$resource$path';

  static String file(String? path) => '$resource$path';
  static const int networkTimeOut = 10000;

  ///根分类

  static _Login login = _Login();
  static _Inspection inspection = _Inspection();
  static _User user = _User();
  static _Message message = _Message();
  static _WorkOrder workOrder = _WorkOrder();

  ///二级分类
  static _OtherApi other = _OtherApi();
}

class _Login {
  ///查询所有的城市信息
  String get allCity => '/butlerApp/city/allCity';

  ///管家app用户退出
  String get logOut => '/butlerApp/user/quit';

  ///获取用户详情
  String get userInfo => '/butlerApp/user/findDetail';

  ///查询所有小区信息
  String get allCommunity => '/butlerApp/login/findAllCommunity';

  ///手机号密码登录
  String get login => '/butlerApp/login/loginTelPwd';

  /// 获取手机验证码
  String get sendSMSCode => '/butlerApp/login/sendTelCode';

  ///app用户（手机号验证码）登录
  String get loginTelCode => '/butlerApp/login/loginTelCode';
}

class _Inspection {
  ///获取巡检执行的定位信息
  String get getLocation => '/butlerApp/user/inspection/getLocation';

  /// 上传巡检定位信息
  String get uploadLocation => '/butlerApp/user/inspection/uploadLocation';

  ///查询当前用户所有的巡检信息
  String get list => '/butlerApp/user/inspection/list';

  ///根据巡检执行项主键id查询巡检详情
  String get detail => '/butlerApp/user/inspection/detail';

  ///根据巡检计划主键id查询巡检点部分信息（开始巡检前调用）
  String get findPointByPlanId =>
      '/butlerApp/user/inspection/findPointByPlanId';

  ///根据巡检执行情况主键id查询巡检点部分信息（开始巡检后调用）
  String get findPointByExecuteId =>
      '/butlerApp/user/inspection/findPointByExecuteId';

  ///开始巡检
  String get startInspection => '/butlerApp/user/inspection/startInspection';

  ///扫码二维码查询巡检执行点信息
  String get findCheckDetailByQR =>
      '/butlerApp/user/inspection/findCheckDetailByQR';

  ///提交巡检执行点信息
  String get submit => '/butlerApp/user/inspection/submit';

  ///查询巡检执行点信息（当前巡检执行项状态为【2.已巡检，3.巡检中】时调用）
  String get findExecutePointInfo =>
      '/butlerApp/user/inspection/findExecutePointInfo';

  ///查询计划巡检点信息（当前巡检执行计划状态为【1.待巡检，4.未巡检】时调用）
  String get findPlanPointInfo =>
      '/butlerApp/user/inspection/findPlanPointInfo';
}

class _User {
  ///用户资料
  String get userProfile => '/app/user/findDetail';

  ///设置密码（密码不存在时调用）
  String get settingPsd => '/app/user/settingPassword';

  ///提交修改的新密码（忘记密码）
  String get settingForgotPsd => '/app/user/forgetPassword';

  ///app用户发送手机号验证码(忘记密码)
  String get sendForgotTelCode => '/app/user/sendTelCodeForgetPwd';

  ///检测昵称是否重复
  String get checkNickRepeat => '/app/user/checkNickNameRepeat';

  ///设置昵称
  String get setNickName => '/app/user/settingNickName';

  ///实名认证
  String get certification => '/app/user/verified';

  ///修改用户头像
  String get updateAvatar => '/app/user/updateAvatarImg';
}

class _Message {
  ///查询所有的管家app信息
  String get messageList => '/butlerApp/user/message/list';
}

class _WorkOrder {
  ///根据工单主键id查询工单
  String get orderBill => '/butlerApp/user/workOrder/workOrderBill';

  ///根据工单主键id查询工单进度列表
  String get findScheduleById => '/butlerApp/user/workOrder/findScheduleById';

  ///根据工单主键id查询工单报告列表
  String get findRRById => '/butlerApp/user/workOrder/findRRById';

  ///提醒支付
  String get reminderPay => '/butlerApp/user/workOrder/reminderPay';

  ///开始服务
  String get startService => '/butlerApp/user/workOrder/startService';

  ///完成工单
  String get finish => '/butlerApp/user/workOrder/finish';

  ///汇报
  String get report => '/butlerApp/user/workOrder/report';

  ///领取任务
  String get receiveTask => '/butlerApp/user/workOrder/receiveTask';

  ///提醒用户确认
  String get reminderConfirm => '/butlerApp/user/workOrder/reminderConfirm';

  ///提醒完成
  String get reminderDone => '/butlerApp/user/workOrder/reminderDone';

  ///提醒处理
  String get reminderProcessing => '/butlerApp/user/workOrder/reminderDone';

  ///移至待分配
  String get moveToAssignment => '/butlerApp/user/workOrder/moveToAssignment';

  ///加入工单池
  String get joinTicketPool => '/butlerApp/user/workOrder/joinTicketPool';

  ///取消工单
  String get cancel => '/butlerApp/user/workOrder/cancel';

  ///查询服务团队名单
  String get findServiceTeamList =>
      '/butlerApp/user/workOrder/findServiceTeamList';

  ///根据工单主键id查询工单信息
  String get findById => '/butlerApp/user/workOrder/findById';

  ///添加管家app工单信息
  String get insert => '/butlerApp/user/workOrder/insert';

  ///查询所有的管家app工单信息
  String get list => '/butlerApp/user/workOrder/list';
}
