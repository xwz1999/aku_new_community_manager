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
}
