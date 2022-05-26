import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'fire_model.g.dart';

@JsonSerializable()
class FireModel extends Equatable {
  final String model;
  final String communityCode;
  final int type;
  final FireAlarm? fireAlarm;
  final DeviceAlarm? deviceAlarm;
  final OneButtonAlarm? oneButtonAlarm;
  final ClientAlarm? clientAlarm;
  final ElderlyCareEquipmentReminder? elderlyCareEquipmentReminder;

  factory FireModel.fromJson(Map<String, dynamic> json) =>
      _$FireModelFromJson(json);

  @override
  List<Object?> get props => [
    model,
    communityCode,
    type,
    fireAlarm,
    deviceAlarm,
    oneButtonAlarm,
    clientAlarm,
    elderlyCareEquipmentReminder,
  ];

  const FireModel({
    required this.model,
    required this.communityCode,
    required this.type,
    this.fireAlarm,
    this.deviceAlarm,
    this.oneButtonAlarm,
    this.clientAlarm,
    this.elderlyCareEquipmentReminder,
  });
}

@JsonSerializable()
class FireAlarm extends Equatable {
  final String time;
  final String deviceName;
  factory FireAlarm.fromJson(Map<String, dynamic> json) =>_$FireAlarmFromJson(json);
  @override
  List<Object?> get props => [
    time,
    deviceName,
  ];

  const FireAlarm({
    required this.time,
    required this.deviceName,
  });
}

@JsonSerializable()
class DeviceAlarm extends Equatable {
  final String time;
  final String deviceName;
  factory DeviceAlarm.fromJson(Map<String, dynamic> json) =>_$DeviceAlarmFromJson(json);
  @override
  List<Object?> get props => [
    time,
    deviceName,
  ];

  const DeviceAlarm({
    required this.time,
    required this.deviceName,
  });
}

@JsonSerializable()
class OneButtonAlarm extends Equatable {
  final String time;
  final String roomName;
  final String name;
  final String tel;
  factory OneButtonAlarm.fromJson(Map<String, dynamic> json) =>_$OneButtonAlarmFromJson(json);
  @override
  List<Object?> get props => [
    time,
    roomName,
    name,
    tel,
  ];

  const OneButtonAlarm({
    required this.time,
    required this.roomName,
    required this.name,
    required this.tel,
  });
}

@JsonSerializable()
class ClientAlarm extends Equatable {
  final String time;
  final String content;
  factory ClientAlarm.fromJson(Map<String, dynamic> json) =>_$ClientAlarmFromJson(json);
  @override
  List<Object?> get props => [
    time,
    content,
  ];

  const ClientAlarm({
    required this.time,
    required this.content,
  });
}

@JsonSerializable()
class ElderlyCareEquipmentReminder extends Equatable {
  final String deviceNo;
  final int deviceType;
  final String content;
  factory ElderlyCareEquipmentReminder.fromJson(Map<String, dynamic> json) =>_$ElderlyCareEquipmentReminderFromJson(json);
  @override
  List<Object?> get props => [
    deviceNo,
    deviceType,
    content,
  ];

  const ElderlyCareEquipmentReminder({
    required this.deviceNo,
    required this.deviceType,
    required this.content,
  });
}
