class AnnouncementDetailModel {
  int id;
  String title;
  String content;
  String fileDocUrl;
  String fileDocName;
  String releaseTime;
  List<String> imgUrls;

  AnnouncementDetailModel(
      {this.id,
      this.title,
      this.content,
      this.fileDocUrl,
      this.fileDocName,
      this.releaseTime,
      this.imgUrls});

  AnnouncementDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    fileDocUrl = json['fileDocUrl'];
    fileDocName = json['fileDocName'];
    releaseTime = json['releaseTime'];
    imgUrls = json['imgUrls'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['fileDocUrl'] = this.fileDocUrl;
    data['fileDocName'] = this.fileDocName;
    data['releaseTime'] = this.releaseTime;
    data['imgUrls'] = this.imgUrls;
    return data;
  }

  AnnouncementDetailModel.zero() {
    this.content = '';
    this.fileDocName = '';
    this.fileDocUrl = '';
    this.id = -1;
    this.imgUrls = [];
    this.releaseTime = '';
    this.title = '';
  }
}
