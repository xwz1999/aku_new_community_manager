import 'package:aku_community_manager/ui/manage_pages/clock_in_out/clock_in_out_apply_card.dart';
import 'package:aku_community_manager/ui/manage_pages/clock_in_out/clock_in_out_record_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClockInOutView extends StatefulWidget {
  final int index;
  ClockInOutView({Key key, this.index}) : super(key: key);

  @override
  _ClockInOutViewState createState() => _ClockInOutViewState();
}

class _ClockInOutViewState extends State<ClockInOutView> {
  @override
  Widget build(BuildContext context) {
    return widget.index == 1
        ? ListView(
            padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
            children: [
              ClockInOutRecordCard(),
            ],
          )
        : ListView(
           padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
            children: [
              ClockInOutApplyCard(),
            ],
        );
  }
}
