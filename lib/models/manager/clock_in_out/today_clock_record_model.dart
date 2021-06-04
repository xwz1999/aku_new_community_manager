import 'package:common_utils/common_utils.dart';

class TodayClockRecordModel {
  int? id;
  String? startClockDate;
  String? endClockDate;
  String? cardReplacementDate;
  String? operatorName;
  String? clockName;
  String? clockTel;
  String? createDate;

  TodayClockRecordModel(
      {required this.id,
      this.startClockDate,
      this.endClockDate,
      this.cardReplacementDate,
      this.operatorName,
      this.clockName,
      this.clockTel,
      this.createDate});

  TodayClockRecordModel.fromJson(Map<String, dynamic> json) {
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

  DateTime? get clockInTime => DateUtil.getDateTime(this.startClockDate!);
  DateTime? get clockOutTime => DateUtil.getDateTime(this.endClockDate!);
}
