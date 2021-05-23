class WeekDaysToChinese {
  static String fromString(String weekday) {
    switch (weekday) {
      case 'Monday':
        return '周一';
      case 'Tuesday':
        return '周二';
      case 'Wednesday':
        return '周三';
      case 'Thursday':
        return '周四';
      case 'Friday':
        return '周五';
      case 'Saturday':
        return '周六';
      case 'Sunday':
        return '周日';
      default:
        return '未知';
    }
  }
}
