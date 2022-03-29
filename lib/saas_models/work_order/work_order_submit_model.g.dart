// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_order_submit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkOrderSubmitModel _$WorkOrderSubmitModelFromJson(
        Map<String, dynamic> json) =>
    WorkOrderSubmitModel(
      workOrderId: json['workOrderId'] as int,
      content: json['content'] as String,
      imgUrls:
          (json['imgUrls'] as List<dynamic>).map((e) => e as String).toList(),
      workOrderFinishCostDTOList: WorkOrderFinishCostDTOList.fromJson(
          json['workOrderFinishCostDTOList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkOrderSubmitModelToJson(
        WorkOrderSubmitModel instance) =>
    <String, dynamic>{
      'workOrderId': instance.workOrderId,
      'content': instance.content,
      'imgUrls': instance.imgUrls,
      'workOrderFinishCostDTOList': instance.workOrderFinishCostDTOList,
    };

WorkOrderFinishCostDTOList _$WorkOrderFinishCostDTOListFromJson(
        Map<String, dynamic> json) =>
    WorkOrderFinishCostDTOList(
      costType: json['costType'] as int,
      name: json['name'] as String,
      num: json['num'] as int,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$WorkOrderFinishCostDTOListToJson(
        WorkOrderFinishCostDTOList instance) =>
    <String, dynamic>{
      'costType': instance.costType,
      'name': instance.name,
      'num': instance.num,
      'price': instance.price,
    };
