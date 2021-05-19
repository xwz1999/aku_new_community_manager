// Flutter imports:
import 'package:flutter/material.dart';

class KeyManageMap {
  static Map<int, String> keyStatus = {
    1: '可申请',
    2: '审核中',
    3: '已通过',
    4: '使用中',
    5: '已驳回',
    6: '钥匙已空'
  };
  static Map<int, Color> keyStatusColor = {
    1: Color(0xFF2576E5),
    2: Color(0xFFFFC40C),
    3: Color(0xFF333333),
    4: Color(0xFFFFC40C),
    5: Color(0xFFE60E0E),
    6: Color(0xFF999999),
  };
}
