import 'package:aku_community_manager/models/manager/house_keeping/house_keeping_list_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/aku_divider.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:aku_community_manager/tools/extensions/list_extension_tool.dart';

class HouseKeepingDetailPage extends StatefulWidget {
  final HouseKeepingListModel model;
  HouseKeepingDetailPage({Key key, this.model}) : super(key: key);

  @override
  _HouseKeepingDetailPageState createState() => _HouseKeepingDetailPageState();
}

class _HouseKeepingDetailPageState extends State<HouseKeepingDetailPage> {
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '服务详情',
      body: ListView(
        padding: EdgeInsets.all(32.w),
        children: [
          _interviewInfo(),
          20.w.heightBox,
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
              '家政服务'.text.size(32.sp).color(kTextPrimaryColor).bold.make(),
              Spacer(),
            ],
          ),
          16.w.heightBox,
          AkuDivider.horizontal(),
          24.w.heightBox,
          ...<Widget>[
            _rowTile(
                R.ASSETS_MANAGE_IC_RENWU_PNG,
                '房产名称',
                widget.model.roomName.text
                    .size(24.sp)
                    .color(kTextSubColor)
                    .make()),
            _rowTile(
                R.ASSETS_MANAGE_IC_RENWU_PNG,
                '人数',
                widget.model.num
                    .toString()
                    .text
                    .size(24.sp)
                    .color(kTextSubColor)
                    .make()),
            _rowTile(
                R.ASSETS_MANAGE_IC_RENWU_PNG,
                '负责人姓名',
                widget.model.leaderName.text
                    .size(24.sp)
                    .color(kTextSubColor)
                    .make()),
            _rowTile(
                R.ASSETS_MESSAGE_IC_PHONE_PNG,
                '负责人手机',
                widget.model.leaderTel.text
                    .size(24.sp)
                    .color(kTextSubColor)
                    .make()),
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
          widget.model.content.text.size(28.sp).color(kTextPrimaryColor).make(),
          40.w.heightBox,
          Row(
            children: [
              Spacer(),
              widget.model.createDate.text
                  .size(24.sp)
                  .color(kTextSubColor)
                  .make(),
            ],
          ),
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
