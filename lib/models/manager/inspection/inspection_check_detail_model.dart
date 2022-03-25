// Project imports:
import 'package:aku_new_community_manager/models/common/img_model.dart';

class InspectionCheckDetialModel {
  int? id;
  int? executeId;
  String? code;
  String? name;
  int? type;
  String? completeDate;
  List<CheckFBIVoList>? checkList;
  List<ImgModel>? faceImgList;
  List<ImgModel>? spaceImgList;

  InspectionCheckDetialModel(
      {required this.id,
      this.executeId,
      this.code,
      this.name,
      this.type,
      this.completeDate,
      this.checkList,
      this.faceImgList,
      this.spaceImgList});

  InspectionCheckDetialModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    executeId = json['executeId'];
    code = json['code'];
    name = json['name'];
    type = json['type'];
    completeDate = json['completeDate'];
    if (json['checkList'] != null) {
      checkList = <CheckFBIVoList>[];
      json['checkList'].forEach((v) {
        checkList!.add(new CheckFBIVoList.fromJson(v));
      });
    }
    if (json['faceImgList'] != null) {
      faceImgList = <ImgModel>[];
      json['faceImgList'].forEach((v) {
        faceImgList!.add(new ImgModel.fromJson(v));
      });
    }
    if (json['spaceImgList'] != null) {
      spaceImgList = <ImgModel>[];
      json['spaceImgList'].forEach((v) {
        spaceImgList!.add(new ImgModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['executeId'] = this.executeId;
    data['code'] = this.code;
    data['name'] = this.name;
    data['type'] = this.type;
    data['completeDate'] = this.completeDate;
    if (this.checkList != null) {
      data['checkList'] = this.checkList!.map((v) => v.toJson()).toList();
    }
    if (this.faceImgList != null) {
      data['faceImgList'] = this.faceImgList!.map((v) => v.toJson()).toList();
    }
    if (this.spaceImgList != null) {
      data['spaceImgList'] = this.spaceImgList!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  String get inspectionPattern {
    switch (this.type) {
      case 1:
        return '巡检模式1';

      default:
        return '未知';
    }
  }
}

class CheckFBIVoList {
  int? id;
  String? name;
  int? status;
  String? remakes;

  CheckFBIVoList({this.id, this.name, this.status, this.remakes});

  CheckFBIVoList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    remakes = json['remakes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['remakes'] = this.remakes;
    return data;
  }
}

class FaceImg {
  String? url;
  int? size;
  int? longs;
  int? paragraph;
  int? sort;

  FaceImg({this.url, this.size, this.longs, this.paragraph, this.sort});

  FaceImg.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    size = json['size'];
    longs = json['longs'];
    paragraph = json['paragraph'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['size'] = this.size;
    data['longs'] = this.longs;
    data['paragraph'] = this.paragraph;
    data['sort'] = this.sort;
    return data;
  }
}
