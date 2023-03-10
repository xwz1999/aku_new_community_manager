import 'package:aku_new_community_manager/models/manager/interview/interview_list_model.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/tools/aku_divider.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:aku_new_community_manager/tools/extensions/list_extension_tool.dart';

class InterviewDetailPage extends StatefulWidget {
  final InterviewListModel/*!*/ model;
  InterviewDetailPage({Key? key, required this.model}) : super(key: key);

  @override
  _InterviewDetailPageState createState() => _InterviewDetailPageState();
}

class _InterviewDetailPageState extends State<InterviewDetailPage> {
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '访谈详情',
      body: ListView(
        padding: EdgeInsets.all(32.w),
        children: [
          _interviewInfo(),
          24.w.heightBox,
          _contentWidget(),
        ],
      ),
    );
  }

  Widget _interviewInfo() {
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
            _rowTile(R.ASSETS_MANAGE_IC_RENWU_PNG, '客户电话',
                widget.model.tel!.text.size(24.sp).color(kTextSubColor).make()),
            _rowTile(
                R.ASSETS_OUTDOOR_IC_ADDRESS_PNG,
                '创建时间',
                widget.model.createDate!.text
                    .size(24.sp)
                    .color(kTextSubColor)
                    .make()),
            ...widget.model.interviewDate == null
                ? []
                : [
                    _rowTile(
                        R.ASSETS_MANAGE_IC_TIME_PNG,
                        '访谈时间',
                        widget.model.interviewDate!.text
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
                        widget.model.feedbackDate!.text
                            .size(24.sp)
                            .color(kTextSubColor)
                            .make()),
                  ],
          ].sepWidget(separate: 12.w.heightBox),
          // _getBottomButtons(widget.model.status),
        ],
      ),
    );
  }

  Widget _contentWidget() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
      padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              '访谈内容'.text.size(32.sp).color(kTextPrimaryColor).bold.make(),
              Spacer(),
            ],
          ),
          16.w.heightBox,
          AkuDivider.horizontal(),
          20.w.heightBox,
          widget.model.content!.text.size(28.sp).color(kTextPrimaryColor).make(),
          40.w.heightBox,
          Row(
            children: [
              Spacer(),
              widget.model.interviewDate!.text
                  .size(24.sp)
                  .color(kTextSubColor)
                  .make(),
            ],
          ),
          ...widget.model.feedbackContent == null
              ? []
              : [
                  16.w.heightBox,
                  AkuDivider.horizontal(),
                  20.w.heightBox,
                  Row(
                    children: [
                      '访谈回复'
                          .text
                          .size(32.sp)
                          .color(kTextPrimaryColor)
                          .bold
                          .make(),
                      Spacer(),
                    ],
                  ),
                  12.w.heightBox,
                  widget.model.feedbackContent!.text
                      .size(28.sp)
                      .color(kTextPrimaryColor)
                      .make(),
                  20.w.heightBox,
                  Row(
                    children: [
                      Spacer(),
                      widget.model.feedbackDate!.text
                          .size(24.sp)
                          .color(kTextSubColor)
                          .make(),
                    ],
                  ),
                ]
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
