// Project imports:
import 'package:aku_community_manager/models/common/img_model.dart';

class BorrowItemDetailModel {
  int id;
  String name;
  String code;
  int borrowStatus;
  int status;
  List<ImgModel> imgUrls;
  ImgModel get firstImg => imgUrls.isEmpty ? null : imgUrls.first;
  bool get borrowed => borrowStatus == 2;
  String get statusValue {
    switch (status) {
      case 1:
        return '正常';
      case 2:
        return '破损';
      case 3:
        return '丢失';
      default:
        return '未知';
    }
  }

  BorrowItemDetailModel(
      {this.id,
      this.name,
      this.code,
      this.borrowStatus,
      this.status,
      this.imgUrls});

  BorrowItemDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    borrowStatus = json['borrowStatus'];
    status = json['status'];
    if (json['imgUrls'] != null) {
      imgUrls = new List<ImgModel>();
      json['imgUrls'].forEach((v) {
        imgUrls.add(new ImgModel.fromJson(v));
      });
    } else
      imgUrls = [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['borrowStatus'] = this.borrowStatus;
    data['status'] = this.status;
    if (this.imgUrls != null) {
      data['imgUrls'] = this.imgUrls.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
