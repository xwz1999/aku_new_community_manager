// Flutter imports:
import 'package:flutter/material.dart';

class KeyManageMap {
  static Map<int, String> keyStatus = {
    1: '可申请',
    2: '使用中',
    3: '钥匙已空',
    4: '',
    5: '',
    6: ''
  };
  static Map<int, Color> keyStatusColor = {
    1: Color(0xFF2576E5),
    2: Color(0xFFFFC40C),
    3: Color(0xFF333333),
    4: Color(0xFF999999),
    5: Color(0xFF999999),
    6: Color(0xFF999999),
  };

 static Map<int, String> keyRecordStatus = {
    1: '待审核',
    2: '已通过',
    3: '已驳回',
    4: '已归还',
    5: '',
    6: ''
  };

  static Map<int, Color> keyRecordStatusColor = {
    1: Color(0xFF333333),
    2: Color(0xFFFF8200),
    3: Color(0xFFE60E0E),
    4: Color(0xFF999999),
    5: Color(0xFF999999),
    6: Color(0xFF999999),
  };
}
