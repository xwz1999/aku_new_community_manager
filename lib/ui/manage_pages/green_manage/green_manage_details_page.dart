// Flutter imports:
import 'package:aku_community_manager/models/manager/green_manage/green_manage_list_model.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_button.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

class GreenManageDetailsPage extends StatelessWidget {

  final GreenManageListModel cardModel;

  GreenManageDetailsPage(this.cardModel);

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '详情',
      body: Column(
        children: [
          AkuBox.h(16),
          AkuButton(
            onPressed: () {},
            child: Container(
              height: 302.w,
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 32.w,
                right: 32.w,
                bottom: 40.w,
              ),
              color: Color(0xFFFFFFFF),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 93.w,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      cardModel.greenAreaName!,
                      style: TextStyle(
                          color: AppStyle.primaryTextColor,
                          fontSize: 32.w,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Divider(
                  //   height: 1.w,
                  // ),
                  AkuBox.h(24),
                  Row(
                    children: [
                      Image.asset(
                        R.ASSETS_MANAGE_IC_RENWU_PNG,
                        width: 40.w,
                        height: 40.w,
                      ),
                      AkuBox.w(4),
                      Text('任务概要',
                          style: TextStyle(
                            color: AppStyle.primaryTextColor,
                            fontSize: 28.sp,
                          )),
                      Spacer(),
                      Text(
                        cardModel.content!,
                        style: AppStyle().primaryStyle,
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Image.asset(
                        R.ASSETS_MANAGE_IC_TIME_PNG,
                        width: 40.w,
                        height: 40.w,
                      ),
                      AkuBox.w(4),
                      Text('时间期限',
                          style: TextStyle(
                              color: AppStyle.primaryTextColor,
                              fontSize: 28.sp)),
                      Spacer(),
                      Text(
                        '${cardModel.createDateString}至${cardModel.endDateString}',
                        style: AppStyle().primaryStyle,
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Image.asset(
                        R.ASSETS_MESSAGE_IC_PEOPLE_PNG,
                        width: 40.w,
                        height: 40.w,
                      ),
                      AkuBox.w(4),
                      Text('负责人员',
                          style: TextStyle(
                            color: AppStyle.primaryTextColor,
                            fontSize: 28.sp,
                          )),
                      Spacer(),
                      Text(
                        cardModel.directorName!,
                        style: AppStyle().primaryStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          AkuBox.h(16),
          Expanded(
              child: Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            color: Color(0xFFFFFFFF),
            padding: EdgeInsets.only(top: 16.w, left: 32.w, right: 32.w),
            child: Column(
              children: [
                Text('详细描述',
                    style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontSize: 32.w,
                        fontWeight: FontWeight.bold)),
                AkuBox.h(16),
                Text(
                  cardModel.content!,
                  style: TextStyle(
                      color: AppStyle.primaryTextColor, fontSize: 28.w),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
