// Flutter imports:
import 'package:flutter/material.dart';

///设施检查相关map
class FacilitiesMap {
  ///设施检查状态
  static Map<int, String> inspectStatus = {1: '待检查', 2: '未完成', 3: '已检查'};

  ///设施检查状态的文字颜色
  static Map<int, Color> insepectColor = {
    1: Color(0xFFF49F02),
    2: Color(0xFF666666),
    3: Color(0xFF999999)
  };
}
