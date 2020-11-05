import 'package:aku_community_manager/provider/app_provider.dart';
import 'package:aku_community_manager/provider/fix_provider.dart';
import 'package:aku_community_manager/provider/manage_provider.dart';
import 'package:aku_community_manager/provider/outdoor_provider.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/ui/home/home_page.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => AppProvider()),
        ChangeNotifierProvider(create: (context) => FixProvider()),
        ChangeNotifierProvider(create: (context)=> GreenManageProvider()),
        ChangeNotifierProvider(create: (context)=>InspectionManageProvider()),
        ChangeNotifierProvider(create: (context)=>OutdoorProvider()),
      ],
      child: GetMaterialApp(
        title: '小蜜蜂管家',
        home: HomePage(),
        builder: BotToastInit(),
        navigatorObservers: [
          BotToastNavigatorObserver(),
        ],
      ),
    );
  }
}
