import 'package:aku_community_manager/style/app_style.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class ClockInOutRecordCard extends StatefulWidget {
  ClockInOutRecordCard({Key key}) : super(key: key);

  @override
  _ClockInOutRecordCardState createState() => _ClockInOutRecordCardState();
}

class _ClockInOutRecordCardState extends State<ClockInOutRecordCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              '2021.05.19'
                  .text
                  .size(28.sp)
                  .bold
                  .color(kTextPrimaryColor)
                  .bold
                  .make(),
              Spacer(),
              '周三'.text.size(32.sp).bold.color(kTextPrimaryColor).make(),
            ],
          ),
          40.w.heightBox,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 16.w,
                        height: 16.w,
                        decoration: BoxDecoration(
                          color: Color(0xFF3F8FFE),
                          borderRadius: BorderRadius.circular(8.w),
                        ),
                      ),
                      8.w.widthBox,
                      '上班打卡时间'
                          .text
                          .size(28.sp)
                          .color(kTextPrimaryColor)
                          .bold
                          .make(),
                    ],
                  ),
                  16.w.heightBox,
                  Row(
                    children: [
                      24.w.widthBox,
                      (DateUtil.formatDateStr('2020-10-11 08:24:30',
                              format: 'HH:mm:ss'))
                          .text
                          .size(32.sp)
                          .color(kTextPrimaryColor)
                          .bold
                          .make(),
                    ],
                  ),
                ],
              ),
              130.w.widthBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 16.w,
                        height: 16.w,
                        decoration: BoxDecoration(
                          color: Color(0xFF3F8FFE),
                          borderRadius: BorderRadius.circular(8.w),
                        ),
                      ),
                      8.w.widthBox,
                      '下班打卡时间'
                          .text
                          .size(28.sp)
                          .color(kTextPrimaryColor)
                          .bold
                          .make(),
                    ],
                  ),
                  16.w.heightBox,
                  Row(
                    children: [
                      24.w.widthBox,
                      DateUtil.formatDateStr('08:24:09', format: 'HH:mm:ss')
                          .text
                          .size(32.sp)
                          .color(kTextPrimaryColor)
                          .bold
                          .make(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
