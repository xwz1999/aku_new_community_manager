import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_ui/common_widgets/aku_common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aku_community_manager/const/resource.dart';

class GreenManageCardModel {
  String title;
  String task;
  String timestart;
  String timeend;
  String name;
  GreenManageCardModel(this.title,this.task,this.timestart,this.timeend,this.name);
}

class GreenManagePage extends StatefulWidget {
  GreenManagePage({Key key}) : super(key: key);

  @override
  _GreenManagePageState createState() => _GreenManagePageState();
}

class _GreenManagePageState extends State<GreenManagePage> {

   List<GreenManageCardModel> _cards=[
     GreenManageCardModel('中部广场周围绿化调整', '除杂草、松土、培土', '2020-10-08','2020-10-18', '杨雄会', ),
     GreenManageCardModel('东区周围绿化调整', '修剪、造型', '2020-10-08', '2020-10-18', '刘小青'),
     GreenManageCardModel('西区周围绿化调整', '修剪、造型', '2020-10-10', '2020-10-20', '张空间'),
     GreenManageCardModel('北区周围绿化调整', '修剪造型', '2020-10-15', '2020-10-25', '凯尔希'),
   ];

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '绿化管理',
      body: ListView(
        padding: EdgeInsets.only(left: 32.w, right: 32.w),
        children: _cards.map((e) => _greenManageCard(e.title, e.task, e.timestart, e.timeend, e.name),).toList(),
      ),
    );
  }
///绿化管理页面卡片
  Widget _greenManageCard(String title, String task, String timestart,
      String timeend, String name) {
    return Column(
      children: [
        AkuBox.h(16),
        //跳转管理详情按钮
        AkuButton(
          onPressed: () {},
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
                    title,
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
                      task,
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
                      '$timestart至$timeend',
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
                      name,
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
