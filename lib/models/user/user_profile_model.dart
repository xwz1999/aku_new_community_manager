// Project imports:
import 'package:aku_community_manager/models/common/img_model.dart';

class UserProfileModel {
  int id;
  List<ImgModel> imgUrls;
  String nickName;
  String tel;

  UserProfileModel({this.id, this.imgUrls, this.nickName, this.tel});

  ImgModel get firstImg {
    if (imgUrls.isEmpty)
      return null;
    else
      return imgUrls.first;
  }

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['imgUrls'] != null) {
      imgUrls = new List<ImgModel>();
      json['imgUrls'].forEach((v) {
        imgUrls.add(new ImgModel.fromJson(v));
      });
    }
    nickName = json['nickName'];
    tel = json['tel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.imgUrls != null) {
      data['imgUrls'] = this.imgUrls.map((v) => v.toJson()).toList();
    } else
      imgUrls = [];
    data['nickName'] = this.nickName;
    data['tel'] = this.tel;
    return data;
  }
}
