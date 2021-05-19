// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:common_utils/common_utils.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

// Project imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/activity_detail_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';

class ActivityDetailPage extends StatefulWidget {
  final int id;
  ActivityDetailPage({Key key, @required this.id}) : super(key: key);

  @override
  _ActivityDetailPageState createState() => _ActivityDetailPageState();
}

class _ActivityDetailPageState extends State<ActivityDetailPage> {
  static const String format = 'yyyy年MM月dd日HH:mm';
  ActivityDetailModel _detailModel;
  String get startDate =>
      DateUtil.formatDate(_detailModel.activityStart, format: format);
  String get endDate =>
      DateUtil.formatDate(_detailModel.activityEnd, format: format);
  String get checkInDate =>
      DateUtil.formatDate(_detailModel.registrationEnd, format: format);

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '活动详情',
      body: EasyRefresh(
        firstRefresh: true,
        header: MaterialHeader(),
        onRefresh: () async {
          BaseModel model = await NetUtil().get(
            API.manage.activityDetail,
            params: {'activityId': widget.id},
          );
          _detailModel = ActivityDetailModel.fromJson(model.data);
          setState(() {});
        },
        child: _detailModel == null
            ? SizedBox()
            : ListView(
                children: [
                  FadeInImage.assetNetwork(
                    placeholder: R.ASSETS_PLACEHOLDER_WEBP,
                    image: API.image(_detailModel.firstImg?.url ?? ''),
                    fit: BoxFit.cover,
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
                          _detailModel.title,
                          style: TextStyle(
                            color: AppStyle.primaryTextColor,
                            fontSize: 36.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        AkuBox.h(16),
                        Text(
                          _detailModel.content,
                          style: TextStyle(
                            color: AppStyle.primaryTextColor,
                            fontSize: 28.sp,
                          ),
                        ),
                        AkuBox.h(40),
                        _buildTile('开始时间', startDate),
                        _buildTile('结束时间', endDate),
                        _buildTile('地点', _detailModel.location),
                        _buildTile('参与人数', '不限'),
                        _buildTile('报名截止', checkInDate),
                      ],
                    ),
                  ),
                ],
              ),
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
