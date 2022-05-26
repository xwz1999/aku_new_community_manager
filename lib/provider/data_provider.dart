import 'package:aku_new_community_manager/const/saas_api.dart';
import 'package:aku_new_community_manager/saas_models/login/china_region_model.dart';
import 'package:aku_new_community_manager/saas_models/login/history_login_model.dart';
import 'package:aku_new_community_manager/tools/user_tool.dart';
import 'package:aku_new_community_manager/utils/hive_store.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  Future init() async {
    _loginHistories = HiveStore.dataBox!
            .get('historyLogin')
            ?.cast<HistoryLoginModel>()
            .toList() ??
        [];
    _cityModel =
        HiveStore.dataBox!.get('cities')?.cast<ChinaRegionModel>().toList() ??
            [];
    if (_cityModel.isEmpty) {
      updateCityList();
    }
  }

  List<ChinaRegionModel> _cityModel = [];

  List<ChinaRegionModel> get cityModel => _cityModel;

  Future<bool> updateCityList() async {
    var model = await NetUtil().get(SAASAPI.login.allCity);
    if (model.success) {
      _cityModel = (model.data as List)
          .map((e) => ChinaRegionModel.fromJson(e))
          .toList();
      HiveStore.dataBox!.put('cities', _cityModel);
      return true;
    } else {
      return false;
    }
  }

  List<HistoryLoginModel> _loginHistories = [];

  List<HistoryLoginModel> get loginHistories => _loginHistories;

  Future addHistories() async {
    if (!_loginHistories
        .contains(UserTool.appProvider.pickedCityAndCommunity!)) {
      _loginHistories.insert(0, UserTool.appProvider.pickedCityAndCommunity!);
      if (_loginHistories.length > 4) {
        _loginHistories.removeAt(_loginHistories.length - 1);
      }
      HiveStore.dataBox!.put('historyLogin', _loginHistories);

    }
  }
}
