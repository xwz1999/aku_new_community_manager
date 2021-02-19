import 'package:aku_community_manager/mock_models/outdoor_models/outdoor_model.dart';
import 'package:flutter/material.dart';

class OutdoorProvider extends ChangeNotifier {
  List<ItemsOutdoorModel> _itemOutdoorModel = ItemsOutdoorModel.initList();
  List<ItemsOutdoorModel> get itemOutdoorModels => _itemOutdoorModel;
  addOutdoormodel(ItemsOutdoorModel model) {
    _itemOutdoorModel.insert(0, model);
    notifyListeners();
  }

  List<ItemsOutdoorModel> getOutdoorModels(int index) {
    return [
      _itemOutdoorModel
          .where((element) => element.status == OUTDOORSTATUS.NOT_OUT)
          .toList(),
      _itemOutdoorModel
          .where((element) => element.status == OUTDOORSTATUS.OUT_DONE)
          .toList(),
      _itemOutdoorModel
          .where((element) => element.status == OUTDOORSTATUS.REJECTED)
          .toList(),
      _itemOutdoorModel
          .where((element) => element.status == OUTDOORSTATUS.CANCELLATION)
          .toList(),
      _itemOutdoorModel,
    ][index];
  }
}
