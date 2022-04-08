// Flutter imports:

// Project imports:
import 'package:aku_new_community_manager/provider/app_provider.dart';
import 'package:aku_new_community_manager/provider/data_provider.dart';
import 'package:aku_new_community_manager/provider/message_provider.dart';
import 'package:aku_new_community_manager/provider/user_provider.dart';
import 'package:aku_new_community_manager/style/apptheme.dart';
import 'package:aku_new_community_manager/tools/user_tool.dart';
import 'package:aku_new_community_manager/ui/splash/splash_page.dart';
import 'package:aku_new_community_manager/utils/dev_util.dart';
import 'package:aku_new_community_manager/utils/jpush_message_parse.dart';
import 'package:aku_new_community_manager/utils/websocket/fier_dialog.dart';
import 'package:aku_new_community_manager/utils/websocket/web_socket_util.dart';
// Package imports:
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:power_logger/power_logger.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  JPush jpush = new JPush();
  const isProduct =
      const bool.fromEnvironment('ISPRODUCT', defaultValue: false);
  DevUtil.setDev(!isProduct);
  WebSocketUtil().initWebSocket(
      // heartDuration: Duration(seconds: 5),
      onError: (e) {
    LoggerData.addData(e);
  }, onReceiveMes: (message) async {
    await FireDialog.fireAlert(message);
  });
  jpush.addEventHandler(
    // 接收通知回调方法。
    onReceiveNotification: (Map<String, dynamic>? message) async {
      print("flutter onReceiveNotification: $message");
      LoggerData.addData(message);
      await JpushMessageParse(message!).shot();
      UserTool.messageProvider.updateMessage();
    },
    // 点击通知回调方法。
    onOpenNotification: (Map<String, dynamic>? message) async {
      print("flutter onOpenNotification: $message");
    },
    // 接收自定义消息回调方法。
    onReceiveMessage: (Map<String, dynamic>? message) async {
      print("flutter onReceiveMessage: $message");
    },
  );
  jpush.setup(
    appKey: "27e128aa5a544a08e113f4e4",
    channel: "developer-default",
    production: false,
    debug: true, // 设置是否打印 debug 日志
  );
  String? id;
  JPush().getRegistrationID().then((value) => id = value);
  print('jpush RegistrationID is $id');
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
          ChangeNotifierProvider(create: (context) => MessageProvider()),
          ChangeNotifierProvider(create: (context) => DataProvider()),
        ],
        child: GestureDetector(
          onTap: () {
            //点击输入框外部隐藏键盘⌨️
            //只能响应点击非手势识别的组件
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: ScreenUtilInit(
              designSize: Size(750, 1334),
              builder: () {
                return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: '小蜜蜂管家',
                  theme: AppTheme.theme,
                  home: SplashPage(),
                  builder: (context, widget) {
                    ScreenUtil.setContext(context);
                    return MediaQuery(
                      //Setting font does not change with system font size
                      data:
                          MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: BotToastInit().call(context, widget),
                    );
                  },
                  navigatorObservers: [
                    BotToastNavigatorObserver(),
                  ],
                  localizationsDelegates: [
                    S.delegate,
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
