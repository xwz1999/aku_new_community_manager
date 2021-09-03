import 'package:common_utils/common_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'today_clock_record_model.g.dart';

@JsonSerializable()
class TodayClockRecordModel {
  final int id;
  final String? startClockDate;
  final String? endClockDate;
  final String? cardReplacementDate;
  final String? operatorName;
  final String clockName;
  final String clockTel;
  final String createDate;
  final int status;
  final String? firstTimeStart;
  final String? firstTimeEnd;
  final String? secondTimeStart;
  final String? secondTimeEnd;
  TodayClockRecordModel({
    required this.id,
    required this.startClockDate,
    required this.endClockDate,
    required this.cardReplacementDate,
    required this.operatorName,
    required this.clockName,
    required this.clockTel,
    required this.createDate,
    required this.status,
    required this.firstTimeStart,
    required this.firstTimeEnd,
    required this.secondTimeStart,
    required this.secondTimeEnd,
  });
  factory TodayClockRecordModel.fromJson(Map<String, dynamic> json) =>
      _$TodayClockRecordModelFromJson(json);

  DateTime? get clockInTime => DateUtil.getDateTime(this.startClockDate ?? '');
  DateTime? get clockOutTime => DateUtil.getDateTime(this.endClockDate ?? '');
  DateTime? get startTime {
    if (firstTimeStart != null) {
      return DateUtil.getDateTime(firstTimeStart!);
    } else if (secondTimeStart != null) {
      return DateUtil.getDateTime(secondTimeStart!);
    } else {
      return null;
    }
  }

  DateTime? get endTime {
    if (firstTimeEnd != null) {
      return DateUtil.getDateTime(firstTimeEnd!);
    } else if (secondTimeEnd != null) {
      return DateUtil.getDateTime(secondTimeEnd!);
    } else {
      return null;
    }
  }
}
