import 'package:aku_community_manager/mock_models/fix/fixer_model.dart';
import 'package:flutter/material.dart';
import 'package:aku_community_manager/const/resource.dart';

enum DecorationType {
  ///待指派
  WAIT_HAND_OUT,

  ///已指派&待执行
  HAND_OUT,

  ///已执行
  DONE,
}

enum DecorationStatusType {
  PROGRESS,
  DONE,
}

enum CHECK_TYPE {
  ELECTRIC,
  WATER,
  WALL,
  DOOR_AND_WINDOWS,
  SECURITY,
}

Map<CHECK_TYPE, String> checkTypeMap = {
  CHECK_TYPE.ELECTRIC: '电路',
  CHECK_TYPE.WATER: '水路',
  CHECK_TYPE.WALL: '墙面',
  CHECK_TYPE.DOOR_AND_WINDOWS: '门窗',
  CHECK_TYPE.SECURITY: '安防',
};

Map<String, CHECK_TYPE> checkTypeStringMap = {
  '电路': CHECK_TYPE.ELECTRIC,
  '水路': CHECK_TYPE.WATER,
  '墙面': CHECK_TYPE.WALL,
  '门窗': CHECK_TYPE.DOOR_AND_WINDOWS,
  '安防': CHECK_TYPE.SECURITY,
};

Map<CHECK_TYPE, String> checkAssetMap = {
  CHECK_TYPE.ELECTRIC: R.ASSETS_MANAGE_CIRCUIT_PNG,
  CHECK_TYPE.WATER: R.ASSETS_MANAGE_WATERWAY_PNG,
  CHECK_TYPE.WALL: R.ASSETS_MANAGE_WALL_PNG,
  CHECK_TYPE.DOOR_AND_WINDOWS: R.ASSETS_MANAGE_WINDOW_PNG,
  CHECK_TYPE.SECURITY: R.ASSETS_MANAGE_SECURITY_PNG,
};

class DecorationModel {
  DecorationType type;
  DecorationStatusType statusType;
  DateTime decorationDate;
  UserHomeModel userHomeModel;
  DecorationTeamModel decorationTeamModel;
  CycleCheck cycleCheck;
  WorkFinishCheck workFinishCheck;
  List<CheckInfomation> checkInfomations;

  String get statusTypeValue {
    if (statusType == DecorationStatusType.PROGRESS)
      return '装修中';
    else
      return '装修完成';
  }

  DecorationModel({
    @required this.type,
    @required this.statusType,
    @required this.userHomeModel,
    @required this.decorationTeamModel,
    @required this.decorationDate,
    this.cycleCheck,
    this.workFinishCheck,
    this.checkInfomations,
  });
}

///用户家庭信息
class UserHomeModel {
  String plot;
  String detailAddr;
  String userName;
  String phone;
  UserHomeModel({
    this.plot,
    this.detailAddr,
    this.userName,
    this.phone,
  });
}

///装修队伍信息
class DecorationTeamModel {
  String name;
  String userName;
  String phone;
  DecorationTeamModel({
    this.name,
    this.userName,
    this.phone,
  });
}

///周期检查
class CycleCheck {
  FixerModel authPerson;
  DateTime startDate;

  ///check cycle in days
  int checkCycle;
  List<CHECK_TYPE> checkDetails;
  CycleCheck({
    this.authPerson,
    this.startDate,
    this.checkCycle,
    this.checkDetails,
  });
}

class WorkFinishCheck {
  FixerModel authPerson;
  DateTime startDate;
  List<CHECK_TYPE> checkDetails;
  WorkFinishCheck({
    this.authPerson,
    this.startDate,
    this.checkDetails,
  });
}

///周期检查细节
class CheckInfomation {
  DateTime checkDate;
  List<CheckDetail> details;
  String info;
  String checkType;
  CheckInfomation({
    this.checkDate,
    this.info,
    this.details,
    this.checkType,
  });

  ///检查结果
  bool get checkAllResult {
    for (var item in details) {
      if (!item.status) return false;
    }
    return true;
  }
}

class CheckDetail {
  CHECK_TYPE type;
  bool status;
  String get assetpath => checkAssetMap[type];
  CheckDetail({
    @required this.type,
    this.status = true,
  });
  String get typeValue => checkTypeMap[type];
}
