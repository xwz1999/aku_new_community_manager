// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:aku_community_manager/mock_models/decoration/decoration_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';

class DecorationCheckCardWidget extends StatelessWidget {
  final CHECK_TYPE type;
  final bool checked;
  const DecorationCheckCardWidget(
      {Key key, @required this.type, this.checked = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.w,
      width: 124.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            checkAssetMap[type],
            height: 56.w,
            width: 56.w,
          ),
          AkuBox.h(4),
          Text(
            checkTypeMap[type],
            style: TextStyle(
              color: AppStyle.primaryTextColor,
              fontSize: 24.sp,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: checked ? AppStyle.primaryTextColor : Color(0xFFE8E8E8),
          width: 3.w,
        ),
        borderRadius: BorderRadius.circular(8.w),
        color: checked ? Color(0xFFFFF3CC) : Colors.white,
      ),
    );
  }
}
