class SystemMessageDetailModel {
  int id;
  String name;
  String tel;
  int type;

  SystemMessageDetailModel({this.id, this.name, this.tel, this.type});

  SystemMessageDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tel = json['tel'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['tel'] = this.tel;
    data['type'] = this.type;
    return data;
  }
}
