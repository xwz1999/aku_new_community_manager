class DecorationListModel {
  int id;
  String roomName;
  String constructionUnit;
  int operationStatus;
  int status;
  int tracker;
  String applicationDate;

  DecorationListModel(
      {this.id,
      this.roomName,
      this.constructionUnit,
      this.operationStatus,
      this.status,
      this.tracker,
      this.applicationDate});

  DecorationListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomName = json['roomName'];
    constructionUnit = json['constructionUnit'];
    operationStatus = json['operationStatus'];
    status = json['status'];
    tracker = json['tracker'];
    applicationDate = json['applicationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['roomName'] = this.roomName;
    data['constructionUnit'] = this.constructionUnit;
    data['operationStatus'] = this.operationStatus;
    data['status'] = this.status;
    data['tracker'] = this.tracker;
    data['applicationDate'] = this.applicationDate;
    return data;
  }
}
