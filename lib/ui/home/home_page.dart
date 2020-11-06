import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/provider/anouncement_provider.dart';
import 'package:aku_community_manager/provider/app_provider.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/home/announcement/All_anouncement.dart';
import 'package:aku_community_manager/ui/home/business/business_page.dart';
import 'package:aku_community_manager/ui/home/messages/message.dart';
import 'package:aku_community_manager/ui/home/application/applications_page.dart';
import 'package:aku_community_manager/ui/home/personal_draw.dart';
import 'package:aku_community_manager/ui/login/login_page.dart';
import 'package:aku_community_manager/ui/sub_pages/visitor_manager/visitor_manager_page.dart';
import 'package:aku_community_manager/ui/sub_pages/business_and_fix/business_and_fix_page.dart';
import 'package:aku_community_manager/ui/tool_pages/scan_page.dart';
import 'package:aku_ui/aku_ui.dart';
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///自定义bar的菜单按钮
  Widget _menuButton(String assetPath, String text, Widget page) {
    final appProvider = Provider.of<AppProvider>(context);
    return Expanded(
      child: AkuButton(
        radius: 8.w,
        height: 75.w + 8.w + 33.w,
        onPressed: () {
          final userProvider =
              Provider.of<UserProvider>(context, listen: false);
          if (userProvider.isSigned) {
            Get.to(page);
            appProvider.addRecentApp(AppApplication(text, assetPath, page));
          } else
            Get.to(LoginPage());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              assetPath,
              height: 75.w,
              width: 75.w,
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
      ),
    );
  }

  ///底部信息栏卡片
  Widget _card(
    String number,
    String text,
    Color color,
    int index,
  ) {
    return AkuButton(
      radius: 8.w,
      onPressed: () {
        Get.to(BusinessPage(initIndex: index));
      },
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
                  color: color,
                  fontSize: 40.sp,
                  fontFamily: 'Bebas',
                ),
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

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

    int _currentIndicator = 0;
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final _anouncementProvider = Provider.of<AnouncementProvider>(context);
    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: true);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: Scaffold(
        drawer: PersonalDraw(),
        backgroundColor: Color(0xFFF9F9F9),
        //自定义bar
        appBar: PreferredSize(
          preferredSize: Size(375.w, 430.w - 40.w + statusBarHeight),
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
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(32.w)),
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
                      child: Builder(
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: CircleAvatar(
                              radius: 36.w,
                              backgroundImage:
                                  userProvider.userInfoModel.avatar == null
                                      ? null
                                      : FileImage(
                                          userProvider.userInfoModel.avatar),
                              backgroundColor: Colors.white,
                              child: userProvider.isSigned
                                  ? userProvider.userInfoModel.avatar == null
                                      ? Icon(Icons.person_outline)
                                      : null
                                  : Icon(Icons.person),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 8.w, bottom: 8.w),
                        alignment: Alignment.center,
                        height: 72.w,
                        child: AkuButton(
                          //搜索框按钮
                          color: Color(0xFFFFFFFF),
                          onPressed: () {},
                          radius: 8.w,
                          child: Row(children: [
                            AkuBox.w(21.w),
                            Container(
                              child: Column(
                                children: [
                                  SizedBox(height: 18.w),
                                  Image.asset(R.ASSETS_HOME_IC_SEARCH_PNG,
                                      width: 37.w, height: 37.w),
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
                        onPressed: () {
                          Get.to(ScanPage());
                        },
                        child: Column(children: [
                          Image.asset(
                            R.ASSETS_HOME_IC_SCAN_PNG,
                            height: 48.w,
                            width: 48.w,
                          ),
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
                        onPressed: () {
                          Get.to(Message());
                        },
                        child: Column(children: [
                          Image.asset(
                            R.ASSETS_HOME_IC_NEWS_PNG,
                            height: 48.w,
                            width: 48.w,
                          ),
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
                GestureDetector(
                  onTap: () {
                    if (!userProvider.isSigned) Get.to(LoginPage());
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 32.w,
                    ),
                    height: 67.w,
                    child: Text(
                      userProvider.isSigned
                          ? 'HI，${userProvider.userInfoModel.nickName}'
                          : '登录/注册',
                      style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 48.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.w),
                Container(
                  margin: EdgeInsets.only(left: 32.w, right: 32.w),
                  width: double.infinity,
                  height: 163.w,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _menuButton(
                          R.ASSETS_HOME_IC_POLICE_PNG, '一键报警', HomePage()),
                      _menuButton(R.ASSETS_HOME_IC_VISITORS_PNG, '访客管理',
                          VisitorManagerPage()),
                      _menuButton(
                        R.ASSETS_HOME_IC_SERVICE_PNG,
                        '报事报修',
                        BusinessAndFixPage(),
                      ),
                      _menuButton(
                          R.ASSETS_HOME_IC_ALL_PNG, '全部应用', ApplicationPage()),
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
                    onPressed: () {
                      Get.to(AllAnouncement());
                    },
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
              height: 200.w,
              child: Column(
                children: [
                  CarouselSlider(
                    items: _anouncementProvider.anouncementCardModels
                        .map((e) => AllAnouncementState.anounceCard(e))
                        .toList(),
                    options: CarouselOptions(
                      viewportFraction: 1.0,
                      aspectRatio: 686 / 172,
                      autoPlay: true,
                      onPageChanged: (index, _) {
                        setState(() {
                          _currentIndicator = index;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        _anouncementProvider.anouncementCardModels.map((e) {
                      int index =
                          _anouncementProvider.anouncementCardModels.indexOf(e);
                      return Container(
                        width: 8.w,
                        height: 8.w,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.w, horizontal: 2.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndicator == index
                              ? Color.fromRGBO(0, 0, 0, 0.9)
                              : Color.fromRGBO(0, 0, 0, 0.4),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.w),
            //待办事项标题行
            Row(
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
                  padding: EdgeInsets.symmetric(vertical: 16.w),
                  onPressed: () {
                    Get.to(BusinessPage(initIndex: 3));
                  },
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      _card('25', '未处理事项', Color(0xFFFF4E0D), 0),
                      AkuDiveder().verticalDivider(166.5.w),
                      _card('22', '处理中事项', Color(0xFFFFC40C), 1),
                    ],
                  ),
                  Row(children: [
                    AkuDiveder().horizontalDivider(343.w),
                    AkuDiveder(isReverse: true).horizontalDivider(343.w)
                  ]),
                  Row(
                    children: [
                      _card('25', '已处理事项', Color(0xFF3F8FFE), 2),
                      AkuDiveder(isReverse: true).verticalDivider(
                        166.5.w,
                      ),
                      _card('72', '全部事项', Color(0xFF333333), 3),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      value: SystemUiOverlayStyle.dark,
    );
  }
}
