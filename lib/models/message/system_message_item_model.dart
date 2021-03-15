class SystemMessageItemModel {
  int id;
  int type;
  int relationId;

  SystemMessageItemModel({this.id, this.type, this.relationId});

  SystemMessageItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    relationId = json['relationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['relationId'] = this.relationId;
    return data;
  }
}
