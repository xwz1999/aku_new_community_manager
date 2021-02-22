class VisitorCardsModel {
  int id;
  String roomName;
  String name;
  int isDrive;
  String carNum;
  String effectiveTime;
  String visitDate;
  int visitorStatus;

  VisitorCardsModel(
      {this.id,
      this.roomName,
      this.name,
      this.isDrive,
      this.carNum,
      this.effectiveTime,
      this.visitDate,
      this.visitorStatus});

  VisitorCardsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomName = json['roomName'];
    name = json['name'];
    isDrive = json['isDrive'];
    carNum = json['carNum'];
    effectiveTime = json['effectiveTime'];
    visitDate = json['visitDate'];
    visitorStatus = json['visitorStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['roomName'] = this.roomName;
    data['name'] = this.name;
    data['isDrive'] = this.isDrive;
    data['carNum'] = this.carNum;
    data['effectiveTime'] = this.effectiveTime;
    data['visitDate'] = this.visitDate;
    data['visitorStatus'] = this.visitorStatus;
    return data;
  }
}
