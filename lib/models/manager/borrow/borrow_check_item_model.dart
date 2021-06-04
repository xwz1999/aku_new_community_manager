// Project imports:
import 'package:aku_community_manager/models/common/img_model.dart';

class BorrowCheckItemModel {
  int? id;
  int? articleDetailId;
  String? articleName;
  String? code;
  int? status;
  List<ImgModel>? imgUrls;
  ImgModel? get firstImg => imgUrls!.isEmpty ? null : imgUrls!.first;

  BorrowCheckItemModel(
      {required this.id,
      this.articleDetailId,
      this.articleName,
      this.code,
      this.status,
      this.imgUrls});

  BorrowCheckItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    articleDetailId = json['articleDetailId'];
    articleName = json['articleName'];
    code = json['code'];
    status = json['status'];
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
    data['articleDetailId'] = this.articleDetailId;
    data['articleName'] = this.articleName;
    data['code'] = this.code;
    data['status'] = this.status;
    if (this.imgUrls != null) {
      data['imgUrls'] = this.imgUrls!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
