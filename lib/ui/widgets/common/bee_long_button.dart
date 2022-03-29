import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';

class BeeLongButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color backColor;
  final BorderSide border;

  const BeeLongButton({Key? key, required this.onPressed, required this.text})
      : backColor = kPrimaryColor,
        border = BorderSide.none,
        super(key: key);

  BeeLongButton.white({Key? key, required this.onPressed, required this.text})
      : backColor = Colors.white,
        border = BorderSide(color: Colors.black.withOpacity(0.45)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: 93.w,
      disabledColor: Colors.black.withOpacity(0.06),
      disabledTextColor: Colors.black.withOpacity(0.25),
      textColor: Colors.black.withOpacity(0.85),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(65.w), side: border),
      color: backColor,
      onPressed: onPressed,
      child: text.text.size(32.sp).bold.make(),
    );
  }
}
