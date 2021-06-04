import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

class GreenManageListModel {
  int? id;
  String? greenAreaName;
  String? content;
  String? directorName;
  int? status;
  String? completeDate;
  String? endDate;
  String? createDate;

  GreenManageListModel(
      {required this.id,
      this.greenAreaName,
      this.content,
      this.directorName,
      this.status,
      this.completeDate,
      this.endDate,
      this.createDate});

  GreenManageListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    greenAreaName = json['greenAreaName'];
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
    data['greenAreaName'] = this.greenAreaName;
    data['content'] = this.content;
    data['directorName'] = this.directorName;
    data['status'] = this.status;
    data['completeDate'] = this.completeDate;
    data['endDate'] = this.endDate;
    data['createDate'] = this.createDate;
    return data;
  }

  String get statusString {
    switch (this.status) {
      case 1:
        return '待处理';
      case 2:
        return '已完成';
      case 3:
        return '未完成';
      default:
        return '未知';
    }
  }

  Color? get statusColor {
    switch (this.status) {
      case 1:
        return Color(0xFFFF8200);
      case 2:
        return Color(0xFF999999);
      case 3:
        return Color(0xFFE60E0E);
      default:
        Colors.black;
    }
  }

  String get createDateString =>
      DateUtil.formatDateStr(this.createDate!, format: 'yy-MM-dd HH:mm');

  String get endDateString =>
      DateUtil.formatDateStr(this.endDate!, format: 'yy-MM-dd HH:mm');

  String get completeDateString =>
      DateUtil.formatDateStr(this.completeDate!, format: 'yy-MM-dd HH:mm');
}
