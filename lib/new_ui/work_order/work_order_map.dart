class WorkOrderMap {
  static Map<int, String> orderStatus = {
    1: '待分配',
    2: '工单池',
    3: '已接单',
    4: '处理中',
    5: '待确认',
    6: '待支付',
    7: '已完成',
    8: '已评价',
    9: '已取消',
  };

  static Map<int, String> subStatusString = {
    1: '请及时前往现场与业主进行确认、检查',
    2: '请及时前往现场与业主进行确认、检查',
    3: '请及时前往现场与业主进行确认、检查',
    4: '进行过程中，记得提交报告哦',
    5: '如果申请人长时间未确认，请让物业尝试联系对方',
    6: '如果申请人长时间未支付，请让物业尝试联系对方',
    7: '用户已支付工单费用',
    8: '用户已对您的表现进行评价',
    9: '任务已拒绝，中止工单进行'
  };

  static Map<int, String> costType = {1: '人工费', 2: '耗材费'};
}
