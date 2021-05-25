import 'package:aku_community_manager/models/manager/interview/interview_list_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/aku_divider.dart';
import 'package:aku_community_manager/ui/manage_pages/interview/interview_detail_page.dart';
import 'package:aku_community_manager/ui/manage_pages/interview/interview_feedback_page.dart';
import 'package:aku_ui/aku_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:aku_community_manager/tools/extensions/list_extension_tool.dart';

class InterviewCard extends StatefulWidget {
  final InterviewListModel model;
  InterviewCard({Key key, this.model}) : super(key: key);

  @override
  _InterviewCardState createState() => _InterviewCardState();
}

class _InterviewCardState extends State<InterviewCard> {
  @override
  Widget build(BuildContext context) {
    return AkuButton(
      onPressed: () {
        Get.to(() => InterviewDetailPage(
              model: widget.model,
            ));
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                '访谈信息'.text.size(32.sp).color(kTextPrimaryColor).bold.make(),
                Spacer(),
                widget.model.statusString.text
                    .size(28.sp)
                    .bold
                    .color(widget.model.statusColor)
                    .make()
              ],
            ),
            16.w.heightBox,
            AkuDivider.horizontal(),
            24.w.heightBox,
            ...<Widget>[
              _rowTile(
                  R.ASSETS_MANAGE_IC_RENWU_PNG,
                  '客户姓名',
                  '${widget.model.name}'
                      .text
                      .size(24.sp)
                      .color(kTextSubColor)
                      .make()),
              _rowTile(
                  R.ASSETS_MANAGE_IC_RENWU_PNG,
                  '客户电话',
                  widget.model.tel.text
                      .size(24.sp)
                      .color(kTextSubColor)
                      .make()),
              _rowTile(
                  R.ASSETS_MANAGE_IC_TIME_PNG,
                  '创建时间',
                  widget.model.createDate.text
                      .size(24.sp)
                      .color(kTextSubColor)
                      .make()),
              ...widget.model.interviewDate == null
                  ? []
                  : [
                      _rowTile(
                          R.ASSETS_MANAGE_IC_TIME_PNG,
                          '访谈时间',
                          widget.model.interviewDate.text
                              .size(24.sp)
                              .color(kTextSubColor)
                              .make()),
                    ],
              ...widget.model.feedbackDate == null
                  ? []
                  : [
                      _rowTile(
                          R.ASSETS_MANAGE_IC_TIME_PNG,
                          '回复时间',
                          widget.model.feedbackDate.text
                              .size(24.sp)
                              .color(kTextSubColor)
                              .make()),
                    ],
            ].sepWidget(separate: 12.w.heightBox),
            _getBottomButtons(widget.model.status),
          ],
        ),
      ),
    );
  }

  Widget _getBottomButtons(int status) {
    MaterialButton button;
    switch (status) {
      case 1:
        button = _bottomButton('访谈回复', () async {
          await Get.to(() => InterviewFeedBackPage(
                model: widget.model,
              ));
        }, Color(0xFFFFC40C), Colors.black);
        break;
      case 2:
        button = null;
        break;
      default:
        return null;
    }
    return button == null
        ? SizedBox()
        : Padding(
            padding: EdgeInsets.only(top: 40.w),
            child: Row(
              children: [
                Spacer(),
                button,
              ],
            ),
          );
  }

  Widget _bottomButton(
      String title, Function onPressed, Color color, Color textColor,
      {bool hasBorder = false}) {
    return MaterialButton(
      height: 52.w,
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 24.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(74.w),
        side: !hasBorder ? BorderSide.none : BorderSide(color: Colors.black),
      ),
      color: color,
      onPressed: onPressed,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      child: title.text.size(26.sp).color(textColor).make(),
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
