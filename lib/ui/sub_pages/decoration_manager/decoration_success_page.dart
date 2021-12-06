// Flutter imports:
import 'package:aku_new_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

// Project imports:
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/tools/widget_tool.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';

class DecorationSuccessPage extends StatefulWidget {
  DecorationSuccessPage({Key? key}) : super(key: key);

  @override
  _DecorationSuccessPageState createState() => _DecorationSuccessPageState();
}

class _DecorationSuccessPageState extends State<DecorationSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '跟踪检查',
      backgroundColor: Color(0xFFF9F9F9),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100.w,
              width: 100.w,
              child: Placeholder(),
            ),
            Text(
              '提交成功',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppStyle.primaryTextColor,
                fontSize: 40.sp,
              ),
            ),
            Text(
              '你的装修跟踪检查记录已提交',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppStyle.minorTextColor,
                fontSize: 26.sp,
              ),
            ),
            AkuBox.h(80),
            AkuMaterialButton(
              height: 88.w,
              minWidth: 280.w,
              radius: 8.w,
              onPressed: () {
                Get.back();
                Get.back();
              },
              color: AppStyle.primaryColor,
              child: Text(
                '查看',
                style: TextStyle(
                  color: AppStyle.primaryTextColor,
                  fontSize: 32.w,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
