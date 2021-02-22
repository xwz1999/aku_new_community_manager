class AkuMap {
  static String fixStatus(bool canOpention, bool canPickup, int status) {
    if (canOpention) {
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
}
