import 'package:aku_community_manager/style/app_style.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

class NewRenovationListModel {
  int id;
  String roomName;
  int status;
  String constructionUnit;
  String director;
  String directorTel;
  String expectedBegin;
  String expectedEnd;
  String actualBegin;
  String actualEnd;
  String rejectReason;
  String reviewerName;
  String auditDate;
  String trackerName;
  String applicationCheckDate;
  int isQualified;
  String createName;
  String createDate;
  List<CheckVoList> checkVoList;

  NewRenovationListModel(
      {this.id,
      this.roomName,
      this.status,
      this.constructionUnit,
      this.director,
      this.directorTel,
      this.expectedBegin,
      this.expectedEnd,
      this.actualBegin,
      this.actualEnd,
      this.rejectReason,
      this.reviewerName,
      this.auditDate,
      this.trackerName,
      this.applicationCheckDate,
      this.isQualified,
      this.createName,
      this.createDate,
      this.checkVoList});

  NewRenovationListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomName = json['roomName'];
    status = json['status'];
    constructionUnit = json['constructionUnit'];
    director = json['director'];
    directorTel = json['directorTel'];
    expectedBegin = json['expectedBegin'];
    expectedEnd = json['expectedEnd'];
    actualBegin = json['actualBegin'];
    actualEnd = json['actualEnd'];
    rejectReason = json['rejectReason'];
    reviewerName = json['reviewerName'];
    auditDate = json['auditDate'];
    trackerName = json['trackerName'];
    applicationCheckDate = json['applicationCheckDate'];
    isQualified = json['isQualified'];
    createName = json['createName'];
    createDate = json['createDate'];
    if (json['checkVoList'] != null) {
      checkVoList = new List<CheckVoList>();
      json['checkVoList'].forEach((v) {
        checkVoList.add(new CheckVoList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['roomName'] = this.roomName;
    data['status'] = this.status;
    data['constructionUnit'] = this.constructionUnit;
    data['director'] = this.director;
    data['directorTel'] = this.directorTel;
    data['expectedBegin'] = this.expectedBegin;
    data['expectedEnd'] = this.expectedEnd;
    data['actualBegin'] = this.actualBegin;
    data['actualEnd'] = this.actualEnd;
    data['rejectReason'] = this.rejectReason;
    data['reviewerName'] = this.reviewerName;
    data['auditDate'] = this.auditDate;
    data['trackerName'] = this.trackerName;
    data['applicationCheckDate'] = this.applicationCheckDate;
    data['isQualified'] = this.isQualified;
    data['createName'] = this.createName;
    data['createDate'] = this.createDate;
    if (this.checkVoList != null) {
      data['checkVoList'] = this.checkVoList.map((v) => v.toJson()).toList();
    }
    return data;
  }

  String get expectBginString =>
      DateUtil.formatDateStr(this.expectedBegin, format: 'yyyy-MM-dd HH:mm');

  String get expectEndString =>
      DateUtil.formatDateStr(this.expectedEnd, format: 'yyyy-MM-dd HH:mm');

  String get actualBginString => DateUtil.formatDateStr(this.actualBegin ?? '',
      format: 'yyyy-MM-dd HH:mm');

  String get actualEndString =>
      DateUtil.formatDateStr(this.actualEnd ?? '', format: 'yyyy-MM-dd HH:mm');
  String get expectSlot =>
      '${expectBginString}-${DateUtil.formatDateStr(this.expectedEnd, format: 'HH:mm')}';
  String get actualSlot =>
      '${actualBginString}-${DateUtil.formatDateStr(this.actualEnd ?? '', format: 'HH:mm')}';

  String get qualitfied {
    switch (this.isQualified) {
      case 1:
        return '合格';
      case 2:
        return '不合格';
      default:
        return '未知';
    }
  }

  String get statusString {
    switch (this.status) {
      // case 1:
      //   return '申请中';
      // case 2:
      //   return '装修中';
      // case 3:
      //   return '申请驳回';
      // // case 4:
      // //   return '装修中';
      // case 5:
      //   return '申请完工检查';
      case 6:
        return '完工检查中';
      case 7:
        return '检查通过';
      case 8:
        return '检查不通过';
      default:
        return '未知';
    }
  }

  Color get statusColor {
    switch (this.status) {
      // case 1:
      //   return kPrimaryColor;
      // case 2:
      //   return Colors.green;
      // case 3:
      //   return Colors.red;
      // // case 4:
      // //   return ktextPrimary;
      // case 5:
      //   return kPrimaryColor;
      case 6:
        return kTextSubColor;

      case 7:
        return Colors.green;
      case 8:
        return Colors.red;
      default:
        return kTextPrimaryColor;
    }
  }
}

class CheckVoList {
  int id;
  int decorationNewId;
  String detail;
  int isQualified;
  String createName;
  String createDate;

  CheckVoList(
      {this.id,
      this.decorationNewId,
      this.detail,
      this.isQualified,
      this.createName,
      this.createDate});

  CheckVoList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    decorationNewId = json['decorationNewId'];
    detail = json['detail'];
    isQualified = json['isQualified'];
    createName = json['createName'];
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['decorationNewId'] = this.decorationNewId;
    data['detail'] = this.detail;
    data['isQualified'] = this.isQualified;
    data['createName'] = this.createName;
    data['createDate'] = this.createDate;
    return data;
  }

  String get qualitfied {
    switch (this.isQualified) {
      case 1:
        return '合格';
      case 2:
        return '不合格';
      default:
        return '未知';
    }
  }
}
