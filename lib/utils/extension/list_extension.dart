import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SeparateExt on List<Widget> {
  List<Widget> sepWidget({Widget separate}) {
    if (this == null) return null;
    if (this.isEmpty) return [];
    return List.generate(this.length * 2 - 1, (index) {
      if (index.isEven)
        return this[index ~/ 2];
      else
        return separate ?? 10.w.heightBox;
    });
  }
}