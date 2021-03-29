class InspectionDetailModel {
  int id;
  int inspectionPlanId;
  String code;
  String name;
  String beginDate;
  String endDate;
  String actualBeginDate;
  String actualEndDate;
  int sort;
  int status;

  InspectionDetailModel(
      {this.id,
      this.inspectionPlanId,
      this.code,
      this.name,
      this.beginDate,
      this.endDate,
      this.actualBeginDate,
      this.actualEndDate,
      this.sort,
      this.status});

  InspectionDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inspectionPlanId = json['inspectionPlanId'];
    code = json['code'];
    name = json['name'];
    beginDate = json['beginDate'];
    endDate = json['endDate'];
    actualBeginDate = json['actualBeginDate'];
    actualEndDate = json['actualEndDate'];
    sort = json['sort'];
    status = json['status'];
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
    data['sort'] = this.sort;
    data['status'] = this.status;
    return data;
  }
}
