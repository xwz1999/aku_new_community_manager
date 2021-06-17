class MessageMap {
  static sysType(int type){
    switch (type) {
      case 1:
        return '报事报修';
      case 2:
        return '装修';
      case 3:
        return '绿化任务';
      case 4:
        return '卫生任务';
      default:
        return '未知';
    }
  }
}