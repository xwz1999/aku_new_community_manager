import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_ui/aku_ui.dart';
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

//自定义bar的菜单按钮
Widget _menuButton(IconData iconData, String text, Widget page) {
  return AkuButton(
    height: 75.w + 8.w + 33.w,
    onPressed: () {
      Get.to(page);
    },
    child: Column(
      children: [
        Icon(
          iconData,
          size: 75.w,
        ),
        SizedBox(height: 8.w),
        Text(
          text,
          style: TextStyle(
            color: Color(0xFF4A4B51),
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}

//底部信息栏卡片
Widget _card(String number, String text, Color color) {
  return AkuButton(
    onPressed: () {},
    color: Color(0xFFFFFFFF),
    child: Container(
        width: 342.5.w,
        height: 166.w,
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 32.w,
            ),
            Text(
              number,
              style: TextStyle(
                  color: color, fontSize: 40.sp, fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 16.w,
            ),
            Text(text,
                style: TextStyle(
                    color: AppStyle.minorTextColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold)),
            Spacer(),
          ],
        )),
  );
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: true);
    return Scaffold(
      drawer: Drawer(),
      backgroundColor: Color(0xFFF9F9F9),
      //自定义bar
      appBar: PreferredSize(
        preferredSize: Size(375.w, 430.w - 40.w + ScreenUtil().statusBarHeight),
        child: Container(
          height: 430.w - 40.w + ScreenUtil().statusBarHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFDC6F),
                Color(0xFFFFC40C),
              ],
            ),
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(32.w)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ScreenUtil().statusBarHeight),
              Container(
                height: 88.w,
                child: Row(children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 8.w, bottom: 8.w),
                      width: 72.w,
                      height: 72.w,
                      //头像按钮
                      child: Builder(builder: (BuildContext context) {
                        return AkuRoundButton(
                          height: 36.w,
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: CircleAvatar(radius: 36.w),
                        );
                      })),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 8.w, bottom: 8.w),
                      alignment: Alignment.center,
                      height: 72.w,
                      padding: EdgeInsets.only(left: 21.w),
                      child: AkuButton(
                        //搜索框按钮
                        color: Color(0xFFFFFFFF),
                        onPressed: () {},
                        child: Row(children: [
                          Container(
                            child: Column(
                              children: [
                                SizedBox(height: 18.w),
                                Icon(
                                  Icons.zoom_in_sharp,
                                  size: 38.w,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 19.w),
                          Text(
                            '搜索工单订单号、手机',
                            style: TextStyle(
                              color: AppStyle.minorTextColor,
                              fontSize: 28.sp,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Container(
                    margin: EdgeInsets.only(top: 5.w, bottom: 5.w),
                    child: MaterialButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      //扫一扫按钮
                      height: double.infinity,
                      minWidth: 78.w,
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Column(children: [
                        Icon(
                          Icons.access_alarm,
                          size: 48.w,
                        ),
                        SizedBox(height: 2.w),
                        Text(
                          '扫一扫',
                          style: TextStyle(
                            color: AppStyle.primaryTextColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.w, bottom: 5.w),
                    child: AkuMaterialButton(
                      minWidth: 78.w,
                      //消息按钮
                      height: double.infinity,
                      onPressed: () {},
                      child: Column(children: [
                        Icon(
                          Icons.access_time,
                          size: 48.w,
                        ),
                        SizedBox(height: 2.w),
                        Text(
                          '消息',
                          style: TextStyle(
                            color: AppStyle.primaryTextColor,
                            fontSize: 20.sp,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(width: 17.w),
                ]),
              ),
              SizedBox(height: 24.w),
              Container(
                margin: EdgeInsets.only(
                  left: 32.w,
                ),
                height: 67.w,
                child: Text(
                  'HI，李大海',
                  style: TextStyle(
                      color: AppStyle.primaryTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 48.sp),
                ),
              ),
              SizedBox(height: 16.w),
              Container(
                margin: EdgeInsets.only(left: 32.w, right: 32.w),
                padding: EdgeInsets.only(top: 24.w),
                color: Color(0xFFFFFFFF),
                width: double.infinity,
                height: 163.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _menuButton(Icons.wysiwyg, '一键报警', HomePage()),
                    _menuButton(Icons.work, '访客管理', HomePage()),
                    _menuButton(Icons.accessibility, '报事报修', HomePage()),
                    _menuButton(Icons.account_balance, '全部应用', HomePage()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(32.w),
        children: [
          Container(
            //公告标题行
            width: double.infinity,
            height: 45.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '今日公告',
                  style: TextStyle(
                    color: Color(0xFF4A4B51),
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                AkuButton(
                  //全部公告按钮
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        '全部公告',
                        style: TextStyle(
                          color: AppStyle.minorTextColor,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 22.w,
                        color: AppStyle.minorTextColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.w),
          //公告栏
          Container(
            color: Color(0xFFFFFFFF),
            //公告栏
            width: double.infinity,
            height: 172.w,
            //TODO listview
          ),
          SizedBox(height: 32.w),
          //待办事项标题行
          Container(
            width: double.infinity,
            height: 45.w,
            child: Row(
              children: [
                Text(
                  '待办事项',
                  style: TextStyle(
                    color: Color(0xFF4A4B51),
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                AkuButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        '全部事项',
                        style: TextStyle(
                            color: AppStyle.minorTextColor,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 22.w,
                        color: AppStyle.minorTextColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.w),
          //待办事项栏
          Container(
            width: double.infinity,
            height: 449.w,
            //TODO listview
          ),
          SizedBox(height: 24.w),
          //底部信息栏
          Container(
            width: double.infinity,
            // height: 333.w,
            child: Column(
              children: [
                Row(
                  children: [
                    _card('25', '未处理事项', Color(0xFFFF4E0D)),
                    AkuDiveder().verticalDivider(166.5.w),
                    _card('22', '处理中事项', Color(0xFFFFC40C)),
                  ],
                ),
                AkuDiveder().horizontalDivider(343.w),
                Row(
                  children: [
                    _card('25', '已处理事项', Color(0xFF3F8FFE)),
                    AkuDiveder(isReverse: true).verticalDivider(
                      166.5.w,
                    ),
                    _card('72', '全部事项', Color(0xFF333333)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
