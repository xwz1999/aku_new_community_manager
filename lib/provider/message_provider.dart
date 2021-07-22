import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MessageProvider extends ChangeNotifier {
  int _sysMessage = 0;
  int _commentMessage = 0;
  String _sysDate = '';
  String _commentDate = '';
  bool get hasMessage => _sysMessage != 0 || _commentMessage != 0;
  int get sysMessage => _sysMessage;
  int get commentMessage => _commentMessage;
  String get sysDate =>
      DateUtil.formatDateStr(_sysDate, format: 'yyyy-MM-dd HH:mm');

  String get commentDate =>
      DateUtil.formatDateStr(_commentDate, format: 'yyyy-MM-dd HH:mm');
  int _sysMesType = 0;
  String get sysMesTypeString {
    switch (_sysMesType) {
      case 1:
        return '报事报修';
      case 2:
        return '装修';
      case 3:
        return '绿化任务';
      case 4:
        return '卫生任务';
      case 5:
        return '家政服务';
      default:
        return '未知';
    }
  }

  updateMessage() async {
    Response response = await NetUtil().dio!.get(API.message.messageCenter);
    if (response.data == null) return;
    _sysMessage = response.data['sysCount'] ?? 0;
    _commentMessage = response.data['commentCount'] ?? 0;
    _sysMesType = response.data['sysType'] ?? 0;
    _sysDate = response.data['sysDate'] ?? '';
    _commentDate = response.data['commentDate'] ?? '';
    notifyListeners();
  }
}
