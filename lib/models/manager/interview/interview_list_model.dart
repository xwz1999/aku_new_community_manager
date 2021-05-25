import 'package:aku_community_manager/style/app_style.dart';
import 'package:flutter/material.dart';

class InterviewListModel {
  int id;
  String name;
  String tel;
  String content;
  int status;
  String interviewDate;
  String feedbackContent;
  String feedbackDate;
  String createName;
  String createDate;

  InterviewListModel(
      {this.id,
      this.name,
      this.tel,
      this.content,
      this.status,
      this.interviewDate,
      this.feedbackContent,
      this.feedbackDate,
      this.createName,
      this.createDate});

  InterviewListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tel = json['tel'];
    content = json['content'];
    status = json['status'];
    interviewDate = json['interviewDate'];
    feedbackContent = json['feedbackContent'];
    feedbackDate = json['feedbackDate'];
    createName = json['createName'];
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['tel'] = this.tel;
    data['content'] = this.content;
    data['status'] = this.status;
    data['interviewDate'] = this.interviewDate;
    data['feedbackContent'] = this.feedbackContent;
    data['feedbackDate'] = this.feedbackDate;
    data['createName'] = this.createName;
    data['createDate'] = this.createDate;
    return data;
  }

  String get statusString {
    switch (this.status) {
      case 1:
        return '待回复';
      case 2:
        return '已回复';
      default:
        return '未知';
    }
  }

  Color get statusColor {
    switch (this.status) {
      case 1:
        return kPrimaryColor;
      case 2:
        return kTextSubColor;
      default:
        return kTextPrimaryColor;
    }
  }
}
