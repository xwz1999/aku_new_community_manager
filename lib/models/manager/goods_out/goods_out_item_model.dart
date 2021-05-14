import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

/// * id	物品出户主键id
/// * status	状态(1.待出门，2.已出门，3.驳回申请)
/// * roomName	详细地址（房产名称）
/// * applicantName	出户人（申请人）
/// * identity	身份（1业主，2亲属，3租客）
/// * articleOutName	出户物品
/// * expectedTime	预计出户时间
class GoodsOutItemModel {
  int id;

  ///状态(1.待出门，2.已出门，3.驳回申请)
  int status;
  String roomName;
  String applicantName;

  ///	身份（1业主，2亲属，3租客）
  int identity;
  String articleOutName;
  String expectedTime;

  DateTime get expected => DateUtil.getDateTime(expectedTime);

  ///状态(1.待出门，2.已出门，3.驳回申请)
  String get statusValue {
    switch (status) {
      case 1:
        return '待出户';
      case 2:
        return '已出户';
      case 3:
        return '已驳回';
      default:
        return '未知';
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

  ///	身份（1业主，2亲属，3租客）
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

  GoodsOutItemModel(
      {this.id,
      this.status,
      this.roomName,
      this.applicantName,
      this.identity,
      this.articleOutName,
      this.expectedTime});

  GoodsOutItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    roomName = json['roomName'];
    applicantName = json['applicantName'];
    identity = json['identity'];
    articleOutName = json['articleOutName'];
    expectedTime = json['expectedTime'];
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
    return data;
  }
}
