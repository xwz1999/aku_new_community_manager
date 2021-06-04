// Flutter imports:
import 'package:flutter/material.dart';

class GreenManageMap {
  static String statusString(int status) {
    switch (status) {
      case 1:
        return '待处理';
      case 2:
        return '已完成';
      case 3:
        return '未完成';
      default:
        return '未知';
    }
  }

  static Color statusColor(int status) {
    switch (status) {
      case 1:
        return Color(0xFFFF8200);
      case 2:
        return Color(0xFF999999);
      case 3:
        return Color(0xFFE60E0E);
      default:
        return Colors.black;
    }
  }
}
