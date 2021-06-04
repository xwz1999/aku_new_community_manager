class DispatchDetialModel {
  String? showName;
  int? showValue;
  String? remarks;

  DispatchDetialModel({this.showName, this.showValue, this.remarks});

  DispatchDetialModel.fromJson(Map<String, dynamic> json) {
    showName = json['showName'];
    showValue = json['showValue'];
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['showName'] = this.showName;
    data['showValue'] = this.showValue;
    data['remarks'] = this.remarks;
    return data;
  }
}
