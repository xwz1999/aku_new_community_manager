import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/models/manager/interview/interview_list_model.dart';
import 'package:aku_new_community_manager/saas_models/net_model/base_model.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/tools/aku_divider.dart';
import 'package:aku_new_community_manager/tools/extensions/list_extension_tool.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/src/extensions/num_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';

class InterviewFeedBackPage extends StatefulWidget {
  final InterviewListModel model;
  InterviewFeedBackPage({Key? key, required this.model}) : super(key: key);

  @override
  _InterviewFeedBackPageState createState() => _InterviewFeedBackPageState();
}

class _InterviewFeedBackPageState extends State<InterviewFeedBackPage> {
  TextEditingController? _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '访谈回复',
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
        children: [
          _interviewInfo(),
          24.w.heightBox,
          _feedBackWidget(),
        ],
      ),
      bottom: AkuBottomButton(
        title: '立即回复',
        onTap: () async {
          BaseModel baseModel = await NetUtil().post(
            API.manage.interviewFeedBack,
            params: {
              "id": widget.model.id,
              "feedbackContent": _textEditingController!.text,
            },
            showMessage: true,
          );
          if (baseModel.success) {
            Get.back();
          }
        },
      ),
    );
  }

  Widget _feedBackWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              '访谈回复'.text.size(32.sp).color(kTextPrimaryColor).bold.make(),
              Spacer(),
            ],
          ),
          16.w.heightBox,
          _inputWidget(_textEditingController, hintText: '请输入回复内容'),
        ],
      ),
    );
  }

  Widget _inputWidget(
    TextEditingController? controller, {
    String? hintText,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        border: Border.all(
          width: 2.w,
          color: Color(0xFFE8E8E8),
        ),
      ),
      child: TextField(
        minLines: 5,
        maxLines: 10,
        autofocus: false,
        controller: controller,
        onChanged: (value) {
          setState(() {});
        },
        decoration: InputDecoration(
          hintText: hintText ?? '',
          hintStyle: TextStyle(
            fontSize: 28.sp,
            color: kTextSubColor,
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 16.w, horizontal: 24.w),
          border: InputBorder.none,
          isDense: true,
        ),
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
