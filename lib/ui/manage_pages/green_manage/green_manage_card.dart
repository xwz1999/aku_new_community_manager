// Flutter imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/green_manage/green_manage_list_model.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:aku_ui/common_widgets/aku_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

// Project imports:
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/aku_divider.dart';
import 'package:aku_community_manager/tools/extensions/list_extension_tool.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/manage_pages/green_manage/green_manage_map.dart';

class GreenManageCard extends StatefulWidget {
  final int index;
  final GreenManageListModel model;
  final VoidCallback callRefresh;
  GreenManageCard({Key key, this.index, this.model, this.callRefresh})
      : super(key: key);

  @override
  _GreenManageCardState createState() => _GreenManageCardState();
}

class _GreenManageCardState extends State<GreenManageCard> {
  @override
  Widget build(BuildContext context) {
    return AkuButton(
      onPressed: () {
        // Get.to(GreenManageDetailsPage(cardModel));
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 24.w),
        color: Color(0xFFFFFFFF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    widget.model.greenAreaName,
                    style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontSize: 32.w,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  GreenManageMap.statusString(widget.model.status)
                      .text
                      .size(28.sp)
                      .color(GreenManageMap.statusColor(widget.model.status))
                      .bold
                      .make(),
                ],
              ),
            ),
            16.w.heightBox,
            AkuDivider.horizontal(),
            24.w.heightBox,
            ...[
              Row(
                children: [
                  Image.asset(
                    R.ASSETS_MANAGE_IC_RENWU_PNG,
                    width: 40.w,
                    height: 40.w,
                  ),
                  AkuBox.w(4),
                  Text('工作内容',
                      style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontSize: 28.sp,
                      )),
                  Spacer(),
                  Text(
                    widget.model.content,
                    style: AppStyle().primaryStyle,
                  ),
                ],
              ),
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
                    widget.model.directorName,
                    style: AppStyle().primaryStyle,
                  ),
                ],
              ),
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
                          color: AppStyle.primaryTextColor, fontSize: 28.sp)),
                  Spacer(),
                  Text(
                    '${widget.model.createDateString}至${widget.model.endDateString}',
                    style: AppStyle().primaryStyle,
                  ),
                ],
              ),
            ].sepWidget(separate: 16.w.heightBox),
            ..._buttomButtons()
          ],
        ),
      ),
    );
  }

  List<Widget> _buttomButtons() {
    return widget.model.status != 1
        ? [SizedBox()]
        : [
            40.w.heightBox,
            Row(
              children: [
                '请在期限前完成绿化任务'.text.size(24.sp).color(kTextSubColor).make(),
                Spacer(),
                AkuButton(
                  color: kPrimaryColor,
                  radius: 74.w,
                  padding:
                      EdgeInsets.symmetric(vertical: 8.w, horizontal: 24.w),
                  height: 52.w,
                  child: '确认完成'
                      .text
                      .size(26.sp)
                      .color(kTextPrimaryColor)
                      .bold
                      .make(),
                  onPressed: () async {
                    BaseModel baseModel = await NetUtil()
                        .post(API.manage.greenManageComplete, params: {
                      "id": widget.model.id,
                    });
                    if (baseModel.status) {
                      widget.callRefresh();
                    }
                    BotToast.showText(text: baseModel.message);
                  },
                )
              ],
            )
          ];
  }
}
