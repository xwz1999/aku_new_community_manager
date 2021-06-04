class KeyMangeAllKeyModel {
  int? id;
  String? code;
  String? facilityName;
  int? totalNum;
  int? loanableNum;
  String? correspondingPosition;
  String? storageLocation;
  int? status;
  String? createDate;

  KeyMangeAllKeyModel(
      {required this.id,
      this.code,
      this.facilityName,
      this.totalNum,
      this.loanableNum,
      this.correspondingPosition,
      this.storageLocation,
      this.status,
      this.createDate});

  KeyMangeAllKeyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    facilityName = json['facilityName'];
    totalNum = json['totalNum'];
    loanableNum = json['loanableNum'];
    correspondingPosition = json['correspondingPosition'];
    storageLocation = json['storageLocation'];
    status = json['status'];
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['facilityName'] = this.facilityName;
    data['totalNum'] = this.totalNum;
    data['loanableNum'] = this.loanableNum;
    data['correspondingPosition'] = this.correspondingPosition;
    data['storageLocation'] = this.storageLocation;
    data['status'] = this.status;
    data['createDate'] = this.createDate;
    return data;
  }
}
