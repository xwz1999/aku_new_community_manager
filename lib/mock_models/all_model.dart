import 'package:aku_community_manager/mock_models/decoration/decoration_data.dart';
import 'package:aku_community_manager/mock_models/decoration/decoration_model.dart';
import 'package:aku_community_manager/mock_models/fix/fix_model.dart';
import 'package:aku_community_manager/provider/fix_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllModel {
  BuildContext context;
  AllModel(this.context);

  List get allThings {
    final fixProvider = Provider.of<FixProvider>(context, listen: false);
    return [
      ...fixProvider.fixModels,
      ...DecorationData.allModels,
    ];
  }

  List get waitThings {
    final fixProvider = Provider.of<FixProvider>(context, listen: false);
    return [
      ...fixProvider.fixModels.where((element) {
        return element.type == FIX_ENUM.WAIT_PICKUP;
      }).toList(),
      ...DecorationData.getModels(DecorationType.WAIT_HAND_OUT),
    ];
  }

  List get processingThings {
    final fixProvider = Provider.of<FixProvider>(context, listen: false);
    return [
      ...fixProvider.fixModels.where((element) {
        return element.type == FIX_ENUM.PROCESSING;
      }).toList(),
      ...DecorationData.getModels(DecorationType.HAND_OUT),
    ];
  }

  List get doneThings {
    final fixProvider = Provider.of<FixProvider>(context, listen: false);
    return [
      ...fixProvider.fixModels.where((element) {
        return element.type == FIX_ENUM.DONE;
      }).toList(),
      ...DecorationData.getModels(DecorationType.DONE),
    ];
  }
}
