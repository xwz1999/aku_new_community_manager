import 'package:aku_community_manager/provider/app_provider.dart';
import 'package:aku_community_manager/provider/fix_provider.dart';
import 'package:aku_community_manager/provider/manage_provider.dart';
import 'package:aku_community_manager/provider/outdoor_provider.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/ui/home/home_page.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AmapCore.init('');
  await AmapLocation.instance.init(iosKey: '');
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
        ChangeNotifierProvider(create: (context) => GreenManageProvider()),
        ChangeNotifierProvider(create: (context) => InspectionManageProvider()),
        ChangeNotifierProvider(create: (context) => OutdoorProvider()),
        ChangeNotifierProvider(create: (context) => GreenManageProvider()),
        ChangeNotifierProvider(create: (context) => InspectionManageProvider()),
      ],
      child: GetMaterialApp(
        title: '小蜜蜂管家',
        home: HomePage(),
        builder: BotToastInit(),
        navigatorObservers: [
          BotToastNavigatorObserver(),
        ],
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('zh'),
        ],
      ),
    );
  }
}
