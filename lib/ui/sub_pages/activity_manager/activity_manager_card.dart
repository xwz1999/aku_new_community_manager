import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/sub_pages/activity_manager/activity_detail_page.dart';
import 'package:aku_community_manager/ui/sub_pages/activity_manager/fake_activity_model.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:get/route_manager.dart';

class ActivityManagerCard extends StatelessWidget {
  String get startDate =>
      DateUtil.formatDate(model.dateStart, format: 'yyyy-MM-dd');

  String get endDate =>
      DateUtil.formatDate(model.dateEnd, format: 'yyyy-MM-dd');

  final FakeActivityManagerModel model;
  const ActivityManagerCard({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
      child: GestureDetector(
        onTap: () {
          Get.to(ActivityDetailPage(model: model));
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.w)),
              child: Container(
                height: 228.w,
                width: double.infinity,
                child: Hero(
                  tag: model.title,
                  child: Image.asset(
                    model.imgPath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    style: TextStyle(
                      color: AppStyle.primaryTextColor,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AkuBox.h(12),
                  _buildTile('主办方:', model.hostName),
                  _buildTile('地点:', model.location),
                  _buildTile('报名时间:', '$startDate\至$endDate'),
                ],
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
        border: Border.all(
          color: Color(0xFFE8E8E8),
          width: 2.w,
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2.w),
            blurRadius: 20.w,
            color: Color(0xFFEFEFEF),
          )
        ],
      ),
    );
  }

  _buildTile(String title, String subTitle) {
    return Row(
      children: [
        SizedBox(
          width: 120.w,
          child: Text(
            title,
            style: TextStyle(
              color: AppStyle.minorTextColor,
              fontSize: 24.sp,
            ),
          ),
        ),
        Expanded(
          child: Text(
            subTitle,
            style: TextStyle(
              color: AppStyle.primaryTextColor,
              fontSize: 24.sp,
            ),
          ),
        ),
      ],
    );
  }
}
