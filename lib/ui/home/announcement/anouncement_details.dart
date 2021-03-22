// Flutter imports:
import 'package:aku_community_manager/models/announce/announcement_detail_model.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

class AnouncementDetails extends StatelessWidget {
  final AnnouncementDetailModel model;
  const AnouncementDetails({
    Key key,
    @required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '活动详情',
      body: Container(
        color: Color(0xFFFFFFFF),
        padding: EdgeInsets.only(top: 24.w, left: 33.w, right: 33.w),
        width: double.infinity,
        height: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                model.title,
                style: AppStyle().barTitleStyle,
              ),
              SizedBox(
                height: 16.w,
              ),
              Text(model.content,
                  style: TextStyle(
                      color: AppStyle.primaryTextColor, fontSize: 28.sp)),
              SizedBox(
                height: 120.w,
              ),
              Row(
                children: [
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('深圳永成物业有限公司', style: AppStyle().primaryStyle),
                      SizedBox(
                        height: 4.w,
                      ),
                      Text(model.releaseTime, style: AppStyle().primaryStyle),
                    ],
                  ),
                  SizedBox(
                    width: 56.w - 31.w,
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
