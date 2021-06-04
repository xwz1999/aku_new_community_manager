import 'package:common_utils/common_utils.dart';

class RulesManageListModel {
  int? id;
  String? title;
  String? content;
  String? fileDocUrl;
  String? fileDocName;
  String? releaseDate;

  RulesManageListModel(
      {required this.id,
      this.title,
      this.content,
      this.fileDocUrl,
      this.fileDocName,
      this.releaseDate});

  RulesManageListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    fileDocUrl = json['fileDocUrl'];
    fileDocName = json['fileDocName'];
    releaseDate = json['releaseDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['fileDocUrl'] = this.fileDocUrl;
    data['fileDocName'] = this.fileDocName;
    data['releaseDate'] = this.releaseDate;
    return data;
  }

  String get releaseDateString => DateUtil.formatDateStr(this.releaseDate!);
}
