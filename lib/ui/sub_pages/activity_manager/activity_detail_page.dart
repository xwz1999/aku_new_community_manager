import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/sub_pages/activity_manager/fake_activity_model.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';

class ActivityDetailPage extends StatefulWidget {
  final FakeActivityManagerModel model;
  ActivityDetailPage({Key key, @required this.model}) : super(key: key);

  @override
  _ActivityDetailPageState createState() => _ActivityDetailPageState();
}

class _ActivityDetailPageState extends State<ActivityDetailPage> {
  static const String format = 'yyyy年MM月dd日HH:mm';
  String get startDate =>
      DateUtil.formatDate(widget.model.dateStart, format: format);
  String get endDate =>
      DateUtil.formatDate(widget.model.dateEnd, format: format);
  String get checkInDate =>
      DateUtil.formatDate(widget.model.checkInDate, format: format);

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '活动详情',
      body: ListView(
        children: [
          Hero(
            tag: widget.model.title,
            child: Image.asset(
              widget.model.imgPath,
              height: 228.w,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 24.w,
              horizontal: 32.w,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.model.title,
                  style: TextStyle(
                    color: AppStyle.primaryTextColor,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AkuBox.h(16),
                Text(
                  widget.model.article,
                  style: TextStyle(
                    color: AppStyle.primaryTextColor,
                    fontSize: 28.sp,
                  ),
                ),
                AkuBox.h(40),
                _buildTile('开始时间', startDate),
                _buildTile('结束时间', endDate),
                _buildTile('地点', widget.model.location),
                _buildTile('参与人数', widget.model.people),
                _buildTile('报名截止', checkInDate),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildTile(String title, String subTitle) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.w),
      child: Row(
        children: [
          SizedBox(
            width: 164.w,
            child: Text(
              title,
              style: TextStyle(
                color: AppStyle.primaryTextColor,
                fontSize: 28.w,
              ),
            ),
          ),
          Expanded(
            child: Text(
              subTitle,
              style: TextStyle(
                color: AppStyle.primaryTextColor,
                fontSize: 28.w,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
