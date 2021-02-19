import 'package:aku_community_manager/ui/home/home_page.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:power_logger/power_logger.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      if (mounted) PowerLogger.init(context);
    });
    Future.delayed(Duration(milliseconds: 3000), () {
      Get.to(HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
