part of 'api.dart';

class _EngineerRepair {
  ///管家app 报事报修工程维修：查询所有的报事报修工程维修信息
  String get engineerRepairList => '/user/repairEngineering/list';

  ///管家app 报事报修工程维修：添加报事报修工程维修
  String get engineerRepairInsert => '/user/repairEngineering/insert';

  ///管家app 报事报修工程维修：根据工程维修主键id查询工程报修进程
  String get detail => '/user/repairEngineering/findById';

  ///管家app 报事报修工程维修：根据工程维修主键id查询工程报修进程
  String get process => '/user/repairEngineering/findProcessRecordById';

  ///管家app 报事报修工程维修：根据工程维修主键id查询工作日志
  String get workReport =>
      '/user/repairEngineering/findReportByRepairEngineeringId';

  ///管家app 报事报修工程维修：查询所有的维修公司
  String get organization => '/user/repairEngineering/findRepairOrganization';

  ///管家app 报事报修工程维修：工程维修公司派单
  String get companySend =>
      '/user/repairEngineering/maintenanceCompanySendSingle';

  ///管家app 报事报修工程维修：根据维修公司主键id查询维修人员信息
  String get persons => '/user/repairEngineering/findSysUserByOrganizationId';

  ///管家app 报事报修工程维修：工程维修维修人员派单
  String get personSend =>
      '/user/repairEngineering/maintenancePersonnelSendSingle';

  ///管家app 报事报修工程维修：工程维修维修人员接单
  String get personPick => '/user/repairEngineering/maintenanceStaffPickSingle';

  ///管家app 报事报修工程维修：提交工作汇报
  String get submitReport => '/user/repairEngineering/submitReport';

  ///管家app 报事报修工程维修：完成维修2021-08-09 15:56:12
  String get complete => '/user/repairEngineering/completeMaintenance';

  ///管家app 报事报修工程维修：根据工程维修主键id查询最新的维修结果
  String get repairResult =>
      '/user/repairEngineering/findNewResultByRepairEngineeringId';

  ///管家app 报事报修工程维修：提交验收报告
  String get submitAcceptance => '/user/repairEngineering/submitAcceptance';

  ///管家app 报事报修工程维修：根据工程维修主键id查询最新的验收记录(只查询一条记录)
  String get acceptanceRecordNew =>
      '/user/repairEngineering/findNewAcceptanceRecordByRepairEngineeringId';

  ///管家app 报事报修工程维修：根据工程维修主键id查询验收记录（查询多条记录）
  String get acceptanceRecordList =>
      '/user/repairEngineering/findAcceptanceRecordByRepairEngineeringId';

  ///管家app 报事报修工程维修：开始整改
  String get startRectification => '/user/repairEngineering/startRectification';
}
