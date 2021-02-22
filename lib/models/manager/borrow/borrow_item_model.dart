import 'package:aku_community_manager/models/common/img_model.dart';

class BorrowItemModel {
  int id;
  String name;
  int borrowNum;
  int remainingNum;
  int quantity;
  List<ImgModel> imgUrls;

  ImgModel get firstImg => imgUrls.isEmpty ? null : imgUrls.first;

  BorrowItemModel(
      {this.id,
      this.name,
      this.borrowNum,
      this.remainingNum,
      this.quantity,
      this.imgUrls});

  BorrowItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    borrowNum = json['borrowNum'];
    remainingNum = json['remainingNum'];
    quantity = json['quantity'];
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
    data['borrowNum'] = this.borrowNum;
    data['remainingNum'] = this.remainingNum;
    data['quantity'] = this.quantity;
    if (this.imgUrls != null) {
      data['imgUrls'] = this.imgUrls.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
