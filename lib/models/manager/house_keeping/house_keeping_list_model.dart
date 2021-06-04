class HouseKeepingListModel {
  int? id;
  String? roomName;
  int? num;
  String? leaderName;
  String? leaderTel;
  String? content;
  String? createName;
  String? createDate;

  HouseKeepingListModel(
      {required this.id,
      this.roomName,
      this.num,
      this.leaderName,
      this.leaderTel,
      this.content,
      this.createName,
      this.createDate});

  HouseKeepingListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomName = json['roomName'];
    num = json['num'];
    leaderName = json['leaderName'];
    leaderTel = json['leaderTel'];
    content = json['content'];
    createName = json['createName'];
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['roomName'] = this.roomName;
    data['num'] = this.num;
    data['leaderName'] = this.leaderName;
    data['leaderTel'] = this.leaderTel;
    data['content'] = this.content;
    data['createName'] = this.createName;
    data['createDate'] = this.createDate;
    return data;
  }
}
