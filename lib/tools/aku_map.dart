class AkuMap {
  ///根据权限返回不同的派单状态
  static String fixStatus(bool canSendTicket, bool canPickup, int status) {
    if (canSendTicket) {
      switch (status) {
        case 1:
          return '待派单';
          break;
        case 2:
          return '已派单';
        case 3:
          return '处理中';
        case 4:
        case 5:
        case 6:
          return '已处理';
        case 7:
          return '已作废';
        case 8:
          return '已取消';
        default:
          return '';
      }
    } else if (canPickup) {
      switch (status) {
        case 2:
          return '已派单';
        case 3:
          return '处理中';
        case 4:
        case 5:
        case 6:
          return '已处理';
        case 7:
          return '已作废';
        case 8:
          return '已取消';
        default:
          return '';
      }
    } else {
      switch (status) {
        case 1:
        case 2:
          return '未处理';
        case 3:
          return '处理中';
        case 4:
        case 5:
        case 6:
          return '已处理';
        case 7:
          return '已作废';
        case 8:
          return '已取消';
        default:
          return '';
      }
    }
  }

  ///报事报修服务类型
  static Map<int, String> fixAreaType = {1: '公区维修', 2: '家庭维修'};

  ///报事报修处理进程-操作类型
  static Map<int, String> operationType = {
    1: '提交报修',
    2: '派单',
    3: '开始处理',
    4: '处理完成',
    5: '确认',
    6: '回访',
    7: '回退',
    8: '作废',
    9: '取消'
  };

  static Map<int, String> dispatchType = {1: '无偿服务', 2: '有偿服务'};
}
