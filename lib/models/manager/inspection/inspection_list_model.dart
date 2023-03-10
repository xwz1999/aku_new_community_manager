class InspectionListModel {
  int? id;
  String? code;
  String? name;
  String? beginDate;
  String? endDate;
  String? actualBeginDate;
  String? actualEndDate;
  int? status;
  String? inspectorName;

  InspectionListModel(
      {required this.id,
      this.code,
      this.name,
      this.beginDate,
      this.endDate,
      this.actualBeginDate,
      this.actualEndDate,
      this.status,
      this.inspectorName});

  InspectionListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    beginDate = json['beginDate'];
    endDate = json['endDate'];
    actualBeginDate = json['actualBeginDate'];
    actualEndDate = json['actualEndDate'];
    status = json['status'];
    inspectorName = json['inspectorName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['beginDate'] = this.beginDate;
    data['endDate'] = this.endDate;
    data['actualBeginDate'] = this.actualBeginDate;
    data['actualEndDate'] = this.actualEndDate;
    data['status'] = this.status;
    data['inspectorName'] = this.inspectorName;
    return data;
  }
}
