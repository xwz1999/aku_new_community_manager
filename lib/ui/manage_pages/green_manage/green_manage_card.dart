import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/aku_divider.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/manage_pages/green_manage/green_manage_map.dart';
import 'package:aku_ui/common_widgets/aku_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:aku_community_manager/tools/extensions/list_extension_tool.dart';

class GreenManageCard extends StatefulWidget {
  final int index;
  GreenManageCard({Key key, this.index}) : super(key: key);

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
                    'cardModel.title',
                    style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontSize: 32.w,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  GreenManageMap.statusString(widget.index + 1)
                      .text
                      .size(28.sp)
                      .color(GreenManageMap.statusColor(widget.index + 1))
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
                    'cardModel.task',
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
                    'cardModel.name',
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
                    '${'cardModel.timestart'}至${'cardModel.timeend'}',
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
    return widget.index != 0
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
                  onPressed: () {},
                )
              ],
            )
          ];
  }
}
