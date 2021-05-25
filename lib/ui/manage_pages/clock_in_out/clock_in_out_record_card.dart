import 'package:aku_community_manager/models/manager/clock_in_out/clock_record_list_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class ClockInOutRecordCard extends StatefulWidget {
  final ClockRecordListModel model;
  ClockInOutRecordCard({Key key, this.model}) : super(key: key);

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
              widget.model.clockDateString.text
                  .size(28.sp)
                  .bold
                  .color(kTextPrimaryColor)
                  .bold
                  .make(),
              Spacer(),
              widget.model.weekDay.text
                  .size(32.sp)
                  .bold
                  .color(kTextPrimaryColor)
                  .make(),
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
                          color: widget.model.startClockDate == null
                              ? Color(0xFFE60E0E)
                              : Color(0xFF3F8FFE),
                          borderRadius: BorderRadius.circular(8.w),
                        ),
                      ),
                      8.w.widthBox,
                      (widget.model.startClockDate == null ? '上班未打卡' : '上班打卡时间')
                          .text
                          .size(28.sp)
                          .color(kTextPrimaryColor)
                          .bold
                          .make(),
                    ],
                  ),
                  ...widget.model.startClockDate == null
                      ? []
                      : [
                          16.w.heightBox,
                          Row(
                            children: [
                              24.w.widthBox,
                              (widget.model.startClockString)
                                  .text
                                  .size(32.sp)
                                  .color(kTextPrimaryColor)
                                  .bold
                                  .make(),
                            ],
                          ),
                        ]
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
                          color: widget.model.startClockDate == null
                              ? Color(0xFFE60E0E)
                              : Color(0xFF3F8FFE),
                          borderRadius: BorderRadius.circular(8.w),
                        ),
                      ),
                      8.w.widthBox,
                      (widget.model.startClockDate == null ? '下班未打卡' : '下班打卡时间')
                          .text
                          .size(28.sp)
                          .color(kTextPrimaryColor)
                          .bold
                          .make(),
                    ],
                  ),
                  ...widget.model.startClockDate == null
                      ? []
                      : [
                          16.w.heightBox,
                          Row(
                            children: [
                              24.w.widthBox,
                              widget.model.endClockString.text
                                  .size(32.sp)
                                  .color(kTextPrimaryColor)
                                  .bold
                                  .make(),
                            ],
                          ),
                        ]
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
