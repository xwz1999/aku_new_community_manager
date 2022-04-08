// Flutter imports:
import 'dart:async';

import 'package:aku_new_community_manager/saas_models/login/community_model.dart';
import 'package:aku_new_community_manager/saas_models/login/history_login_model.dart';
import 'package:aku_new_community_manager/saas_models/login/picked_city_model.dart';
// Project imports:
import 'package:aku_new_community_manager/ui/home/application/applications_page.dart';
// Package imports:
import 'package:amap_flutter_location/amap_flutter_location.dart';
import 'package:amap_flutter_location/amap_location_option.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:power_logger/power_logger.dart';

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

  Map<String, Object>? _location;
  Map<String, Object>? get location => _location;
  late AMapFlutterLocation _flutterLocation;

  startLocation() {
    print('start location');
    _flutterLocation = AMapFlutterLocation();
    _flutterLocation.onLocationChanged().listen((event) {
      _location = event;
      LoggerData.addData(_location.toString());
      print('location' + _location.toString());
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

  WORKCLOCK _clockStatus = WORKCLOCK.NOTIN;
  DateTime? _clockInTime;
  DateTime? _clockOutTime;
  DateTime? _dateRecord;
  WORKCLOCK get clockStatus => _clockStatus;
  DateTime? get clockInTime => _clockInTime;
  DateTime? get clockOutTime => _clockOutTime;

  initClock() {
    if (_dateRecord == null ||
        (DateUtil.isToday(_dateRecord!.millisecondsSinceEpoch.abs()))) {
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

  ///saas
  ///历史登录信息
  HistoryLoginModel? _pickedCityAndCommunity;

  HistoryLoginModel? get pickedCityAndCommunity => _pickedCityAndCommunity;

  void setPickedCity({PickedCityModel? city, CommunityModel? community}) {
    if (city != null) {
      _pickedCityAndCommunity = HistoryLoginModel(cityModel: city);
    }
    if (community != null) {
      _pickedCityAndCommunity!.communityModel = community;
    }
    notifyListeners();
  }

  void resetPickedCity() {
    _pickedCityAndCommunity = null;
    notifyListeners();
  }

  ///登录页验证码计时器
  int second = 60;
  bool timerStart = false;
  Timer? timer;

  void startTimer() {
    timerStart = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (second > 0) {
        second--;
        notifyListeners();
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    second = 60;
    timerStart = false;
    timer?.cancel();
    timer = null;
    notifyListeners();
  }
}
