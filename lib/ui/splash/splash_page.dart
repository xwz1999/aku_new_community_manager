// Flutter imports:
// Project imports:
import 'package:aku_new_community_manager/gen/assets.gen.dart';
import 'package:aku_new_community_manager/new_ui/auth/other_login_page.dart';
import 'package:aku_new_community_manager/provider/app_provider.dart';
import 'package:aku_new_community_manager/provider/user_provider.dart';
import 'package:aku_new_community_manager/tools/user_tool.dart';
import 'package:aku_new_community_manager/ui/agreements/agreement_page.dart';
import 'package:aku_new_community_manager/ui/agreements/privacy_page.dart';
import 'package:aku_new_community_manager/utils/dev_util.dart';
import 'package:aku_new_community_manager/utils/hive_store.dart';
import 'package:aku_new_community_manager/utils/websocket/fier_dialog.dart';
import 'package:aku_new_community_manager/utils/websocket/web_socket_util.dart';
import 'package:amap_flutter_location/amap_flutter_location.dart';
import 'package:equatable/equatable.dart';
// Package imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Response;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:power_logger/power_logger.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  TapGestureRecognizer _agreementRecognizer = TapGestureRecognizer();
  TapGestureRecognizer _privacyRecognizer = TapGestureRecognizer();

  // Future _initialization() async {
  //   await Firebase.initializeApp();
  //   FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  //   FlutterError.onError = (details) {
  //     FirebaseCrashlytics.instance.recordFlutterError(details);
  //   };
  // }

  Future<bool?> _showLoginVerify() async {
    return await showCupertinoDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('???????????????????????????'),
          content: RichText(
            text: TextSpan(
                text: '??????????????????????????????????????????',
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                      text: '??????????????????',
                      style: TextStyle(color: Colors.blue),
                      recognizer: _agreementRecognizer
                        ..onTap = () {
                          Get.to(() => AgreementPage());
                        }),
                  TextSpan(
                      text: '??????????????????',
                      style: TextStyle(color: Colors.blue),
                      recognizer: _privacyRecognizer
                        ..onTap = () {
                          Get.to(() => PrivacyPage());
                        }),
                  TextSpan(
                      style: TextStyle(color: Colors.black),
                      text:
                          '????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????')
                ]),
          ),

          // ),
          actions: [
            CupertinoDialogAction(
              child: Text('??????'),
              onPressed: () => Get.back(result: true),
            ),
            CupertinoDialogAction(
              child: Text('??????'),
              onPressed: () => Get.back(result: false),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1000), () async {
      //?????????HiveStore
      await Hive.initFlutter();
      await HiveStore.init();

      ///????????????
      var agreement = false;
      if (HiveStore.appBox!.containsKey('agreement')) {
        agreement = await HiveStore.appBox!.get('agreement');
      }
      if (!agreement) {
        var result = await _showLoginVerify();
        if (result == null || !result) {
          SystemNavigator.pop();

          HiveStore.appBox!.put('agreement', false);
        } else {
          HiveStore.appBox!.put('agreement', true);
        }
      }
      if (mounted) PowerLogger.start(context, debug: DevUtil.isDev);

      ///???????????????
      EquatableConfig.stringify = true;
      AMapFlutterLocation.updatePrivacyShow(true, true);
      AMapFlutterLocation.updatePrivacyAgree(true);
      WebSocketUtil().initWebSocket(
        consolePrint: false,
        onReceiveMes: (message) async {
          await FireDialog.fireAlarm(message);
        },
        onError: (e) {
          LoggerData.addData(e);
        },
      );

      ///??????????????????
      // await Permission.locationWhenInUse.request();
      // final appProvider = Provider.of<AppProvider>(context, listen: false);
      // appProvider.startLocation();

      ///??????????????????
      await UserTool.dataProvider.init();

      ///?????????????????????????????????
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      if (HiveStore.appBox!.containsKey('token')) {
        await userProvider.setLogin(HiveStore.appBox!.get('token'));
      } else {
        Get.to(() => OtherLoginPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        //future: _initialization(),
        builder: (context, snapshot) {
          return Center(
            child: Assets.newIcon.splash.image(),
          );
        },
      ),
    );
  }
}
