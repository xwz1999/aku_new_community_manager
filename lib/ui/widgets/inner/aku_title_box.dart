// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/tools/screen_tool.dart';
import 'package:aku_new_community_manager/tools/widget_tool.dart';

class AkuTitleBox extends StatelessWidget {
  final String title;
  final Widget? suffix;
  final double spacing;
  final List<Widget>? children;
  const AkuTitleBox({
    Key? key,
    /*required*/ required this.title,
    this.suffix,
    this.spacing = 0,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppStyle.primaryTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 36.sp,
                ),
              ),
              Spacer(),
              suffix ?? SizedBox(),
            ],
          ),
          AkuBox.h(spacing),
          ...children!,
        ],
      ),
    );
  }
}
