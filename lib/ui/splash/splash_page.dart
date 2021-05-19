// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get/get.dart' hide Response;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:power_logger/power_logger.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:aku_community_manager/provider/app_provider.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/home/home_page.dart';
import 'package:aku_community_manager/utils/dev_util.dart';
import 'package:aku_community_manager/utils/hive_store.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future _originOp() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    //初始化HiveStore
    await Hive.initFlutter();
    await HiveStore.init();
    if (HiveStore.appBox.containsKey('token')) {
      await userProvider.setLogin(HiveStore.appBox.get('token'));
    }

    //初始化AMap
    // await AmapLocation.instance.init(iosKey: 'ios key');
    await Permission.locationWhenInUse.request();
  }

  Future _initialization() async {
    await Firebase.initializeApp();
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = (details) {
      FirebaseCrashlytics.instance.recordFlutterError(details);
    };
  }

  Future _initOp() async {
    await _originOp();
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    appProvider.startLocation();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      if (mounted) PowerLogger.start(context, debug: DevUtil.isDev);
    });
    Future.delayed(Duration(milliseconds: 2000), () async {
      await _initOp();

      Get.off(HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initialization(),
        builder: (context, snapshot) {
          return Center(
            child: Image.asset(R.ASSETS_PLACEHOLDER_WEBP),
          );
        },
      ),
    );
  }
}
