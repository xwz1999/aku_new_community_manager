import 'package:flutter/material.dart';

class ToDoOutDoorModel {
  int id;
  int status;
  String roomName;
  String applicantName;
  int identity;
  String articleOutName;
  String expectedTime;
  String applicantDate;

  ToDoOutDoorModel(
      {this.id,
      this.status,
      this.roomName,
      this.applicantName,
      this.identity,
      this.articleOutName,
      this.expectedTime,
      this.applicantDate});

  ToDoOutDoorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    roomName = json['roomName'];
    applicantName = json['applicantName'];
    identity = json['identity'];
    articleOutName = json['articleOutName'];
    expectedTime = json['expectedTime'];
    applicantDate = json['applicantDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['roomName'] = this.roomName;
    data['applicantName'] = this.applicantName;
    data['identity'] = this.identity;
    data['articleOutName'] = this.articleOutName;
    data['expectedTime'] = this.expectedTime;
    data['applicantDate'] = this.applicantDate;
    return data;
  }

  ///status	状态(1.待出门，2.已出门，3.驳回申请)
  String get statusValue {
    switch (status) {
      case 1:
        return '待出门';
      case 2:
        return '已出门';
      case 3:
        return '驳回申请';
      default:
        return ' 未知';
    }
  }

   Color get statusColor {
    switch (status) {
      case 2:
        return Color(0xFF999999);
      default:
        return Color(0xFFFF4501);
    }
  }

   ///identity	身份（1业主，2亲属，3租客）
  String get identityValue {
    switch (identity) {
      case 1:
        return '业主';
      case 2:
        return '亲属';
      case 3:
        return '租客';
      default:
        return '未知';
    }
  }

   
}
