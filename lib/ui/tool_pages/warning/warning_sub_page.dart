// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/tool_pages/warning/warning_detail_page.dart';
import 'package:aku_community_manager/ui/tool_pages/warning/warning_success.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

class WarningSubPage extends StatefulWidget {
  WarningSubPage({Key key}) : super(key: key);

  @override
  _WarningSubPageState createState() => _WarningSubPageState();
}

class _WarningSubPageState extends State<WarningSubPage> {
  Timer _timer;
  Timer _countTimer;
  int _count = 3;
  @override
  void dispose() {
    _timer?.cancel();
    _countTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '一键报警',
      actions: [
        AkuMaterialButton(
          onPressed: () {
            Get.to(WarningDetailPage());
          },
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Text('功能说明'),
        )
      ],
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTapDown: (detail) {
                    BotToast.showText(text: _count.toString());
                    _countTimer = Timer.periodic(Duration(seconds: 1), (timer) {
                      _count--;
                      BotToast.showText(text: _count.toString());
                    });
                    _timer = Timer(Duration(seconds: 3), () {
                      Get.off(WarningSuccess());
                    });
                  },
                  onTapCancel: () {
                    _count = 3;
                    _timer?.cancel();
                  },
                  onTapUp: (detail) {
                    _count = 3;
                    _timer?.cancel();
                  },
                  child: Image.asset(
                    R.ASSETS_MANAGE_WARNING_PNG,
                    height: 420.w,
                    width: 420.w,
                  ),
                ),
              ],
            ),
            Text(
              '深圳华悦茂峰',
              style: TextStyle(
                fontSize: 44.w,
                color: AppStyle.primaryTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            AkuBox.h(8),
            Text(
              '请长按上方进行报警',
              style: TextStyle(
                fontSize: 30.w,
                color: AppStyle.minorTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
