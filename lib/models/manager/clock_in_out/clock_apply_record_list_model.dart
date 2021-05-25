import 'package:aku_community_manager/style/app_style.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

class ClockApplyRecordListModel {
  int id;
  String reason;
  int status;
  int type;
  String startDate;
  String endDate;
  String createName;
  String createTel;
  String createDate;
  String reviewerName;
  String reviewerDate;

  ClockApplyRecordListModel(
      {this.id,
      this.reason,
      this.status,
      this.type,
      this.startDate,
      this.endDate,
      this.createName,
      this.createTel,
      this.createDate,
      this.reviewerName,
      this.reviewerDate});

  ClockApplyRecordListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reason = json['reason'];
    status = json['status'];
    type = json['type'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    createName = json['createName'];
    createTel = json['createTel'];
    createDate = json['createDate'];
    reviewerName = json['reviewerName'];
    reviewerDate = json['reviewerDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reason'] = this.reason;
    data['status'] = this.status;
    data['type'] = this.type;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['createName'] = this.createName;
    data['createTel'] = this.createTel;
    data['createDate'] = this.createDate;
    data['reviewerName'] = this.reviewerName;
    data['reviewerDate'] = this.reviewerDate;
    return data;
  }

  String get typeString {
    switch (this.type) {
      case 1:
        return '请假';
      case 2:
        return '加班';
      default:
        return '未知';
    }
  }

  String get statusString {
    switch (this.status) {
      case 1:
        return '待审核';
      case 2:
        return '审核通过';
      case 3:
        return '审核驳回';
      default:
        return '未知';
    }
  }

  Color get statusColor {
    switch (this.status) {
      case 1:
        return kPrimaryColor;
      case 2:
        return Colors.green;
      case 3:
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  String get startTimeString =>
      DateUtil.formatDateStr(this.startDate, format: 'yyyy-MM-dd HH:mm');
  String get endTimeString =>
      DateUtil.formatDateStr(this.endDate, format: 'yyyy-MM-dd HH:mm');
  String get applyTimeString =>
      DateUtil.formatDateStr(this.createDate, format: 'yyyy-MM-dd HH:mm:ss');
}
