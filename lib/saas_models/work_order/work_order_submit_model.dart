import 'package:json_annotation/json_annotation.dart';

part 'work_order_submit_model.g.dart';

@JsonSerializable(createToJson: true)
class WorkOrderSubmitModel {
  int workOrderId;
  String content;
  List<String> imgUrls;
  List<WorkOrderFinishCostDTOList> workOrderFinishCostDTOList;

  factory WorkOrderSubmitModel.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderSubmitModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderSubmitModelToJson(this);

  static WorkOrderSubmitModel get init => WorkOrderSubmitModel(
          workOrderId: 0,
          content: '',
          imgUrls: [],
          workOrderFinishCostDTOList: <WorkOrderFinishCostDTOList>[
            WorkOrderFinishCostDTOList.init
          ]);

//<editor-fold desc="Data Methods">

  WorkOrderSubmitModel({
    required this.workOrderId,
    required this.content,
    required this.imgUrls,
    required this.workOrderFinishCostDTOList,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkOrderSubmitModel &&
          runtimeType == other.runtimeType &&
          workOrderId == other.workOrderId &&
          content == other.content &&
          imgUrls == other.imgUrls &&
          workOrderFinishCostDTOList == other.workOrderFinishCostDTOList);

  @override
  int get hashCode =>
      workOrderId.hashCode ^
      content.hashCode ^
      imgUrls.hashCode ^
      workOrderFinishCostDTOList.hashCode;

  @override
  String toString() {
    return 'WorkOrderSubmitModel{' +
        ' workOrderId: $workOrderId,' +
        ' content: $content,' +
        ' imgUrls: $imgUrls,' +
        ' workOrderFinishCostDTOList: $workOrderFinishCostDTOList,' +
        '}';
  }

  WorkOrderSubmitModel copyWith({
    int? workOrderId,
    String? content,
    List<String>? imgUrls,
    List<WorkOrderFinishCostDTOList>? workOrderFinishCostDTOList,
  }) {
    return WorkOrderSubmitModel(
      workOrderId: workOrderId ?? this.workOrderId,
      content: content ?? this.content,
      imgUrls: imgUrls ?? this.imgUrls,
      workOrderFinishCostDTOList:
          workOrderFinishCostDTOList ?? this.workOrderFinishCostDTOList,
    );
  }

//</editor-fold>
}

@JsonSerializable(createToJson: true)
class WorkOrderFinishCostDTOList {
  int costType;
  String name;
  int num;
  double price;

  factory WorkOrderFinishCostDTOList.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderFinishCostDTOListFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderFinishCostDTOListToJson(this);

  static WorkOrderFinishCostDTOList get init =>
      WorkOrderFinishCostDTOList(costType: 2, name: '', num: 0, price: 0);

//<editor-fold desc="Data Methods">

  WorkOrderFinishCostDTOList({
    required this.costType,
    required this.name,
    required this.num,
    required this.price,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkOrderFinishCostDTOList &&
          runtimeType == other.runtimeType &&
          costType == other.costType &&
          name == other.name &&
          num == other.num &&
          price == other.price);

  @override
  int get hashCode =>
      costType.hashCode ^ name.hashCode ^ num.hashCode ^ price.hashCode;

  @override
  String toString() {
    return 'WorkOrderFinishCostDTOList{' +
        ' costType: $costType,' +
        ' name: $name,' +
        ' num: $num,' +
        ' price: $price,' +
        '}';
  }

  WorkOrderFinishCostDTOList copyWith({
    int? costType,
    String? name,
    int? num,
    double? price,
  }) {
    return WorkOrderFinishCostDTOList(
      costType: costType ?? this.costType,
      name: name ?? this.name,
      num: num ?? this.num,
      price: price ?? this.price,
    );
  }

//</editor-fold>
}
