import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//自定义分割线
class AkuDiveder  {
    final bool isReverse;//颜色方向反转
    const AkuDiveder({Key key,this.isReverse=false});
  Widget verticalDivider(double height) {
    return Container(
      width: 1.w,
      height: height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isReverse
                  ? [
                      Color(0xFFE8E8E8),
                      Color(0xFFFFFFFF),
                    ]
                  : [
                      Color(0xFFFFFFFF),
                      Color(0xFFE8E8E8),
                    ])),
    );
  }
  Widget horizontalDivider(double width) {
    return Container(
      width: width,
      height: 1.w,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: isReverse
                  ? [
                      Color(0xFFE8E8E8),
                      Color(0xFFFFFFFF),
                    ]
                  : [
                      Color(0xFFFFFFFF),
                      Color(0xFFE8E8E8),
                    ])),
    );
  }
}
