// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:common_utils/common_utils.dart';

// Project imports:
import 'package:aku_community_manager/models/common/img_model.dart';

// *	id	物品出户主键id
// *	status	状态(1.待出门，2.已出门，3.驳回申请)
// *	roomName	详细地址（房产名称）
// *	applicantName	出户人（申请人）
// *	identity	身份（1业主，2亲属，3租客）
// *	applicantTel	联系方式（申请人电话）
// *	expectedTime	预计出户时间
// *	articleOutName	出户物品
// *	weight	物品重量(1. <50kg , 2. 50kg-100kg , 3. >100kg)
// *	approach	搬运方式（1.自己搬运，2.搬家公司）
// *	imgUrls	物品照片
// *	reviewDate	审核时间【status=2:出门时间，status=3:驳回时间】
// *	export	出口(1.东门，2.南门，3.西门，4.北门)【status=2时显示】
// *	remarks	备注（不放行理由，驳回申请时使用）【status=3时显示】
class GoodsOutDetailModel {
  int? id;

  ///status	状态(1.待出门，2.已出门，3.驳回申请)
  int? status;
  String? roomName;
  String? applicantName;

  ///identity	身份（1业主，2亲属，3租客）
  int? identity;
  String? applicantTel;
  String? expectedTime;
  String? articleOutName;
  int? weight;

  ///approach	搬运方式（1.自己搬运，2.搬家公司）
  int? approach;
  List<ImgModel>? imgUrls;
  String? reviewDate;
  int? export;
  String? remarks;

  String get exportValue {
    switch (export) {
      case 1:
        return '东门';
      case 2:
        return '南门';
      case 3:
        return '西门';
      case 4:
        return '北门';
      default:
        return '未知';
    }
  }

  DateTime? get review => DateUtil.getDateTime(reviewDate!);
  DateTime? get expected => DateUtil.getDateTime(expectedTime!);

  ///approach	搬运方式（1.自己搬运，2.搬家公司）
  String get approachValue {
    switch (approach) {
      case 1:
        return '自己搬运';
      case 2:
        return '搬家公司';

      default:
        return '未知';
    }
  }

  ///status	状态(1.待出门，2.已出门，3.驳回申请)
  String get statusValue {
    switch (status) {
      case 1:
        return '待出门';
      case 2:
        return '已出门';
      case 3:
        return '驳回申请';
      default:
        return ' 未知';
    }
  }

  Color get statusColor {
    switch (status) {
      case 2:
        return Color(0xFF999999);
      default:
        return Color(0xFFFF4501);
    }
  }

  ///identity	身份（1业主，2亲属，3租客）
  String get identityValue {
    switch (identity) {
      case 1:
        return '业主';
      case 2:
        return '亲属';
      case 3:
        return '租客';
      default:
        return '未知';
    }
  }

  String get weightValue {
    switch (weight) {
      case 1:
        return '<50kg';
      case 2:
        return '50kg-100kg';
      case 3:
        return '>100kg';
      default:
        return '未知';
    }
  }

  GoodsOutDetailModel(
      {required this.id,
      this.status,
      this.roomName,
      this.applicantName,
      this.identity,
      this.applicantTel,
      this.expectedTime,
      this.articleOutName,
      this.weight,
      this.approach,
      this.imgUrls,
      this.reviewDate,
      this.export,
      this.remarks});

  GoodsOutDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    roomName = json['roomName'];
    applicantName = json['applicantName'];
    identity = json['identity'];
    applicantTel = json['applicantTel'];
    expectedTime = json['expectedTime'];
    articleOutName = json['articleOutName'];
    weight = json['weight'];
    approach = json['approach'];
    if (json['imgUrls'] != null) {
      imgUrls = <ImgModel>[];
      json['imgUrls'].forEach((v) {
        imgUrls!.add(new ImgModel.fromJson(v));
      });
    } else
      imgUrls = [];
    reviewDate = json['reviewDate'];
    export = json['export'];
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['roomName'] = this.roomName;
    data['applicantName'] = this.applicantName;
    data['identity'] = this.identity;
    data['applicantTel'] = this.applicantTel;
    data['expectedTime'] = this.expectedTime;
    data['articleOutName'] = this.articleOutName;
    data['weight'] = this.weight;
    data['approach'] = this.approach;
    if (this.imgUrls != null) {
      data['imgUrls'] = this.imgUrls!.map((v) => v.toJson()).toList();
    }
    data['reviewDate'] = this.reviewDate;
    data['export'] = this.export;
    data['remarks'] = this.remarks;
    return data;
  }
}
