import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'china_region_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class ChinaRegionModel extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int parentId;
  @HiveField(3)
  final List<ChinaRegionModel>? cityList;

  factory ChinaRegionModel.fromJson(Map<String, dynamic> json) =>
      _$ChinaRegionModelFromJson(json);

  static ChinaRegionModel empty(int parentId) {
    return ChinaRegionModel(id: 0, name: '', cityList: [], parentId: 0);
  }

  ChinaRegionModel({
    required this.id,
    required this.name,
    required this.parentId,
    this.cityList,
  });
  @override
  List<Object?> get props => [id, name, parentId, cityList];

  ChinaRegionModel copyWith({
    int? id,
    String? name,
    int? parentId,
    List<ChinaRegionModel>? cityList,
  }) {
    return ChinaRegionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      cityList: cityList ?? this.cityList,
    );
  }
}
