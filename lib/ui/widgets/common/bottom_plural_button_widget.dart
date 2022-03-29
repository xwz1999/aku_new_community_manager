import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:flutter/material.dart';

class BottomPluralButtonWidget extends StatelessWidget {
  const BottomPluralButtonWidget({
    Key? key,
    required this.onLeftTap,
    required this.onRightTap,
    required this.leftTitle,
    required this.rightTitle,
    this.padding = false,
  }) : super(key: key);
  final VoidCallback onLeftTap;
  final VoidCallback onRightTap;
  final String leftTitle;
  final String rightTitle;
  final bool padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding
          ? EdgeInsets.only(
              left: 32.w,
              top: 32.w,
              bottom: 32.w + MediaQuery.of(context).padding.bottom,
              right: 32.w)
          : EdgeInsets.zero,
      color: padding ? Colors.white : Colors.transparent,
      child: Row(
        children: [
          MaterialButton(
            onPressed: onLeftTap,
            minWidth: 330.w,
            height: 80.w,
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.w),
              side: BorderSide(color: Colors.black.withOpacity(0.25)),
            ),
            child: Text(
              leftTitle,
              style: TextStyle(
                  fontSize: 28.sp, color: Colors.black.withOpacity(0.65)),
            ),
          ),
          Spacer(),
          MaterialButton(
            onPressed: onRightTap,
            minWidth: 330.w,
            height: 80.w,
            elevation: 0,
            color: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.w),
            ),
            child: Text(
              rightTitle,
              style: TextStyle(
                  fontSize: 28.sp, color: Colors.black.withOpacity(0.85)),
            ),
          )
        ],
      ),
    );
  }
}
