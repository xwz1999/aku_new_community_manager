// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:aku_community_manager/style/app_style.dart';

class AkuChipBox extends StatelessWidget {
  final String title;
  const AkuChipBox({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: TextStyle(
          color: AppStyle.secondaryColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 6.w, horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.w),
        border: Border.all(width: 2.w, color: AppStyle.secondaryColor),
      ),
    );
  }
}
