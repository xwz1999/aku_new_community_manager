import 'package:aku_new_community_manager/models/common/img_model.dart';

class FacilitiesCheckListModel {
  int? id;
  String? code;
  String? facilitiesName;
  String? facilitiesAddress;
  int? status;
  String? beginDate;
  String? endDate;
  int? situation;
  String? detail;
  String? checkDate;
  List<ImgModel>? imgList;

  FacilitiesCheckListModel(
      {required this.id,
      this.code,
      this.facilitiesName,
      this.facilitiesAddress,
      this.status,
      this.beginDate,
      this.endDate,
      this.situation,
      this.detail,
      this.checkDate,
      this.imgList});

  String get situationString {
    switch (this.situation) {
      case 1:
        return '正常';
      case 2:
        return '异常';
      default:
        return '未知';
    }
  }

  FacilitiesCheckListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    facilitiesName = json['facilitiesName'];
    facilitiesAddress = json['facilitiesAddress'];
    status = json['status'];
    beginDate = json['beginDate'];
    endDate = json['endDate'];
    situation = json['situation'];
    detail = json['detail'];
    checkDate = json['checkDate'];
    if (json['imgList'] != null) {
      imgList = <ImgModel>[];
      json['imgList'].forEach((v) {
        imgList!.add(new ImgModel.fromJson(v));
      });
    } else
      imgList = [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['facilitiesName'] = this.facilitiesName;
    data['facilitiesAddress'] = this.facilitiesAddress;
    data['status'] = this.status;
    data['beginDate'] = this.beginDate;
    data['endDate'] = this.endDate;
    data['situation'] = this.situation;
    data['detail'] = this.detail;
    data['checkDate'] = this.checkDate;
    data['imgList'] = this.imgList;
    return data;
  }
}
