// Flutter imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/announce/announcement_list_model.dart';
import 'package:aku_community_manager/models/manager/bussiness_and_fix/bussiness_and_fix_model.dart';
import 'package:aku_community_manager/models/manager/item_num_model.dart';
import 'package:aku_community_manager/models/todo_bussiness/todo_model.dart';
import 'package:aku_community_manager/models/todo_bussiness/todo_outdoor_model.dart';
import 'package:aku_community_manager/tools/user_tool.dart';
import 'package:aku_community_manager/ui/home/business/bussiness_func.dart';
import 'package:aku_community_manager/ui/home/business/todo_outdoor_card.dart';
import 'package:aku_community_manager/utils/network/base_list_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:badges/badges.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

// Package imports:
import 'package:aku_ui/aku_ui.dart';
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide Response;
import 'package:provider/provider.dart';

// Project imports:
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/provider/app_provider.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/home/announcement/All_anouncement.dart';
import 'package:aku_community_manager/ui/home/application/applications_page.dart';
import 'package:aku_community_manager/ui/home/business/business_page.dart';
import 'package:aku_community_manager/ui/home/messages/message.dart';
import 'package:aku_community_manager/ui/home/personal_draw.dart';
import 'package:aku_community_manager/ui/home/search_workorder_page.dart';
import 'package:aku_community_manager/ui/login/login_page.dart';
import 'package:aku_community_manager/ui/settings/user_info_page.dart';
import 'package:aku_community_manager/ui/sub_pages/business_and_fix/business_and_fix_page.dart';
import 'package:aku_community_manager/ui/sub_pages/business_and_fix/business_fix_card.dart';
import 'package:aku_community_manager/ui/sub_pages/visitor_manager/visitor_manager_page.dart';
import 'package:aku_community_manager/ui/tool_pages/warning/warning_page.dart';
import 'package:aku_community_manager/ui/widgets/app_widgets/aku_avatar.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ItemNumModel _itemNumModel;
  List _todoModelList;
  List _anounceMentList;
  bool _onload = true;
  EasyRefreshController _refreshController;

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
          if (userProvider.isLogin) {
            Get.to(() => page);
            if (text != '全部应用')
              appProvider.addRecentApp(AppApplication(text, assetPath, page));
          } else
            Get.to(() => LoginPage());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              assetPath,
              height: 60.w,
              width: 60.w,
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
    int number,
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
                number == null ? '0' : number.toString(),
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
    _refreshController = EasyRefreshController();
  }

  int _currentIndicator = 0;

  Future _getItemNum() async {
    Response response = await NetUtil().dio.get(API.manage.findItemNum);
    return ItemNumModel.fromJson(response.data);
  }

  Future _getAnouncement() async {
    BaseListModel baseListModel =
        (await NetUtil().getList(API.message.announcementList, params: {
      "pageNum": 1,
      "size": 3,
    }));
    List<AnnouncementListModel> anounceModels = baseListModel.tableList
        .map((e) => AnnouncementListModel.fromJson(e))
        .toList();
    return anounceModels;
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
    var loadingWidget = Center(
      // child: CircularProgressIndicator(),
    );
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
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(36.w),
                      ),
                      //头像按钮
                      child: Builder(
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: AkuAvatar(),
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
                          onPressed: () {
                            Get.to(() => SearchWorkOrderPage());
                          },
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
                              '搜索应用',
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
                    // Container(
                    //   margin: EdgeInsets.only(top: 5.w, bottom: 5.w),
                    //   child: MaterialButton(
                    //     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    //     //扫一扫按钮
                    //     height: double.infinity,
                    //     minWidth: 78.w,
                    //     padding: EdgeInsets.zero,
                    //     onPressed: () {
                    //       Get.to(() => ScanPage());
                    //     },
                    //     child: Column(children: [
                    //       Image.asset(
                    //         R.ASSETS_HOME_IC_SCAN_PNG,
                    //         height: 48.w,
                    //         width: 48.w,
                    //       ),
                    //       Text(
                    //         '扫一扫',
                    //         style: TextStyle(
                    //           color: AppStyle.primaryTextColor,
                    //           fontSize: 20.sp,
                    //           fontWeight: FontWeight.normal,
                    //         ),
                    //       ),
                    //     ]),
                    //   ),
                    // ),
                    Badge(
                      elevation: 0,
                      position: BadgePosition.topEnd(
                        top: 4,
                        end: 4,
                      ),
                      showBadge: appProvider.hasMessage,
                      child: Container(
                        margin: EdgeInsets.only(top: 5.w, bottom: 5.w),
                        child: AkuMaterialButton(
                          minWidth: 78.w,
                          //消息按钮
                          height: double.infinity,
                          onPressed: () {
                            if (userProvider.isLogin)
                              Get.to(() => Message());
                            else
                              Get.to(() => LoginPage());
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
                    ),
                    SizedBox(width: 17.w),
                  ]),
                ),
                SizedBox(height: 24.w),
                GestureDetector(
                  onTap: () {
                    if (!userProvider.isLogin)
                      Get.to(() => LoginPage());
                    else
                      Get.to(() => UserInfoPage());
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 32.w,
                    ),
                    height: 67.w,
                    child: Text(
                      userProvider.isLogin
                          ? 'HI，${userProvider.infoModel.nickName}'
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
                          R.ASSETS_HOME_IC_POLICE_PNG, '一键报警', WarningPage()),
                      _menuButton(
                        R.ASSETS_HOME_IC_VISITORS_PNG,
                        '访客管理',
                        VisitorManagerPage(),
                      ),
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
        //需要重构
        body: EasyRefresh(
          firstRefresh: true,
          header: MaterialHeader(),
          controller: _refreshController,
          onRefresh: () async {
            final userProvider =
                Provider.of<UserProvider>(context, listen: false);
            if (userProvider.isLogin) {
              _itemNumModel = await _getItemNum();
              var dataList = await BussinessFunc.getBussinessModelList(1);
              _todoModelList =
                  dataList.map((e) => ToDoModel.fromJson(e)).toList();
              _anounceMentList = await _getAnouncement();
              _onload = false;
              setState(() {});
            }
          },
          child: (!UserTool.userProvider.isLogin)
              ? SizedBox()
              : _onload
                  ? loadingWidget
                  : ListView(
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
                                  Get.to(() => AllAnouncement());
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
                          width: double.infinity,
                          height: 172.w,
                          child: Stack(children: [
                            CarouselSlider(
                              items: _anounceMentList
                                  .map(
                                      (e) => AllAnouncementState.anounceCard(e))
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
                            Positioned(
                              top: 144.w,
                              left: 0,
                              bottom: 16.w,
                              right: 0,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: _anounceMentList.map((e) {
                                  int index = _anounceMentList.indexOf(e);
                                  return Container(
                                    width: 12.w,
                                    height: 12.w,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 12.w),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _currentIndicator == index
                                          ? Color(0xFFFFC40C)
                                          : Color(0xFFE8E8E8),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(height: 16.w),
                        //待办事项标题行
                        !userProvider.isLogin
                            ? SizedBox()
                            : Row(
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
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.w),
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
                        !userProvider.isLogin
                            ? SizedBox()
                            : Container(
                                height: 450.w,
                                child: ListView.separated(
                                  padding: EdgeInsets.zero,
                                  separatorBuilder: (context, index) {
                                    return AkuBox.w(16);
                                  },
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 526.w,
                                      child: Builder(
                                        builder: (context) {
                                          if (_todoModelList[index]
                                                  .dynamicModel
                                                  .runtimeType ==
                                              BussinessAndFixModel) {
                                            return BusinessFixCard(
                                                homeDisplay: true,
                                                callRefresh: () {
                                                  _refreshController
                                                      .callRefresh();
                                                },
                                                model: _todoModelList[index]
                                                    .dynamicModel);
                                          } else if (_todoModelList[index]
                                                  .dynamicModel
                                                  .runtimeType ==
                                              ToDoOutDoorModel) {
                                            return ToDoOutDoorCard(
                                              homeDisplay: true,
                                              callRefresh: () {
                                                _refreshController
                                                    .callRefresh();
                                              },
                                              model: _todoModelList[index]
                                                  .dynamicModel,
                                            );
                                          } else
                                            return SizedBox();
                                        },
                                      ),
                                    );
                                  },
                                  itemCount: _todoModelList.length,
                                ),
                              ),
                        SizedBox(height: 24.w),
                        //底部信息栏
                        !userProvider.isLogin
                            ? SizedBox()
                            : Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.w),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        _card(_itemNumModel.unProcessedNum ?? 0,
                                            '未处理事项', Color(0xFFFF4E0D), 0),
                                        GridientDiveder()
                                            .verticalDivider(166.5.w),
                                        _card(_itemNumModel.processingNum ?? 0,
                                            '处理中事项', Color(0xFFFFC40C), 1),
                                      ],
                                    ),
                                    Row(children: [
                                      GridientDiveder()
                                          .horizontalDivider(343.w),
                                      GridientDiveder(isReverse: true)
                                          .horizontalDivider(343.w)
                                    ]),
                                    Row(
                                      children: [
                                        _card(_itemNumModel.processedNum ?? 0,
                                            '已处理事项', Color(0xFF3F8FFE), 2),
                                        GridientDiveder(isReverse: true)
                                            .verticalDivider(
                                          166.5.w,
                                        ),
                                        _card(_itemNumModel.allNum ?? 0, '全部事项',
                                            Color(0xFF333333), 3),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
        ),
      ),
      value: SystemUiOverlayStyle.dark,
    );
  }
}
