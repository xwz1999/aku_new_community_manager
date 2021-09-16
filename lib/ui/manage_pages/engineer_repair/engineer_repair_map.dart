class ERMap {
  static statusString(int status) {
    switch (status) {
      case 1:
        return '待派单(公司)';
      case 2:
        return '待派单(人员)';
      case 3:
        return '待接单';
      case 4:
        return '处理中';
      case 5:
        return '待验收';
      case 6:
        return '验收失败';
      case 7:
        return '验收成功';
      case 8:
        return '已作废';
      case 9:
        return '已取消';
      default:
        return '未知';
    }
  }

  static operationType(int type) {
    switch (type) {
      case 1:
        return '提交工程维修';
      case 2:
        return '维修公司派单';
      case 3:
        return '维修人员派单';
      case 4:
        return '维修人员接单';
      case 5:
        return '处理完成';
      case 8:
        return '作废';
      case 9:
        return '取消';
      default:
        return '未知';
    }
  }
}
