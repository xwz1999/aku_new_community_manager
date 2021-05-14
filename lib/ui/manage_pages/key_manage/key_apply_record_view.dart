import 'package:aku_community_manager/ui/manage_pages/key_manage/key_apply_record_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KeyApplyRecordView extends StatefulWidget {
  final int index;
  KeyApplyRecordView({Key key, this.index}) : super(key: key);

  @override
  _KeyApplyRecordViewState createState() => _KeyApplyRecordViewState();
}

class _KeyApplyRecordViewState extends State<KeyApplyRecordView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 24.w,horizontal: 32.w),
      children: [
        KeyApplyRecordCard(
          index: widget.index,
        )
      ],
    );
  }
}
