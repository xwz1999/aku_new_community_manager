import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'work_order_submit_model.g.dart';

@JsonSerializable(createToJson: true)
class WorkOrderSubmitModel extends Equatable {
  final int workOrderId;
  final String content;
  final List<String> imgUrls;
  final WorkOrderFinishCostDTOList workOrderFinishCostDTOList;

  factory WorkOrderSubmitModel.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderSubmitModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderSubmitModelToJson(this);

  WorkOrderSubmitModel({
    required this.workOrderId,
    required this.content,
    required this.imgUrls,
    required this.workOrderFinishCostDTOList,
  });

  @override
  List<Object?> get props =>
      [workOrderId, content, imgUrls, workOrderFinishCostDTOList];
}

@JsonSerializable(createToJson: true)
class WorkOrderFinishCostDTOList extends Equatable {
  final int costType;
  final String name;
  final int num;
  final double price;

  factory WorkOrderFinishCostDTOList.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderFinishCostDTOListFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderFinishCostDTOListToJson(this);

  WorkOrderFinishCostDTOList({
    required this.costType,
    required this.name,
    required this.num,
    required this.price,
  });

  @override
  List<Object?> get props => [costType, num, name, price];
}
