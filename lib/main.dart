// Flutter imports:
import 'package:aku_community_manager/style/apptheme.dart';
import 'package:aku_community_manager/utils/dev_util.dart';
import 'package:aku_community_manager/utils/jpush_message_parse.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:power_logger/power_logger.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:aku_community_manager/provider/app_provider.dart';
import 'package:aku_community_manager/provider/fix_provider.dart';
import 'package:aku_community_manager/provider/manage_provider.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/ui/splash/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await AmapCore.init('');
  // await AmapLocation.instance.init(iosKey: '');
  JPush jpush = new JPush();
  DevUtil.setDev(true);
  jpush.addEventHandler(
    // 接收通知回调方法。
    onReceiveNotification: (Map<String, dynamic> message) async {
      print("flutter onReceiveNotification: $message");
      LoggerData.addData(message);
      await JpushMessageParse(message).shot();
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
  String id = await JPush().getRegistrationID();
  print(id);
  LoggerData.addData(id);
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
          ChangeNotifierProvider(
              create: (context) => InspectionManageProvider()),
          ChangeNotifierProvider(create: (context) => GreenManageProvider()),
          ChangeNotifierProvider(
              create: (context) => InspectionManageProvider()),
        ],
        child: GestureDetector(
          onTap: () {
            //点击输入框外部隐藏键盘⌨️
            //只能响应点击非手势识别的组件
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus.unfocus();
            }
          },
          child: ScreenUtilInit(
              designSize: Size(750, 1334),
              builder: () {
                return GetMaterialApp(
                  title: '小蜜蜂管家',
                  theme: AppTheme.themeData,
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
                );
              }),
        ));
  }
}
