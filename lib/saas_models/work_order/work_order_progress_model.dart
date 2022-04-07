import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'work_order_progress_model.g.dart';

@JsonSerializable()
class WorkOrderProgressModel extends Equatable {
  final int id;

  ///  工单进度状态：1.待分配，2.工单池，3.已接单，4.处理中，5.待确认，6.待支付，7.已完成，8.已评价，9.已拒绝，10.已取消
  final int status;
  final String content;

  final String createDate;

  factory WorkOrderProgressModel.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderProgressModelFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        content,
        createDate,
      ];

  const WorkOrderProgressModel({
    required this.id,
    required this.status,
    required this.content,
    required this.createDate,
  });
}
