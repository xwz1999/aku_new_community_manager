// Project imports:
import 'package:aku_community_manager/models/common/img_model.dart';

class BorrowDetailItemModel {
  int? id;
  String? name;
  String? code;
  int? borrowStatus;
  List<ImgModel>? imgUrls;
  ImgModel? get firstImg => imgUrls!.isEmpty ? null : imgUrls!.first;
  bool get borrowed => borrowStatus == 2;
  BorrowDetailItemModel(
      {required this.id, this.name, this.code, this.borrowStatus, this.imgUrls});

  BorrowDetailItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    borrowStatus = json['borrowStatus'];
    if (json['imgUrls'] != null) {
      imgUrls = <ImgModel>[];
      json['imgUrls'].forEach((v) {
        imgUrls!.add(new ImgModel.fromJson(v));
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
    if (this.imgUrls != null) {
      data['imgUrls'] = this.imgUrls!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
