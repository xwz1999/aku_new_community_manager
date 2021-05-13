class PackageManageListModel {
  int id;
  String code;
  String addresseeName;
  String addresseeTel;
  String address;
  int status;
  Null receiveDate;
  String createDate;

  PackageManageListModel(
      {this.id,
      this.code,
      this.addresseeName,
      this.addresseeTel,
      this.address,
      this.status,
      this.receiveDate,
      this.createDate});

  PackageManageListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    addresseeName = json['addresseeName'];
    addresseeTel = json['addresseeTel'];
    address = json['address'];
    status = json['status'];
    receiveDate = json['receiveDate'];
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['addresseeName'] = this.addresseeName;
    data['addresseeTel'] = this.addresseeTel;
    data['address'] = this.address;
    data['status'] = this.status;
    data['receiveDate'] = this.receiveDate;
    data['createDate'] = this.createDate;
    return data;
  }
}
