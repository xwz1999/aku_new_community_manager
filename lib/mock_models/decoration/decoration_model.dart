enum DecorationType {
  ///
  WAIT_,

  ///已指派
  HAND_OUT,

  ///已执行
  DONE,
}

enum CHECK_TYPE {
  ELECTRIC,
  WATER,
  WALL,
  DOOR_AND_WINDOWS,
  SECURITY,
}

class DecorationModel {
  DateTime decorationDate;
  DateTime startDate;
  String checkCycle;
  UserHomeModel userHomeModel;
  DecorationTeamModel decorationTeamModel;
  List<CHECK_TYPE> checkTypes;
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
