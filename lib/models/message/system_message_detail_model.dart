class SystemMessageDetailModel {
  int? id;
  String? name;
  String? tel;
  int? type;

  SystemMessageDetailModel({required this.id, this.name, this.tel, this.type});

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
  String get sysMesTypeString {
    switch (this.type) {
      case 1:
        return '报事报修';
      case 2:
        return '装修';
      case 3:
        return '绿化任务';
      case 4:
        return '卫生任务';
      default:
        return '未知';
    }
  }
}

