import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:flutter/material.dart';

import 'bee_divider.dart';

class BeePickerBox extends StatelessWidget {
  final VoidCallback? onPressed;
  final String confirmString;
  final String? title;
  final Widget child;

  const BeePickerBox(
      {Key? key,
      this.onPressed,
      this.confirmString = '完成',
      this.title,
      required this.child})
      : super(key: key);

  _buildButton({
    required String title,
    required VoidCallback? onPressed,
  }) {
    return SizedBox(
      // height: 48.w,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(color: Colors.black.withOpacity(0.85)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SizedBox(
        height: 650.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 88.w,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      '取消',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28.sp,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(25.w),
                    child: Text(
                      title ?? '',
                      style: TextStyle(
                        color: kTextPrimaryColor,
                        fontSize: 28.sp,
                      ),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: onPressed,
                    child: Text(
                      '${confirmString}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BeeDivider.horizontal(),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
