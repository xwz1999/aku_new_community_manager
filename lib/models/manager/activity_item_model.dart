// Package imports:
import 'package:common_utils/common_utils.dart';

// Project imports:
import 'package:aku_community_manager/models/common/img_model.dart';

class ActivityItemModel {
  int id;
  String title;
  String sponsorName;
  String location;
  String registrationStartTime;
  String registrationEndTime;
  String createDate;
  List<ImgModel> imgUrls;

  ImgModel get firstImg {
    if (imgUrls.isEmpty)
      return null;
    else
      return imgUrls.first;
  }

  DateTime get create => DateUtil.getDateTime(createDate);

  DateTime get registrationStart => DateUtil.getDateTime(registrationStartTime);

  DateTime get registrationEnd => DateUtil.getDateTime(registrationEndTime);

  ActivityItemModel(
      {this.id,
      this.title,
      this.sponsorName,
      this.location,
      this.registrationStartTime,
      this.registrationEndTime,
      this.createDate,
      this.imgUrls});

  ActivityItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    sponsorName = json['sponsorName'];
    location = json['location'];
    registrationStartTime = json['registrationStartTime'];
    registrationEndTime = json['registrationEndTime'];
    createDate = json['createDate'];
    if (json['imgUrls'] != null) {
      imgUrls = new List<ImgModel>();
      json['imgUrls'].forEach((v) {
        imgUrls.add(new ImgModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['sponsorName'] = this.sponsorName;
    data['location'] = this.location;
    data['registrationStartTime'] = this.registrationStartTime;
    data['registrationEndTime'] = this.registrationEndTime;
    data['createDate'] = this.createDate;
    if (this.imgUrls != null) {
      data['imgUrls'] = this.imgUrls.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
