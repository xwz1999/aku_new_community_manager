// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:aku_community_manager/mock_models/decoration/decoration_model.dart';
import 'package:aku_community_manager/mock_models/users/user_info_model.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';

class DecorationUIUtil {
  BuildContext context;
  USER_ROLE get role =>
      Provider.of<UserProvider>(context, listen: false).userInfoModel.role;

  DecorationUIUtil(this.context);
  String getTagName(DecorationType type, DecorationStatusType statusType) {
    Map<DecorationType, String> managerMap = {
      DecorationType.WAIT_HAND_OUT: '待指派',
      DecorationType.HAND_OUT: '已指派',
      DecorationType.DONE: '已执行',
    };

    Map<DecorationType, String> fixerMap = {
      DecorationType.HAND_OUT: '待执行',
      DecorationType.DONE: '已执行',
    };

    Map<DecorationStatusType, String> defaultMap = {
      DecorationStatusType.DONE: '装修完成',
      DecorationStatusType.PROGRESS: '装修中',
    };

    switch (role) {
      case USER_ROLE.MANAGER:
        return managerMap[type];
        break;
      case USER_ROLE.PROPERTY:
        return fixerMap[type];
        break;
      default:
        return defaultMap[statusType];
        break;
    }
  }

  Color getTagColor(DecorationType type, DecorationStatusType statusType) {
    if (role == USER_ROLE.MANAGER || role == USER_ROLE.PROPERTY) {
      if (type == DecorationType.WAIT_HAND_OUT ||
          type == DecorationType.HAND_OUT) {
        return Color(0xFFFF4501);
      } else
        return AppStyle.minorTextColor;
    } else {
      if (statusType == DecorationStatusType.PROGRESS) {
        return Color(0xFFFF4501);
      } else
        return Color(0xFF32B814);
    }
  }
}
