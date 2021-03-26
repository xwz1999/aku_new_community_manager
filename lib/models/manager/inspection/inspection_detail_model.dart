class InspectionDetailModel {
  int id;
  int inspectionPlanId;
  String code;
  String name;
  String beginDate;
  String endDate;
  String actualBeginDate;
  String actualEndDate;

  InspectionDetailModel(
      {this.id,
      this.inspectionPlanId,
      this.code,
      this.name,
      this.beginDate,
      this.endDate,
      this.actualBeginDate,
      this.actualEndDate});

  InspectionDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inspectionPlanId = json['inspectionPlanId'];
    code = json['code'];
    name = json['name'];
    beginDate = json['beginDate'];
    endDate = json['endDate'];
    actualBeginDate = json['actualBeginDate'];
    actualEndDate = json['actualEndDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['inspectionPlanId'] = this.inspectionPlanId;
    data['code'] = this.code;
    data['name'] = this.name;
    data['beginDate'] = this.beginDate;
    data['endDate'] = this.endDate;
    data['actualBeginDate'] = this.actualBeginDate;
    data['actualEndDate'] = this.actualEndDate;
    return data;
  }
}
