// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/tools/screen_tool.dart';

class AkuTabBar extends StatefulWidget {
  final TabController controller;
  final List<String> tabs;
  final bool isScrollable;
  AkuTabBar({Key? key, required this.controller, required this.tabs, this.isScrollable=false})
      : super(key: key);

  @override
  _AkuTabBarState createState() => _AkuTabBarState();
}

class _AkuTabBarState extends State<AkuTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: widget.isScrollable,
      labelColor: AppStyle.primaryTextColor,
      unselectedLabelColor: AppStyle.minorTextColor,
      labelStyle: TextStyle(
        fontSize: 28.w,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.normal,
      ),
      indicatorColor: AppStyle.primaryColor,
      indicatorSize: TabBarIndicatorSize.label,
      controller: widget.controller,
      tabs: widget.tabs.map((e) => Tab(text: e)).toList(),
    );
  }
}
