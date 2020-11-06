import 'package:aku_community_manager/mock_models/anouncement/anouncement_model.dart';
import 'package:flutter/material.dart';

class AnouncementProvider extends ChangeNotifier{
  List<AnouncementCardModel> _anouncementCardModel=AnouncementCardModel.initList();
  List<AnouncementCardModel> get anouncementCardModels =>_anouncementCardModel;
addAnouncementCardModel(AnouncementCardModel model){

  _anouncementCardModel.insert(0, model);
  notifyListeners();
}
}