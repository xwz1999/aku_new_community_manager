import 'package:aku_new_community_manager/provider/app_provider.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/tools/screen_tool.dart';
import 'package:aku_new_community_manager/tools/user_tool.dart';
import 'package:aku_new_community_manager/tools/widget_tool.dart';
import 'package:aku_new_community_manager/ui/manage_pages/clock_in_out/clock_in_out_page.dart';
import 'package:aku_new_community_manager/ui/manage_pages/engineer_repair/engineer_repair_page.dart';
import 'package:aku_new_community_manager/ui/manage_pages/facilities/facilities_select_page.dart';
import 'package:aku_new_community_manager/ui/manage_pages/green_manage/green_manage_page.dart';
import 'package:aku_new_community_manager/ui/manage_pages/house_keeping/house_keeping_page.dart';
import 'package:aku_new_community_manager/ui/manage_pages/hygience_manage/hygience_manage_page.dart';
import 'package:aku_new_community_manager/ui/manage_pages/inspection_manage/inspection_manage_page.dart';
import 'package:aku_new_community_manager/ui/manage_pages/interview/interview_page.dart';
import 'package:aku_new_community_manager/ui/manage_pages/key_manage/key_manage_page.dart';
import 'package:aku_new_community_manager/ui/manage_pages/packages_manage/packages_manage_page.dart';
import 'package:aku_new_community_manager/ui/manage_pages/rules_manage/rules_manage_page.dart';
import 'package:aku_new_community_manager/ui/sub_pages/activity_manager/activity_manager_page.dart';
import 'package:aku_new_community_manager/ui/sub_pages/borrow_manager/borrow_manager_page.dart';
import 'package:aku_new_community_manager/ui/sub_pages/business_and_fix/business_and_fix_page.dart';
import 'package:aku_new_community_manager/ui/sub_pages/decoration_manager/new_renovation/new_renovation_page.dart';
import 'package:aku_new_community_manager/ui/sub_pages/items_outdoor/items_outdoor_page.dart';
import 'package:aku_new_community_manager/ui/sub_pages/visitor_manager/visitor_manager_page.dart';
import 'package:aku_new_community_manager/ui/tool_pages/warning/warning_page.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_back_button.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:get/get.dart';
import 'package:provider/provider.dart';

@Deprecated('?????????????????????')
class AppApplication {
  String name;
  String assetPath;
  dynamic page;

  AppApplication(
    this.name,
    this.assetPath,
    this.page,
  );
}

class ApplicationPage extends StatefulWidget {
  ApplicationPage({Key? key}) : super(key: key);

  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  PageController _pageController = PageController();

  int _nowSelectedIndex = 0;

