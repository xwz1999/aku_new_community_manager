class InspectionPointModel {
  int? id;
  String? name;
  int? checkNum;
  String? completeDate;
  num? longitude;
  num? latitude;

  InspectionPointModel(
      {required this.id, this.name, this.checkNum, this.completeDate});

  InspectionPointModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    checkNum = json['checkNum'];
    completeDate = json['completeDate'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['checkNum'] = this.checkNum;
    data['completeDate'] = this.completeDate;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}
