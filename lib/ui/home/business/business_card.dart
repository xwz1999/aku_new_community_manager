// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:aku_new_community_manager/tools/screen_tool.dart';

class BusinessCard extends StatefulWidget {
  BusinessCard({Key? key}) : super(key: key);

  @override
  _BusinessCardState createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.w),
    );
  }
}
