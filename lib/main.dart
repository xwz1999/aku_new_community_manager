// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:aku_community_manager/provider/anouncement_provider.dart';
import 'package:aku_community_manager/provider/app_provider.dart';
import 'package:aku_community_manager/provider/fix_provider.dart';
import 'package:aku_community_manager/provider/manage_provider.dart';
import 'package:aku_community_manager/provider/outdoor_provider.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/ui/splash/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AmapCore.init('');
  await AmapLocation.instance.init(iosKey: '');
  JPush jpush = new JPush();
  jpush.addEventHandler(
    // 接收通知回调方法。
    onReceiveNotification: (Map<String, dynamic> message) async {
      print("flutter onReceiveNotification: $message");
    },
    // 点击通知回调方法。
    onOpenNotification: (Map<String, dynamic> message) async {
      print("flutter onOpenNotification: $message");
    },
    // 接收自定义消息回调方法。
    onReceiveMessage: (Map<String, dynamic> message) async {
      print("flutter onReceiveMessage: $message");
    },
  );
  jpush.setup(
    appKey: "99067fe33fa04aad88c3acac",
    channel: "developer-default",
    production: false,
    debug: true, // 设置是否打印 debug 日志
  );
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
        ChangeNotifierProvider(create: (context) => AnouncementProvider()),
      ],
      child: GetMaterialApp(
        title: '小蜜蜂管家',
        home: SplashPage(),
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
