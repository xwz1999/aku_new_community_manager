class InspectionPointModel {
  int id;
  String name;
  int checkNum;
  String completeDate;

  InspectionPointModel({this.id, this.name, this.checkNum, this.completeDate});

  InspectionPointModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    checkNum = json['checkNum'];
    completeDate = json['completeDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['checkNum'] = this.checkNum;
    data['completeDate'] = this.completeDate;
    return data;
  }
}
