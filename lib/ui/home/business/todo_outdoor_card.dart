// Flutter imports:
// Project imports:
import 'package:aku_new_community_manager/models/todo_bussiness/todo_outdoor_model.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/tools/user_tool.dart';
import 'package:aku_new_community_manager/ui/sub_pages/items_outdoor/items_outdoor_details_page.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ToDoOutDoorCard extends StatefulWidget {
  final ToDoOutDoorModel model;
  final VoidCallback? callRefresh;
  final bool homeDisplay;
  ToDoOutDoorCard(
      {Key? key,
      required this.model,
      this.callRefresh,
      this.homeDisplay = false})
      : super(key: key);

  @override
  _ToDoOutDoorCardState createState() => _ToDoOutDoorCardState();
}

class _ToDoOutDoorCardState extends State<ToDoOutDoorCard> {
  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle =
        TextStyle(color: AppStyle.minorTextColor, fontSize: 28.sp);
    return GestureDetector(
      onTap: () async {
        await Get.to(ItemsOutdoorDetailsPage(id: widget.model.id!));
        if (widget.callRefresh != null) {
          widget.callRefresh!();
        }
      },
      child: Container(
        color: Color(0xFFFFFFFF),
        margin:
            widget.homeDisplay ? EdgeInsets.zero : EdgeInsets.only(top: 16.w),
        padding: EdgeInsets.only(left: 24.w, right: 24.w),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: 88.w,
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 112.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF3F8FFE), width: 2.w),
                    ),
                    child: Text(
                      '????????????',
                      style: TextStyle(
                          color: Color(0xFF3F8FFE),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  16.w.widthBox,
                  //
                  // Text(
                  //   widget.model.create,
                  //   style: TextStyle(
                  //     color: AppStyle.minorTextColor,
                  //     fontSize: 22.sp,
                  //   ),
                  // ),
                  Spacer(),
                  Text(
                    widget.model.statusValue,
                    style: TextStyle(
                      color: widget.model.statusColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ...widget.homeDisplay
                ? []
                : [
                    Row(
                      children: [
                        Image.asset(
                          R.ASSETS_OUTDOOR_IC_HOME_PNG,
                          width: 40.w,
                          height: 40.w,
                        ),
                        4.w.widthBox,
                        Text(
                          '????????????',
                          style: _textStyle,
                        ),
                        Spacer(),
                        Text(
                          '${UserTool.userProvider.userInfoModel!.communityName}',
                          style: AppStyle().primaryStyle,
                        ),
                      ],
                    ),
                  ],
            12.w.heightBox,
            Row(
              children: [
                Image.asset(
                  R.ASSETS_OUTDOOR_IC_ADDRESS_PNG,
                  width: 40.w,
                  height: 40.w,
                ),
                4.w.widthBox,
                Text('????????????', style: _textStyle),
                Spacer(),
                Text(
                  widget.model.roomName!,
                  style: AppStyle().primaryStyle,
                ),
              ],
            ),
            12.w.heightBox,
            Row(
              children: [
                Image.asset(
                  R.ASSETS_OUTDOOR_IC_GOOUT_PNG,
                  width: 40.w,
                  height: 40.w,
                ),
                4.w.widthBox,
                Text(
                  '?????????',
                  style: _textStyle,
                ),
                Spacer(),
                Text(
                  widget.model.applicantName!,
                  style: AppStyle().primaryStyle,
                ),
              ],
            ),
            ...widget.homeDisplay
                ? []
                : [
                    12.w.heightBox,
                    Row(
                      children: [
                        Image.asset(
                          R.ASSETS_OUTDOOR_IC_PEOPLE_PNG,
                          width: 40.w,
                          height: 40.w,
                        ),
                        4.w.widthBox,
                        Text(
                          '??????',
                          style: _textStyle,
                        ),
                        Spacer(),
                        Text(
                          widget.model.identityValue,
                          style: AppStyle().primaryStyle,
                        ),
                      ],
                    ),
                  ],
            12.w.heightBox,
            Row(
              children: [
                Image.asset(
                  R.ASSETS_OUTDOOR_IC_CHUHU_PNG,
                  width: 40.w,
                  height: 40.w,
                ),
                Text(
                  '????????????',
                  style: _textStyle,
                ),
                Spacer(),
                Text(
                  widget.model.articleOutName!,
                  style: AppStyle().primaryStyle,
                ),
              ],
            ),
            12.w.heightBox,
            Row(
              children: [
                Image.asset(
                  R.ASSETS_OUTDOOR_IC_TIME_PNG,
                  width: 40.w,
                  height: 40.w,
                ),
                4.w.widthBox,
                Text(
                  '????????????',
                  style: _textStyle,
                ),
                Spacer(),
                Text(
                  widget.model.expectedTime!,
                  style: AppStyle().primaryStyle,
                ),
              ],
            ),
            24.w.heightBox,
            Divider(
              height: 1.w,
            ),
            Container(
              height: 112.w,
              alignment: Alignment.centerRight,
              child: AkuButton(
                onPressed: () async {
                  await Get.to(ItemsOutdoorDetailsPage(id: widget.model.id!));
                  if (widget.callRefresh != null) {
                    widget.callRefresh!();
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 160.w,
                  height: 64.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppStyle.primaryColor,
                            AppStyle.minorColor
                          ])),
                  child: Text(
                    '????????????',
                    style: AppStyle().primaryStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
