// Flutter imports:
// Project imports:
import 'package:aku_new_community_manager/provider/user_provider.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:provider/provider.dart';

class DecorationUIUtil {
  BuildContext context;
  UserProvider get userProvider =>
      Provider.of<UserProvider>(context, listen: false);

  DecorationUIUtil(this.context);
  String getTagName(int operationStatus, int status, {int? tracker}) {
    // Map<DecorationType, String> managerMap = {
    //   DecorationType.WAIT_HAND_OUT: '待指派',
    //   DecorationType.HAND_OUT: '已指派',
    //   DecorationType.DONE: '已执行',
    // };

    // Map<DecorationType, String> fixerMap = {
    //   DecorationType.HAND_OUT: '待执行',
    //   DecorationType.DONE: '已执行',
    // };

    // Map<DecorationStatusType, String> defaultMap = {
    //   DecorationStatusType.DONE: '装修完成',
    //   DecorationStatusType.PROGRESS: '装修中',
    // };

    // switch (role) {
    //   case USER_ROLE.MANAGER:
    //     return managerMap[type];
    //     break;
    //   case USER_ROLE.PROPERTY:
    //     return fixerMap[type];
    //     break;
    //   default:
    //     return defaultMap[statusType];
    //     break;
    // }
    switch (operationStatus) {
      case 1:
        if (tracker == null && status > 1) {
          return '待指派';
        } else {
          return '未知';
        }
      case 2:
        if (status < 5) {
          if (userProvider.userInfoModel!.type == 1) {
            return '已指派';
          } else {
            return '待执行';
          }
        } else {
          return '未知';
        }
      case 3:
        if (status >= 5) {
          return '已完成';
        } else {
          return '未知';
        }
      default:
        return '未知';
    }
  }

  Color getTagColor(int operationStatus) {
    //   if (role == USER_ROLE.MANAGER || role == USER_ROLE.PROPERTY) {
    //     if (type == DecorationType.WAIT_HAND_OUT ||
    //         type == DecorationType.HAND_OUT) {
    //       return Color(0xFFFF4501);
    //     } else
    //       return AppStyle.minorTextColor;
    //   } else {
    //     if (statusType == DecorationStatusType.PROGRESS) {
    //       return Color(0xFFFF4501);
    //     } else
    //       return Color(0xFF32B814);
    //   }
    // }
    switch (operationStatus) {
      case 1:
      case 2:
        return Color(0xFFFF4501);
      case 3:
        return Color(0xFF32B814);
      default:
        return Color(0xFFFF4501);
    }
  }

  Map<int, String> stautsToString = {
    -1: '申请中',
    -2: '申请未通过',
    -3: '申请通过',
    1: '已付押金',
    2: '装修中',
    3: '完工检查申请中',
    4: '完工检查不通过',
    5: '完工检查通过',
    6: '申请退款中',
    7: '装修结束',
    8: '已作废',
  };
  String? getDecorationStatus(int status) {
    return stautsToString[status];
  }
}
