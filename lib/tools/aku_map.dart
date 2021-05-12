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
  static String operationType(int operationType) {
    switch (operationType) {
      case 1:
        return '提交保修';
      case 2:
        return '派单';
      case 3:
        return '开始处理';
      case 4:
        return '处理完成';
      case 5:
        return '确认';
      case 6:
        return '回访';
      case 7:
        return '回退';
      case 8:
        return '作废';
      case 9:
        return '取消';
        break;
      case 10:
        return '改派';
      case 11:
        return '延时';
      default:
        return '';
    }
  }

  static Map<int, String> dispatchType = {1: '无偿服务', 2: '有偿服务'};
}
