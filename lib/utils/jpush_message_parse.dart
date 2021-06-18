// Dart imports:
import 'dart:convert';

import 'package:aku_community_manager/utils/websocket/fier_dialog.dart';

// Flutter imports:

// Package imports:

class JpushMessageParse {
  final Map<String, dynamic> message;
  String? subTitle;
  String type = '0';
  JpushMessageParse(Map<String, dynamic> rawMessage)
      : message = Map<String, dynamic>.from(rawMessage);

  Future shot() async {
    subTitle = message['alert'];
    Map<dynamic, dynamic> rawExtras = message['extras'];
    String? androidExtra = rawExtras['cn.jpush.android.EXTRA'];
    if (androidExtra == null) {
      return;
    } else {
      Map<String, dynamic> _innerMap = jsonDecode(androidExtra);
      type = _innerMap['type'] ?? '0';
      switch (type) {
        case '1':
          await FireDialog.fireAlert(subTitle!);
          break;
        default:
      }
    }
  }

 
}
