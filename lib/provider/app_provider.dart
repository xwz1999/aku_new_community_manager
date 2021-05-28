// Flutter imports:
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:amap_flutter_location/amap_flutter_location.dart';
import 'package:amap_flutter_location/amap_location_option.dart';
import 'package:dio/dio.dart';

// Project imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/ui/home/application/applications_page.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';

enum WORKCLOCK {
  ///未上班打卡状态
  NOTIN,

  ///已上班打卡
  IN,

  ///已下班打卡
  OUT,
}

class AppProvider extends ChangeNotifier {
  List<AppApplication> _recentUsedApp = [];
  List<AppApplication> get recentUsedApp => _recentUsedApp;

  ///添加最近使用的应用
  addRecentApp(AppApplication app) {
    if (_recentUsedApp.indexWhere((element) => element.name == app.name) ==
        -1) {
      if (_recentUsedApp.length >= 4) _recentUsedApp.removeLast();
      _recentUsedApp.insert(0, app);
    } else {
      _recentUsedApp.removeWhere((element) => element.name == app.name);
      _recentUsedApp.insert(0, app);
    }
    notifyListeners();
  }

  ///清除最近使用应用
  clearRecentApp() {
    _recentUsedApp.clear();
    notifyListeners();
  }

  Map<String, Object> _location;
  Map<String, Object> get location => _location;
  AMapFlutterLocation _flutterLocation;

  startLocation() {
    _flutterLocation = AMapFlutterLocation();
    _flutterLocation.onLocationChanged().listen((event) {
      _location = event;
      if (_location != null) {
        stopLocation();
      }
    });
    _flutterLocation.setLocationOption(
        AMapLocationOption(onceLocation: true, needAddress: true));
    _flutterLocation.startLocation();
  }

  stopLocation() {
    _flutterLocation.stopLocation();
    _flutterLocation.destroy();
  }

  int _sysMessage = 0;
  int _commentMessage = 0;
  bool get hasMessage => _sysMessage != 0 || _commentMessage != 0;
  int get sysMessage => _sysMessage;
  int get commentMessage => _commentMessage;

  updateMessage() async {
    Response response = await NetUtil().dio.get(API.message.messageCenter);
    if (response == null || response.data == null) return;
    _sysMessage = response.data['sysCount'] ?? 0;
    _commentMessage = response.data['commentCount'] ?? 0;
    notifyListeners();
  }

  WORKCLOCK _clockStatus = WORKCLOCK.NOTIN;
  DateTime _clockInTime;
  DateTime _clockOutTime;
  DateTime _dateRecord;
  WORKCLOCK get clockStatus => _clockStatus;
  DateTime get clockInTime => _clockInTime;
  DateTime get clockOutTime => _clockOutTime;

  initClock() {
    if (_dateRecord == null ||
        (DateUtil.isToday(_dateRecord.millisecondsSinceEpoch.abs()))) {
      resetClock();
    }

    if (_dateRecord == null ||
        (!DateUtils.isSameDay(_dateRecord, DateTime.now()))) {
      resetClock();
    }
  }

  setClockInTime(DateTime dateTime) {
    if (_clockStatus == WORKCLOCK.NOTIN) {
      _dateRecord = dateTime;
      _clockInTime = dateTime;
      _clockStatus = WORKCLOCK.IN;
    }
    notifyListeners();
  }

  setClockOutTime(DateTime dateTime) {
    // if (_dateRecord != null &&
    //     (_dateRecord !=
    //         DateTime.utc(DateTime.now().year, DateTime.now().month,
    //             DateTime.now().day))) {
    //   resetClock();
    // }
    if (_dateRecord != null &&
        (!DateUtils.isSameDay(_dateRecord, DateTime.now()))) {
      resetClock();
    }
    if (_clockStatus == WORKCLOCK.IN) {
      _dateRecord = dateTime;
      _clockOutTime = dateTime;
      _clockStatus = WORKCLOCK.OUT;
    }
    notifyListeners();
  }

  resetClock() {
    _clockInTime = null;
    _clockOutTime = null;
    _clockStatus = WORKCLOCK.NOTIN;
    notifyListeners();
  }
}
