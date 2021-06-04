import 'package:common_utils/common_utils.dart';

class HygienceListModel {
  int? id;
  String? hygieneAreaName;
  String? content;
  String? directorName;
  int? status;
  String? completeDate;
  String? endDate;
  String? createDate;

  HygienceListModel(
      {required this.id,
      this.hygieneAreaName,
      this.content,
      this.directorName,
      this.status,
      this.completeDate,
      this.endDate,
      this.createDate});

  HygienceListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hygieneAreaName = json['hygieneAreaName'];
    content = json['content'];
    directorName = json['directorName'];
    status = json['status'];
    completeDate = json['completeDate'];
    endDate = json['endDate'];
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hygieneAreaName'] = this.hygieneAreaName;
    data['content'] = this.content;
    data['directorName'] = this.directorName;
    data['status'] = this.status;
    data['completeDate'] = this.completeDate;
    data['endDate'] = this.endDate;
    data['createDate'] = this.createDate;
    return data;
  }
   String get createDateString =>
      DateUtil.formatDateStr(this.createDate!, format: 'yy-MM-dd HH:mm');

  String get endDateString =>
      DateUtil.formatDateStr(this.endDate!, format: 'yy-MM-dd HH:mm');

  String get completeDateString =>
      DateUtil.formatDateStr(this.completeDate!, format: 'yy-MM-dd HH:mm');
}
