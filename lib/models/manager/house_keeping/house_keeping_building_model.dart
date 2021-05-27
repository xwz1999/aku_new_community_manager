class HouseKeepingBuildingModel {
  int value;
  String label;

  HouseKeepingBuildingModel({this.value, this.label});

  HouseKeepingBuildingModel.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['label'] = this.label;
    return data;
  }

  factory HouseKeepingBuildingModel.init() =>
      HouseKeepingBuildingModel(value: -1, label: '');
}
