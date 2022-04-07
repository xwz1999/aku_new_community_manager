import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_status_number_model.g.dart';

@JsonSerializable()
class HomeStatusNumberModel extends Equatable {
  final int noProcessedNum;
  final int processingNum;
  final int processedNum;
  final int allProcessNum;

  factory HomeStatusNumberModel.fromJson(Map<String, dynamic> json) =>
      _$HomeStatusNumberModelFromJson(json);

  const HomeStatusNumberModel({
    required this.noProcessedNum,
    required this.processingNum,
    required this.processedNum,
    required this.allProcessNum,
  });

  @override
  List<Object?> get props => [
        noProcessedNum,
        processingNum,
        processedNum,
        allProcessNum,
      ];
}
