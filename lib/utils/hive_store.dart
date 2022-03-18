// Package imports:
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
      Hive.init(dir.path);
      _appBox = await Hive.openBox('app');
      _dataBox = await Hive.openBox('dataBox');
    }
  }
}
