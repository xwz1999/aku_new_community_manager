import 'package:aku_community_manager/mock_models/manage_models/manage_model.dart';
import 'package:aku_community_manager/provider/manage_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/manage_pages/green_manage/green_manage_details_page.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_ui/common_widgets/aku_common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aku_community_manager/const/resource.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class GreenManagePage extends StatefulWidget {
  GreenManagePage({Key key}) : super(key: key);

  @override
  _GreenManagePageState createState() => _GreenManagePageState();
}

class _GreenManagePageState extends State<GreenManagePage> {
  @override
  Widget build(BuildContext context) {
    final greenManageProvider = Provider.of<GreenManageProvider>(context);
    return AkuScaffold(
      title: '绿化管理',
      body: ListView.builder(
        itemBuilder: (context, index) {
         return _greenManageCard(greenManageProvider.greenManageModels[index]);
        },
        padding: EdgeInsets.only(left: 32.w, right: 32.w),
        itemCount: greenManageProvider.greenManageModels.length,
      ),
    );
  }

  ///绿化管理页面卡片
  Widget _greenManageCard(GreenManageCardModel cardModel) {
    return Column(
      children: [
        AkuBox.h(16),
        //跳转管理详情按钮
        AkuButton(
          onPressed: () {
            Get.to(GreenManageDetailsPage(cardModel)
            );
          },
          child: Container(
            height: 302.w,
            width: 686.w,
            padding: EdgeInsets.only(
              left: 24.w,
              right: 24.w,
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
                    cardModel.title,
                    style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontSize: 32.w,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  height: 1.w,
                ),
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
                      cardModel.task,
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
                            color: AppStyle.primaryTextColor, fontSize: 28.sp)),
                    Spacer(),
                    Text(
                      '${cardModel.timestart}至${cardModel.timeend}',
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
                      cardModel.name,
                      style: AppStyle().primaryStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
