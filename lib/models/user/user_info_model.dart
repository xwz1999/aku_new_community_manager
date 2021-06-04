class UserInfoModel {
  int? id;
  String? roleId;
  String? nickName;
  List<int>? jurisdiction;

  ///派单(派单人)
  bool get canSendTicket => jurisdiction!.contains(52);

  ///接单（维修人）
  bool get canPickUpTicket => jurisdiction!.contains(53);

  ///放行（保安）
  bool get canPass => jurisdiction!.contains(55);

  ///操作权限（借还管理）
  bool get canOperation => jurisdiction!.contains(57);

  ///装修派工权限
  bool get canDecorationDispatch => jurisdiction!.contains(59);

  ///装修管理跟踪执行权限
  bool get canDecorationTrack => jurisdiction!.contains(60);

  ///管家
  bool get manager => canSendTicket && canPickUpTicket;

  UserInfoModel({required this.id, this.roleId, this.nickName, this.jurisdiction});

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
