import 'package:aku_community_manager/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';

class AkuTabBar extends StatefulWidget {
  final TabController controller;
  final List<String> tabs;
  AkuTabBar({Key key, @required this.controller, @required this.tabs})
      : super(key: key);

  @override
  _AkuTabBarState createState() => _AkuTabBarState();
}

class _AkuTabBarState extends State<AkuTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
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
