class CommentMessageDetailModel {
  int id;
  String name;
  int level;

  CommentMessageDetailModel({this.id, this.name, this.level});

  CommentMessageDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['level'] = this.level;
    return data;
  }
}
