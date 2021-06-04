// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AkuDivider extends StatelessWidget {
  final double? thickness;
  final bool? isHorizontal;
  final double? indent;
  final double? endIndent;
  final Color? color;
  const AkuDivider(
      {Key? key,
      this.isHorizontal,
      this.indent,
      this.endIndent,
      this.thickness,
      this.color})
      : super(key: key);

  AkuDivider.horizontal({Key? key, this.indent, this.endIndent})
      : isHorizontal = true,
        thickness = 1.w,
        color = Color(0xFFE8E8E8),
        super(key: key);
  AkuDivider.vertical({Key? key, this.indent, this.endIndent})
      : isHorizontal = false,
        thickness = 1.w,
        color = Color(0xFFE8E8E8),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return isHorizontal!
        ? Divider(
            height: 0,
            thickness: this.thickness ?? 1.w,
            indent: this.indent ?? 0,
            endIndent: this.endIndent ?? 0,
            color: this.color ?? Color(0xFFE8E8E8),
          )
        : VerticalDivider(
            width: 0,
            thickness: this.thickness ?? 1.w,
            indent: this.indent ?? 0,
            endIndent: this.endIndent ?? 0,
            color: this.color ?? Color(0xFFE8E8E8),
          );
  }
}