  List<AppApplication> _recommandApplications = [
    AppApplication(
        '????????????', R.ASSETS_HOME_IC_ACTIVITY_PNG, () => ActivityManagerPage()),
    AppApplication(
        '????????????', R.ASSETS_HOME_IC_VISITORS_PNG, () => VisitorManagerPage()),
    AppApplication(
        '????????????', R.ASSETS_HOME_IC_BORROW_PNG, () => BorrowManagerPage()),
    AppApplication('????????????', R.ASSETS_HOME_IC_POLICE_PNG, () => WarningPage()),
  ];
  List<AppApplication> _wisdomApplications = [
    AppApplication('????????????', R.ASSETS_HOME_IC_POLICE_PNG, () => WarningPage()),
    AppApplication(
        '????????????', R.ASSETS_HOME_IC_VISITORS_PNG, () => VisitorManagerPage()),
    if (!(UserTool.userProvider.userInfoModel!.type == 1))
      AppApplication(
          '????????????', R.ASSETS_HOME_IC_SERVICE_PNG, () => BusinessAndFixPage()),
    AppApplication(
        '????????????', R.ASSETS_HOME_IC_ARTICLE_PNG, () => ItemsOutdoorPage()),
    AppApplication(
        '????????????', R.ASSETS_HOME_IC_DECORATION_PNG, () => NewRenovationPage()),
    AppApplication(
        '????????????', R.ASSETS_HOME_IC_ACTIVITY_PNG, () => ActivityManagerPage()),
    AppApplication(
        '????????????', R.ASSETS_HOME_IC_BORROW_PNG, () => BorrowManagerPage()),
    AppApplication(
        '????????????', R.ASSETS_HOME_IC_PATROL_PNG, () => InspectionManagePage()),
    AppApplication(
        '????????????', R.ASSETS_HOME_IC_GREENING_PNG, () => GreenManagePage()),
    AppApplication(
        '????????????', R.ASSETS_HOME_FACILITIES_PNG, () => FacilitiesSelectPage()),
    AppApplication(
        '????????????', R.ASSETS_HOME_PACKAGE_PNG, () => PackagesManagePage()),
    AppApplication('????????????', R.ASSETS_HOME_KEY_PNG, () => KeyManagePage()),
    AppApplication('????????????', R.ASSETS_HOME_RULES_PNG, () => RulesManagePage()),
    AppApplication(
        '????????????', R.ASSETS_HOME_HYGIENICE_PNG, () => HygienceManagePage()),
    AppApplication(
        '????????????', R.ASSETS_HOME_CLOCK_IN_OUT_PNG, () => ClockInOutPage()),
    AppApplication('????????????', R.ASSETS_HOME_INTERVIEW_PNG, () => InterviewPage()),
    if (UserTool.userProvider.userInfoModel!.type == 1)
      AppApplication(
          '????????????', R.ASSETS_HOME_HOUSE_KEEPING_PNG, () => HouseKeepingPage()),
    if (UserTool.userProvider.userInfoModel!.type == 1)
      AppApplication(
          '????????????', R.ASSETS_HOME_IC_SERVICE_PNG, () => EngineerRepairPage()),
  ];

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return AkuScaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: SizedBox(
          width: 89.w,
          child: AkuBackButton(),
        ),
        //   titleSpacing: 0,
        //   title: Container(
        //     margin: EdgeInsets.only(right: 37.w),
        //     padding: EdgeInsets.symmetric(horizontal: 32.w),
        //     height: 72.w,
        //     child: Row(
        //       children: [
        //         Image.asset(
        //           R.ASSETS_HOME_IC_SEARCH_PNG,
        //           height: 40.w,
        //           width: 40.w,
        //         ),
        //         AkuBox.w(16),
        //         Text(
        //           '????????????',
        //           style: TextStyle(
        //             color: AppStyle.minorTextColor,
        //             fontSize: 28.sp,
        //           ),
        //         ),
        //       ],
        //     ),
        //     decoration: BoxDecoration(
        //       color: Color(0xFFF9F9F9),
        //       borderRadius: BorderRadius.circular(8.w),
        //     ),
        //   ),
        // ),
        title: Text(
          '????????????',
          style: AppStyle().barTitleStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          AkuBox.h(16),
          _buildRecentUsed(),
          appProvider.recentUsedApp.isEmpty ? SizedBox() : AkuBox.h(16),
          _buildBottomApps(),
        ],
      ),
    );
  }

  ///????????????
  _buildRecentUsed() {
    final appProvider = Provider.of<AppProvider>(context);
    return appProvider.recentUsedApp.isEmpty
        ? SizedBox()
        : Material(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Padding(
                      child: Text(
                        '????????????',
                        style: TextStyle(
                          color: AppStyle.primaryTextColor,
                          fontSize: 28.w,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 18.w,
                        horizontal: 32.w,
                      ),
                    ),
                    Spacer(),
                    AkuMaterialButton(
                      onPressed: () {
                        appProvider.clearRecentApp();
                      },
                      child: Text(
                        '??????',
                        style: TextStyle(
                          color: AppStyle.secondaryColor,
                          fontSize: 28.w,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 18.w,
                        horizontal: 32.w,
                      ),
                    ),
                  ],
                ),
                GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  children: appProvider.recentUsedApp
                      .map((e) => _buildBottomAppCard(e))
                      .toList(),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          );
  }

  ///?????????
  _buildBottomApps() {
    return Expanded(
      child: Row(
        children: [
          SizedBox(
            width: 172.w,
            child: ListView(
              children: [
                _buildBottomTypeCard(0, '????????????'),
                _buildBottomTypeCard(1, '????????????'),
              ],
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.white,
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                scrollDirection: Axis.vertical,
                onPageChanged: (index) {
                  setState(() {
                    _nowSelectedIndex = index;
                  });
                },
                children: [
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    // physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final application = _recommandApplications[index];
                      return _buildBottomAppCard(application);
                    },
                    itemCount: _recommandApplications.length,
                  ),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    // physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final application = _wisdomApplications[index];
                      return _buildBottomAppCard(application);
                    },
                    itemCount: _wisdomApplications.length,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///?????????????????????
  _buildBottomTypeCard(int index, String title) {
    final bool isSelected = _nowSelectedIndex == index;
    return AkuMaterialButton(
      color: isSelected ? Colors.white : Colors.transparent,
      onPressed: () {
        if (!isSelected)
          setState(() {
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOutCubic,
            );
            _nowSelectedIndex = index;
          });
      },
      child: Text(
        title,
        style: TextStyle(
          color:
              isSelected ? AppStyle.primaryTextColor : AppStyle.minorTextColor,
          fontSize: 28.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBottomAppCard(AppApplication application) {
    final appProvider = Provider.of<AppProvider>(context);
    return AkuMaterialButton(
      onPressed: () {
        appProvider.addRecentApp(application);
        Get.to(application.page);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            application.assetPath,
            height: 60.w,
            width: 60.w,
          ),
          AkuBox.h(8),
          Text(
            application.name,
            style: TextStyle(
                color: AppStyle.primaryTextColor,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
