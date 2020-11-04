import 'package:aku_community_manager/mock_models/fix/fix_model.dart';
import 'package:aku_community_manager/mock_models/fix/fixer_model.dart';
import 'package:aku_community_manager/mock_models/users/user_info_model.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FixProvider extends ChangeNotifier {
  List<FixModel> _fixModels = FixModel.initList();
  List<FixModel> get fixModels => _fixModels;
  addFixModel(FixModel model) {
    _fixModels.insert(0, model);
    notifyListeners();
  }

  List<FixModel> getFixModel(int index, BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    USER_ROLE role = userProvider.userInfoModel.role;
    List<FixModel> _doneModels =
        _fixModels.where((element) => element.type == FIX_ENUM.DONE).toList();

    List<FixModel> _processingModels = _fixModels
        .where((element) => element.type == FIX_ENUM.PROCESSING)
        .toList();

    List<FixModel> _handOutModels = _fixModels
        .where((element) => element.type == FIX_ENUM.HAND_OUT)
        .toList();

    List<FixModel> _waitPickUpModels = _fixModels
        .where((element) => element.type == FIX_ENUM.WAIT_PICKUP)
        .toList();

    List<FixModel> _fixerModels = _fixModels
        .where((element) => element.type != FIX_ENUM.HAND_OUT)
        .toList();

    switch (role) {
      case USER_ROLE.MANAGER:
        return [
          _handOutModels,
          _waitPickUpModels,
          _processingModels,
          _doneModels,
          _fixModels,
        ][index];
        break;

      default:
        return [
          _waitPickUpModels,
          _processingModels,
          _doneModels,
          _fixerModels,
        ][index];
        break;
    }
  }

  List<FixerTypedModel> _fixerModels = FixerTypedModel.models;
  List<FixerTypedModel> get fixerModels => _fixerModels;
}
