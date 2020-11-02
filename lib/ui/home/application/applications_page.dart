import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/provider/app_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_back_button.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:flutter/material.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:provider/provider.dart';

class AppApplication {
  String name;
  String assetPath;
}

class ApplicationPage extends StatefulWidget {
  ApplicationPage({Key key}) : super(key: key);

  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  PageController _pageController = PageController();

  int _nowSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
              Text(
                '搜索应用',
                style: TextStyle(
                  color: AppStyle.minorTextColor,
                  fontSize: 28.sp,
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
      body: Column(
        children: [
          AkuBox.h(16),
          _buildRecentUsed(),
          _buildBottomApps(),
        ],
      ),
    );
  }

  ///最近使用
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
                    AkuMaterialButton(
                      onPressed: () {
                        appProvider.clearRecentApp();
                      },
                      child: Text(
                        '最近使用',
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
                      onPressed: () {},
                      child: Text(
                        '清除',
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
              ],
            ),
          );
  }

  ///应用组
  _buildBottomApps() {
    final appProvider = Provider.of<AppProvider>(context);
    return Expanded(
      child: Row(
        children: [
          SizedBox(
            width: 172.w,
            child: ListView(
              children: [
                _buildBottomTypeCard(0, '为您推荐'),
                _buildBottomTypeCard(1, '智慧管家'),
              ],
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.white,
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                onPageChanged: (index) {
                  setState(() {
                    _nowSelectedIndex = index;
                  });
                },
                children: [
                  Text('12'),
                  Text('23'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///应用组分类卡片
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
}
