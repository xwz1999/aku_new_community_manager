import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'community_model.g.dart';

@JsonSerializable()
class CommunityModel extends Equatable {
  final int id;
  final String name;
  final String address;
  final String addressDetails;
  factory CommunityModel.fromJson(Map<String, dynamic> json) =>
      _$CommunityModelFromJson(json);

  const CommunityModel({
    required this.id,
    required this.name,
    required this.address,
    required this.addressDetails,
  });
  @override
  List<Object?> get props => [
        id,
        name,
        address,
        addressDetails,
      ];
}
