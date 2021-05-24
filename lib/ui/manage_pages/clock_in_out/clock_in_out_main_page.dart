import 'dart:async';

import 'package:aku_community_manager/provider/app_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/user_tool.dart';
import 'package:aku_community_manager/utils/weekdays_to_chinese.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class ClockInOutMainPage extends StatefulWidget {
  ClockInOutMainPage({Key key}) : super(key: key);

  @override
  _ClockInOutMainPageState createState() => _ClockInOutMainPageState();
}

class _ClockInOutMainPageState extends State<ClockInOutMainPage> {
  EasyRefreshController _refreshController;
  Timer _clockSetState;
  DateTime _lastPressed;
  bool get canTap {
    if (_lastPressed == null ||
        DateTime.now().difference(_lastPressed) > Duration(seconds: 15)) {
      //两次点击间隔超过15秒重新计算
      _lastPressed = DateTime.now();
      return true;
    }

    BotToast.showText(text: '15s内不可再次打卡');
    return false;
  }

  @override
  void initState() {
    super.initState();
    _refreshController = EasyRefreshController();
    _clockSetState = Timer.periodic(Duration(seconds: 1), (_timer) {
      setState(() {});
    });
    UserTool.appProvider.initClock();
  }

  @override
  void dispose() {
    _refreshController?.dispose();
    _clockSetState?.cancel();
    _clockSetState = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      firstRefresh: true,
      header: MaterialHeader(),
      controller: _refreshController,
      onRefresh: () async {},
      child: Container(
        margin: EdgeInsets.all(32.w),
        padding: EdgeInsets.all(32.w),
        width: double.infinity,
        child: Column(
          children: [
            DateUtil.formatDate(DateTime.now(), format: 'yyyy.MM.dd')
                .text
                .size(28.sp)
                .color(kTextPrimaryColor)
                .make(),
            16.w.heightBox,
            WeekDaysToChinese.fromString(DateUtil.getWeekday(DateTime.now()))
                .text
                .size(24.sp)
                .color(kTextPrimaryColor)
                .make(),
            64.w.heightBox,
            Row(
              children: [
                _buildCard(0, time: UserTool.appProvider.clockInTime),
                Spacer(),
                _buildCard(1, time: UserTool.appProvider.clockOutTime)
              ], //上班打卡为‘type’0.下班打卡为1
            ),
            150.w.heightBox,
            _buildClock(),
            65.w.heightBox,
            '今日工时'.text.size(24.sp).bold.color(kTextSubColor).make(),
            '共$getWorkHours'.text.size(24.sp).bold.color(kTextSubColor).make(),
          ],
        ),
      ),
    );
  }

  clockInOut() {
    switch (UserTool.appProvider.clockStatus) {
      case WORKCLOCK.NOTIN:
        UserTool.appProvider.setClockInTime(DateTime.now());
        BotToast.showText(text: '上班打卡成功');
        break;
      case WORKCLOCK.IN:
        UserTool.appProvider.setClockOutTime(DateTime.now());
        BotToast.showText(text: '下班打卡成功');
        break;
      case WORKCLOCK.OUT:
        BotToast.showText(text: '今日已打卡');
        break;
      default:
        BotToast.showText(text: '未知错误');
    }
  }

  Widget _buildClock() {
    return GestureDetector(
      onTap: () {
        canTap ? clockInOut() : null;
      },
      child: Container(
        width: 400.w,
        height: 400.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200.w),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF50EAA0), Color(0xFF2EA9A2)]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            '打卡'.text.size(56.sp).color(Colors.white).bold.make(),
            20.w.heightBox,
            DateUtil.formatDate(DateTime.now(), format: 'HH:mm:ss')
                .text
                .size(36.sp)
                .color(Color(0x99FFFFFF))
                .bold
                .make()
          ],
        ),
      ).material(),
    );
  }

  Widget _buildCard(int type, {DateTime time}) {
    return Container(
      width: 296.w,
      height: 131.w,
      decoration: BoxDecoration(
        color: Color(0x66666666),
        borderRadius: BorderRadius.circular(8.w),
      ),
      padding: EdgeInsets.all(16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          time == null
              ? SizedBox()
              : Container(
                  margin: EdgeInsets.symmetric(vertical: 14.w),
                  width: 22.w,
                  height: 22.w,
                  decoration: BoxDecoration(
                    color: Color(0x990257FB),
                    borderRadius: BorderRadius.circular(11.w),
                  ),
                  child: Icon(
                    CupertinoIcons.checkmark_alt,
                    size: 18.w,
                    color: Colors.white,
                  ),
                ),
          12.w.widthBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: time == null
                  ? [
                      Center(
                          child: (type == 0 ? '上班未打卡' : '下班未打卡')
                              .text
                              .size(32.sp)
                              .bold
                              .color(kTextPrimaryColor)
                              .make()),
                    ]
                  : [
                      (type == 0 ? '打卡上班' : '打卡下班')
                          .text
                          .size(28.sp)
                          .bold
                          .color(kTextSubColor)
                          .make(),
                      12.w.heightBox,
                      DateUtil.formatDate(time, format: 'HH:mm:ss')
                          .text
                          .size(32.sp)
                          .bold
                          .color(kTextPrimaryColor)
                          .make()
                    ],
            ),
          )
        ],
      ),
    );
  }

  String get getWorkHours {
    int _hour = 0;
    int _min = 0;
    if (UserTool.appProvider.clockInTime != null) {
      int _time = (UserTool.appProvider.clockOutTime == null
              ? DateTime.now()
              : UserTool.appProvider.clockOutTime)
          .difference(UserTool.appProvider.clockInTime)
          .inMinutes;
      print(_time);
      _hour = _time ~/ 60;
      _min = _time % 60;
    }
    return '$_hour小时$_min分钟';
  }
}