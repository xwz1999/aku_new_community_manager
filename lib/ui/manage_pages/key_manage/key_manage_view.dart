// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:aku_community_manager/ui/manage_pages/key_manage/key_manage_card.dart';

class KeyManageView extends StatefulWidget {
  final int index;
  KeyManageView({Key key, this.index}) : super(key: key);

  @override
  _KeyManageViewState createState() => _KeyManageViewState();
}

class _KeyManageViewState extends State<KeyManageView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(32.w),
      children: [
        KeyManageCard(
          index: widget.index,
        )
      ],
    );
  }
}
