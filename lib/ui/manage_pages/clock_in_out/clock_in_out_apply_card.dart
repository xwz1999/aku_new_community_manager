import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/aku_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:aku_community_manager/tools/extensions/list_extension_tool.dart';

class ClockInOutApplyCard extends StatefulWidget {
  ClockInOutApplyCard({Key key}) : super(key: key);

  @override
  _ClockInOutApplyCardState createState() => _ClockInOutApplyCardState();
}

class _ClockInOutApplyCardState extends State<ClockInOutApplyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              'Name'.text.size(32.sp).color(kTextPrimaryColor).bold.make(),
              Spacer(),
              '待审核'.text.size(28.sp).bold.color(kPrimaryColor).make()
            ],
          ),
          16.w.heightBox,
          AkuDivider.horizontal(),
          24.w.heightBox,
          ...<Widget>[
            _rowTile(
                R.ASSETS_MANAGE_IC_RENWU_PNG,
                '开始时间',
                '2021-05-19 10:00:00'
                    .text
                    .size(24.sp)
                    .color(kTextSubColor)
                    .make()),
            _rowTile(
                R.ASSETS_MANAGE_LOCK_PNG,
                '结束时间',
                '2021-05-19 10:00:00'
                    .text
                    .size(24.sp)
                    .color(kTextSubColor)
                    .make()),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 40.w,
                      height: 40.w,
                      child: Image.asset(R.ASSETS_MANAGE_IC_RENWU_PNG),
                    ),
                    12.w.widthBox,
                    '申请备注'.text.size(24.sp).color(kTextSubColor).make(),
                  ],
                ),
                160.w.widthBox,
                Row(
                  children: [
                    '弟弟结婚，需要回趟家帮忙张罗婚礼的筹备'
                        .text
                        .size(24.sp)
                        .maxLines(2)
                        .overflow(TextOverflow.ellipsis)
                        .align(TextAlign.end)
                        .color(kTextSubColor)
                        .make().expand()
                  ],
                ).expand()
              ],
            ),
            _rowTile(
                R.ASSETS_MANAGE_LOCK_PNG,
                '申请时间',
                '2021-05-19 10:00:00'
                    .text
                    .size(24.sp)
                    .color(kTextSubColor)
                    .make()),
          ].sepWidget(separate: 12.w.heightBox),
        ],
      ),
    );
  }

  Widget _rowTile(String iconPath, String title, Widget content) {
    return Row(
      children: [
        SizedBox(
          width: 40.w,
          height: 40.w,
          child: Image.asset(iconPath),
        ),
        12.w.widthBox,
        title.text.size(24.sp).color(kTextSubColor).make(),
        Spacer(),
        content,
      ],
    );
  }
}
