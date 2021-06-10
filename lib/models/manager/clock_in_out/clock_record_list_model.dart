import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/utils/weekdays_to_chinese.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

class ClockRecordListModel {
  int? id;
  String? startClockDate;
  String? endClockDate;
  String? cardReplacementDate;
  String? operatorName;
  String? clockName;
  String? clockTel;
  String? createDate;
  int? status;

  ClockRecordListModel(
      {required this.id,
      this.startClockDate,
      this.endClockDate,
      this.cardReplacementDate,
      this.operatorName,
      this.clockName,
      this.clockTel,
      this.status,
      this.createDate});

  ClockRecordListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startClockDate = json['startClockDate'];
    endClockDate = json['endClockDate'];
    cardReplacementDate = json['cardReplacementDate'];
    operatorName = json['operatorName'];
    clockName = json['clockName'];
    clockTel = json['clockTel'];
    createDate = json['createDate'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['startClockDate'] = this.startClockDate;
    data['endClockDate'] = this.endClockDate;
    data['cardReplacementDate'] = this.cardReplacementDate;
    data['operatorName'] = this.operatorName;
    data['clockName'] = this.clockName;
    data['clockTel'] = this.clockTel;
    data['createDate'] = this.createDate;
    data['status'] = this.status;
    return data;
  }

  String get startClockString =>
      DateUtil.formatDateStr(this.startClockDate ?? '', format: 'HH:mm:ss');

  String get endClockString =>
      DateUtil.formatDateStr(this.endClockDate ?? '', format: 'HH:mm:ss');

  String get clockDateString =>
      DateUtil.formatDateStr(this.createDate ?? '', format: 'yyyy.MM.dd');
  String get weekDay => WeekDaysToChinese.fromInt(
      DateUtil.getDateTime(this.createDate ?? '')?.weekday ?? 0);
  String get statusString {
    switch (this.status) {
      case 1:
        return '节假日';
      case 2:
        return '工作日';
      case 3:
        return '休息日';
      default:
        return '未知';
    }
  }

  Color get statusColor {
    switch (this.status) {
      case 1:
        return Colors.red;
      case 2:
        return kTextSubColor;
      case 3:
        return kPrimaryColor;
      default:
        return Colors.redAccent;
    }
  }
}
