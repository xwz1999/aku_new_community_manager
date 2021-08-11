enum HKAUTH {
  ///家政服务派单权限
  SEND,

  ///家政服务接单权限
  PICK,

  ///家政服务隐藏
  HIDE
}

///工程维修权限
enum ERAUTH {
  ///福航公司派单给维修公司
  SENDTOCOMPANY,

  ///维修公司派单给维修人员
  SENDTOPERSON,

  ///维修人员接单，
  PICK,

  ///无权限，隐藏入口
  HIDE
}

class UserInfoModel {
  int? id;
  String? roleId;
  String? nickName;
  List<int>? jurisdiction;

  ///报事报修派单(派单人)
  bool get canSendTicket => jurisdiction!.contains(52);

  ///报事报修接单（维修人）
  bool get canPickUpTicket => jurisdiction!.contains(53);

  ///放行（保安）
  bool get canPass => jurisdiction!.contains(55);

  ///操作权限（借还管理）
  bool get canOperation => jurisdiction!.contains(57);

  ///装修派工权限
  bool get canDecorationDispatch => jurisdiction!.contains(59);

  ///装修管理跟踪执行权限
  bool get canDecorationTrack => jurisdiction!.contains(60);

  ///报事报修管家
  bool get manager => canSendTicket && canPickUpTicket;

  ///隐藏报事报修
  bool get hideFix =>
      (!jurisdiction!.contains(53)) && (!jurisdiction!.contains(52));

  HKAUTH get houseKeepingAuthority {
    if (jurisdiction!.contains(68)) {
      return HKAUTH.PICK;
    } else if (jurisdiction!.contains(67)) {
      return HKAUTH.SEND;
    } else {
      return HKAUTH.HIDE;
    }
  }

  ERAUTH get engineeringRepairAuthority {
    if (jurisdiction!.contains(69)) {
      return ERAUTH.SENDTOCOMPANY;
    } else if (jurisdiction!.contains(70)) {
      return ERAUTH.SENDTOPERSON;
    } else if (jurisdiction!.contains(71)) {
      return ERAUTH.PICK;
    } else {
      return ERAUTH.HIDE;
    }
  }

  UserInfoModel(
      {required this.id, this.roleId, this.nickName, this.jurisdiction});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['roleId'];
    nickName = json['nickName'];
    if (json['jurisdiction'] != null)
      jurisdiction = json['jurisdiction'].cast<int>();
    else
      json['jurisdiction'] = [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['roleId'] = this.roleId;
    data['nickName'] = this.nickName;
    data['jurisdiction'] = this.jurisdiction;
    return data;
  }
}
