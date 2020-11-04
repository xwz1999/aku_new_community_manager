
import 'package:aku_community_manager/mock_models/manage_models/green_manage_model.dart';
import 'package:flutter/material.dart';
class GreenManageProvider extends ChangeNotifier{
  List<GreenManageCardModel> _greenManageModel =GreenManageCardModel.initList();
  List<GreenManageCardModel> get greenManageModels => _greenManageModel;
  notifyListeners();
}