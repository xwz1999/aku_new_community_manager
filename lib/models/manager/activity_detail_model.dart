import 'package:aku_community_manager/models/common/img_model.dart';
import 'package:common_utils/common_utils.dart';

class ActivityDetailModel {
  int id;
  String title;
  String content;
  String activityStartTime;
  String activityEndTime;
  String location;
  String registrationEndTime;
  List<ImgModel> imgUrls;
  ImgModel get firstImg {
    if (imgUrls.isEmpty)
      return null;
    else
      return imgUrls.first;
  }

  DateTime get registrationEnd => DateUtil.getDateTime(registrationEndTime);

  DateTime get activityStart => DateUtil.getDateTime(activityStartTime);

  DateTime get activityEnd => DateUtil.getDateTime(activityEndTime);

  ActivityDetailModel(
      {this.id,
      this.title,
      this.content,
      this.activityStartTime,
      this.activityEndTime,
      this.location,
      this.registrationEndTime,
      this.imgUrls});

  ActivityDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    activityStartTime = json['activityStartTime'];
    activityEndTime = json['activityEndTime'];
    location = json['location'];
    registrationEndTime = json['registrationEndTime'];
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
    data['content'] = this.content;
    data['activityStartTime'] = this.activityStartTime;
    data['activityEndTime'] = this.activityEndTime;
    data['location'] = this.location;
    data['registrationEndTime'] = this.registrationEndTime;
    if (this.imgUrls != null) {
      data['imgUrls'] = this.imgUrls.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
