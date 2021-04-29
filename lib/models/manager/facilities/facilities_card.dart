import 'package:aku_community_manager/models/manager/facilities/facilities_map.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class FacilitiesCard extends StatefulWidget {
  FacilitiesCard({Key key}) : super(key: key);

  @override
  _FacilitiesCardState createState() => _FacilitiesCardState();
}

class _FacilitiesCardState extends State<FacilitiesCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            '户外2号篮球场'.text.color(kTextPrimaryColor).size(32.sp).bold.make(),
            Spacer(),
            '待检查'
                .text
                .color(FacilitiesMap.insepectColor[0])
                .size(28.sp)
                .bold
                .make(),
          ],
        ),
      ],
    )
        .box
        .width(double.infinity)
        .withRounded(value: 8.w)
        .color(Colors.white)
        .padding(EdgeInsets.all(24.w))
        .make();
  }
}
