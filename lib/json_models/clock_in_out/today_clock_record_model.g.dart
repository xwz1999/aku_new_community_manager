// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_clock_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodayClockRecordModel _$TodayClockRecordModelFromJson(
    Map<String, dynamic> json) {
  return TodayClockRecordModel(
    id: json['id'] as int,
    startClockDate: json['startClockDate'] as String?,
    endClockDate: json['endClockDate'] as String?,
    cardReplacementDate: json['cardReplacementDate'] as String?,
    operatorName: json['operatorName'] as String?,
    clockName: json['clockName'] as String,
    clockTel: json['clockTel'] as String,
    createDate: json['createDate'] as String,
    status: json['status'] as String,
    firstTimeStart: json['firstTimeStart'] as String?,
    firstTimeEnd: json['firstTimeEnd'] as String?,
    secondTimeStart: json['secondTimeStart'] as String?,
    secondTimeEnd: json['secondTimeEnd'] as String?,
  );
}
