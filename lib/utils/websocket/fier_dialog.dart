
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class FireDialog {
  static  Future fireAlert(String subTitle) async {
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