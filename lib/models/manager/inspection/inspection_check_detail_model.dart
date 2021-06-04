// Project imports:
import 'package:aku_community_manager/models/common/img_model.dart';

class InspectionCheckDetialModel {
  int? id;
  int? executeId;
  String? code;
  String? name;
  int? type;
  String? completeDate;
  List<CheckFBIVoList>? checkFBIVoList;
  List<ImgModel>? faceImg;
  List<ImgModel>? spaceImg;

  InspectionCheckDetialModel(
      {required this.id,
      this.executeId,
      this.code,
      this.name,
      this.type,
      this.completeDate,
      this.checkFBIVoList,
      this.faceImg,
      this.spaceImg});

  InspectionCheckDetialModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    executeId = json['executeId'];
    code = json['code'];
    name = json['name'];
    type = json['type'];
    completeDate = json['completeDate'];
    if (json['checkFBIVoList'] != null) {
      checkFBIVoList = <CheckFBIVoList>[];
      json['checkFBIVoList'].forEach((v) {
        checkFBIVoList!.add(new CheckFBIVoList.fromJson(v));
      });
    }
    if (json['faceImg'] != null) {
      faceImg = <ImgModel>[];
      json['faceImg'].forEach((v) {
        faceImg!.add(new ImgModel.fromJson(v));
      });
    }
    if (json['spaceImg'] != null) {
      spaceImg = <ImgModel>[];
      json['spaceImg'].forEach((v) {
        spaceImg!.add(new ImgModel.fromJson(v));
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
    if (this.checkFBIVoList != null) {
      data['checkFBIVoList'] =
          this.checkFBIVoList!.map((v) => v.toJson()).toList();
    }
    if (this.faceImg != null) {
      data['faceImg'] = this.faceImg!.map((v) => v.toJson()).toList();
    }
    if (this.spaceImg != null) {
      data['spaceImg'] = this.spaceImg!.map((v) => v.toJson()).toList();
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
