import 'package:aku_community_manager/utils/weekdays_to_chinese.dart';
import 'package:common_utils/common_utils.dart';

class ClockRecordListModel {
  int? id;
  String? startClockDate;
  String? endClockDate;
  String? cardReplacementDate;
  String? operatorName;
  String? clockName;
  String? clockTel;
  String? createDate;

  ClockRecordListModel(
      {required this.id,
      this.startClockDate,
      this.endClockDate,
      this.cardReplacementDate,
      this.operatorName,
      this.clockName,
      this.clockTel,
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
    return data;
  }

  String get startClockString =>
      DateUtil.formatDateStr(this.startClockDate??'', format: 'HH:mm:ss');

  String get endClockString =>
      DateUtil.formatDateStr(this.endClockDate??'', format: 'HH:mm:ss');

  String get clockDateString =>
      DateUtil.formatDateStr(this.createDate??'', format: 'yyyy.MM.dd');
  String get weekDay => WeekDaysToChinese.fromInt(
      DateUtil.getDateTime(this.createDate??'')?.weekday??0);
}
