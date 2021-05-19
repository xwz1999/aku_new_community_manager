// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/provider/app_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/home/application/applications_page.dart';
import 'package:aku_community_manager/ui/manage_pages/green_manage/green_manage_page.dart';
import 'package:aku_community_manager/ui/manage_pages/inspection_manage/inspection_manage_page.dart';
import 'package:aku_community_manager/ui/sub_pages/activity_manager/activity_manager_page.dart';
import 'package:aku_community_manager/ui/sub_pages/borrow_manager/borrow_manager_page.dart';
import 'package:aku_community_manager/ui/sub_pages/business_and_fix/business_and_fix_page.dart';
import 'package:aku_community_manager/ui/sub_pages/decoration_manager/decoration_manager_page.dart';
import 'package:aku_community_manager/ui/sub_pages/items_outdoor/items_outdoor_page.dart';
import 'package:aku_community_manager/ui/sub_pages/visitor_manager/visitor_manager_page.dart';
import 'package:aku_community_manager/ui/tool_pages/warning/warning_page.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_back_button.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

class SearchWorkOrderPage extends StatefulWidget {
  SearchWorkOrderPage({Key key}) : super(key: key);

  @override
  _SearchWorkOrderpageState createState() => _SearchWorkOrderpageState();
}

class _SearchWorkOrderpageState extends State<SearchWorkOrderPage> {
  TextEditingController _textController;
  List<AppApplication> _wisdomApplications = [
    AppApplication('一键报警', R.ASSETS_HOME_IC_POLICE_PNG, WarningPage()),
    AppApplication('访客管理', R.ASSETS_HOME_IC_VISITORS_PNG, VisitorManagerPage()),
    AppApplication('报事报修', R.ASSETS_HOME_IC_SERVICE_PNG, BusinessAndFixPage()),
    AppApplication('物品出户', R.ASSETS_HOME_IC_ARTICLE_PNG, ItemsOutdoorPage()),
    AppApplication(
        '装修管理', R.ASSETS_HOME_IC_DECORATION_PNG, DecorationManagerPage()),
    AppApplication(
        '活动管理', R.ASSETS_HOME_IC_ACTIVITY_PNG, ActivityManagerPage()),
    AppApplication('借还管理', R.ASSETS_HOME_IC_BORROW_PNG, BorrowManagerPage()),
    AppApplication('巡检管理', R.ASSETS_HOME_IC_PATROL_PNG, InspectionManagePage()),
    AppApplication('绿化管理', R.ASSETS_HOME_IC_GREENING_PNG, GreenManagePage()),
  ];

  List<AppApplication> _displayApps = [];
  @override
  void initState() {
    super.initState();
    _displayApps = _wisdomApplications;
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController?.dispose();
    super.dispose();
  }

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
        titleSpacing: 0,
        title: Container(
          margin: EdgeInsets.only(right: 37.w),
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          height: 72.w,
          child: Row(
            children: [
              Image.asset(
                R.ASSETS_HOME_IC_SEARCH_PNG,
                height: 40.w,
                width: 40.w,
              ),
              AkuBox.w(16),
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: '搜索应用',
                    hintStyle: TextStyle(
                      color: AppStyle.minorTextColor,
                      fontSize: 28.sp,
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: AppStyle.minorTextColor,
                    fontSize: 28.sp,
                  ),
                  onChanged: (text) {
                    if (text.isEmpty)
                      _displayApps = _wisdomApplications;
                    else
                      _displayApps = _wisdomApplications
                          .where((element) => element.name.contains(text))
                          .toList();
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(8.w),
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (context, index) {
          final item = _displayApps[index];
          return AkuMaterialButton(
            onPressed: () {
              appProvider.addRecentApp(item);
              Get.to(item.page);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  item.assetPath,
                  height: 60.w,
                  width: 60.w,
                ),
                AkuBox.h(8),
                Text(
                  item.name,
                  style: TextStyle(
                      color: AppStyle.primaryTextColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
        itemCount: _displayApps.length,
      ),
    );
  }
}
