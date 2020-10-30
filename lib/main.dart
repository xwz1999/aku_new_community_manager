import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/ui/home/home_page.dart';
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
      providers:[
        ChangeNotifierProvider(create: (context)=>UserProvider()),
      ],
          child: GetMaterialApp(
        title: '小蜜蜂管家',
        home: HomePage(),
        
      ),
    );
  }
}
