// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:power_logger/power_logger.dart';

// Project imports:
import 'package:aku_community_manager/ui/home/home_page.dart';
import 'package:aku_community_manager/utils/hive_store.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future _originOp() async {
    //初始化HiveStore
    await Hive.initFlutter();
    await HiveStore.init();

    //初始化AMap
    await AmapLocation.instance.init(iosKey: 'ios key');
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      if (mounted) PowerLogger.init(context);
    });
    Future.delayed(Duration(milliseconds: 2000), () async {
      await _originOp();
      Get.to(HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
