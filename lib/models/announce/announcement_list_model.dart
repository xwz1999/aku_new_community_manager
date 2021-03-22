class AnnouncementListModel {
  int id;
  String title;
  String releaseTime;
  List<String> imgUrls;

  AnnouncementListModel({this.id, this.title, this.releaseTime, this.imgUrls});

  AnnouncementListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    releaseTime = json['releaseTime'];
    imgUrls = json['imgUrls'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['releaseTime'] = this.releaseTime;
    data['imgUrls'] = this.imgUrls;
    return data;
  }
}
