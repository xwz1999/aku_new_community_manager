import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

export 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {
  //颜色，渐变主颜色和次级颜色
  static const primaryColor = Color(0xFFFDCF12);
  static const minorColor = Color(0xFFFFDF5D);
  static const secondaryColor = Color(0xFF3F8FFE);

  //字体
  ///主字体颜色
  static const primaryTextColor = Color(0xFF333333);

  ///次字体颜色
  static const minorTextColor = Color(0xFF999999);

  ///背景色
  static const backgroundColor = Color(0xFFF9F9F9);

  ///成功色
  static const successColor = Color(0xFF32B814);

  static const subSuccessColor = Color(0xFFE5FFDF);

  ///失败色
  static const failColor = Color(0xFFFF4501);

  static const subFailColor = Color(0xFFFFE5DB);

  ///字体格式
  final barTitleStyle = TextStyle(
    color: primaryTextColor,
    fontSize: 36.sp,
    fontWeight: FontWeight.bold,
  );
  final primaryStyle = TextStyle(
      color: primaryTextColor, fontSize: 28.sp, fontWeight: FontWeight.bold);
  final minorStyle = TextStyle(
      color: minorTextColor, fontSize: 24.sp, fontWeight: FontWeight.normal);
  final secondaryTextStyle = TextStyle(
      color: AppStyle.minorTextColor,
      fontSize: 28.sp,
      fontWeight: FontWeight.normal);
}
