// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:aku_community_manager/style/app_style.dart';

class InspectionUtils {
  static TextStyle textstyle =
      TextStyle(color: AppStyle.minorTextColor, fontSize: 28.sp);
  static Map<int, String> status = {1: '待巡检', 2: '已巡检', 3: '巡检中', 4: '未巡检'};
  static Color color(int status) {
    switch (status) {
      case 1:
        return Color(0xFFFF4501);
        break;
      case 2:
        return Color(0xFF999999);
      case 3:
        return Color(0xFFFF4501);
      case 4:
        return Color(0xFFFF4501);
      default:
        return Colors.blue;
    }
  }
}
