// Flutter imports:
import 'package:amap_flutter_location/amap_flutter_location.dart';
import 'package:amap_flutter_location/amap_location_option.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:aku_community_manager/ui/home/application/applications_page.dart';

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
}
