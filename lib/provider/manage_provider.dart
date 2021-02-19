// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:aku_community_manager/mock_models/manage_models/manage_model.dart';

class GreenManageProvider extends ChangeNotifier {
  List<GreenManageCardModel> _greenManageModel =
      GreenManageCardModel.initList();
  List<GreenManageCardModel> get greenManageModels => _greenManageModel;
  notifyListeners();
}

class InspectionManageProvider extends ChangeNotifier {
  List<InspectionManageCardModel> _inspectionManageModel =
      InspectionManageCardModel.initList();
  List<InspectionManageCardModel> get inspectionManageModels =>
      _inspectionManageModel;
  notifyListeners();
}
