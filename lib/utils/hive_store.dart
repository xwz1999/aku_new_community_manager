// Package imports:
import 'package:aku_new_community_manager/saas_models/login/china_region_model.dart';
import 'package:aku_new_community_manager/saas_models/login/history_login_model.dart';
import 'package:aku_new_community_manager/saas_models/login/picked_city_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveStore {
  static Box? _appBox;

  static Box? get appBox => _appBox;

  static Box? _dataBox;

  static Box? get dataBox => _dataBox;

  static Future init() async {
    if (!kIsWeb) {
      var dir = await getApplicationDocumentsDirectory();
      Hive.registerAdapter(ChinaRegionModelAdapter()); //HiveTypeId:3
      Hive.registerAdapter(HistoryLoginModelAdapter()); //HiveTypeId:4
      Hive.registerAdapter(PickedCityModelAdapter()); //HiveTypeId:6
      Hive.init(dir.path);
      _appBox = await Hive.openBox('app');
      _dataBox = await Hive.openBox('dataBox');
    }
  }
}
