class UserInfoModel {
  int id;
  String roleId;
  String nickName;
  List<int> jurisdiction;

  UserInfoModel({this.id, this.roleId, this.nickName, this.jurisdiction});

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
