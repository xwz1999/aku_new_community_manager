// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:common_utils/common_utils.dart';

// Project imports:
import 'package:aku_community_manager/models/common/img_model.dart';
import 'package:aku_community_manager/style/app_style.dart';

class BorrowStatusItemModel {
  int id;
  int articleDetailId;
  String articleName;

  ///借取状态（1.出借中，2.已还，3.待检查）
  int borrowStatus;

  ///物品状态（1.正常，2.损坏，3.丢失）
  int status;
  int borrowTime;
  String beginDate;
  String endDate;
  String borrowName;
  String borrowTel;
  String createDate;
  List<ImgModel> imgUrls;
  ImgModel get firstImg => imgUrls.isEmpty ? null : imgUrls.first;
  DateTime get create => DateUtil.getDateTime(createDate);
  DateTime get begin => DateUtil.getDateTime(beginDate);
  DateTime get end => DateUtil.getDateTime(endDate);

  ///借取状态（1.出借中，2.已还，3.待检查）
  String get borrowStatusValue {
    switch (borrowStatus) {
      case 1:
        return '出借中';
      case 2:
        return '已还';
      case 3:
        return '待检查';
      default:
        return '未知';
    }
  }

  ///物品状态（1.正常，2.损坏，3.丢失）
  String get statusValue {
    switch (status) {
      case 1:
        return '正常';
      case 2:
        return '损坏';
      case 3:
        return '丢失';
      default:
        return '未知';
    }
  }

  ///物品状态（1.正常，2.损坏，3.丢失）
  Color get statusColor {
    switch (status) {
      case 1:
        return AppStyle.primaryTextColor;
      default:
        return AppStyle.failColor;
    }
  }

  BorrowStatusItemModel(
      {this.id,
      this.articleDetailId,
      this.articleName,
      this.borrowStatus,
      this.status,
      this.borrowTime,
      this.beginDate,
      this.endDate,
      this.borrowName,
      this.borrowTel,
      this.createDate,
      this.imgUrls});

  BorrowStatusItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    articleDetailId = json['articleDetailId'];
    articleName = json['articleName'];
    borrowStatus = json['borrowStatus'];
    status = json['status'];
    borrowTime = json['borrowTime'];
    beginDate = json['beginDate'];
    endDate = json['endDate'];
    borrowName = json['borrowName'];
    borrowTel = json['borrowTel'];
    createDate = json['createDate'];
    if (json['imgUrls'] != null) {
      imgUrls = new List<ImgModel>();
      json['imgUrls'].forEach((v) {
        imgUrls.add(new ImgModel.fromJson(v));
      });
    } else
      imgUrls = [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['articleDetailId'] = this.articleDetailId;
    data['articleName'] = this.articleName;
    data['borrowStatus'] = this.borrowStatus;
    data['status'] = this.status;
    data['borrowTime'] = this.borrowTime;
    data['beginDate'] = this.beginDate;
    data['endDate'] = this.endDate;
    data['borrowName'] = this.borrowName;
    data['borrowTel'] = this.borrowTel;
    data['createDate'] = this.createDate;
    if (this.imgUrls != null) {
      data['imgUrls'] = this.imgUrls.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
