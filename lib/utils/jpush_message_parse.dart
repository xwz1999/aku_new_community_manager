// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

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
          await fireAlert(subTitle!);
          break;
        default:
      }
    }
  }

  Future fireAlert(String subTitle) async {
    await Get.dialog(
      CupertinoAlertDialog(
        title: Text('发现火灾！请立刻组织疏散人群！'),
        content: Column(
          children: [
            Text(subTitle),
            10.w.heightBox,
            Icon(
              CupertinoIcons.bell_fill,
              color: Colors.red,
              size: 48.w,
            ),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            child: Text('确认'),
            onPressed: () => Get.back(),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
