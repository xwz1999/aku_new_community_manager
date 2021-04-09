// Flutter imports:
import 'package:aku_community_manager/models/announce/announcement_detail_model.dart';
import 'package:aku_community_manager/models/announce/announcement_list_model.dart';
import 'package:flutter/material.dart';

// Project imports:

class AnouncementProvider extends ChangeNotifier {
  List<AnnouncementListModel> _anouncementCardModel = [];
  List<AnnouncementListModel> get anouncementCardModels =>
      _anouncementCardModel;
  addAnouncementCardModel(AnnouncementListModel model) {
    _anouncementCardModel.insert(0, model);
    notifyListeners();
  }
}
