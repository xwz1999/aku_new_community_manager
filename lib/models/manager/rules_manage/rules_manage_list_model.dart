class RulesManageListModel {
  int id;
  String title;
  String content;
  String releaseDate;

  RulesManageListModel({this.id, this.title, this.content, this.releaseDate});

  RulesManageListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    releaseDate = json['releaseDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['releaseDate'] = this.releaseDate;
    return data;
  }
}