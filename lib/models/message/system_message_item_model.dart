// Package imports:
import 'package:common_utils/common_utils.dart';

class SystemMessageItemModel {
  int id;
  int type;
  int relationId;
  String sendDate;

  SystemMessageItemModel({this.id, this.type, this.relationId, this.sendDate});

  SystemMessageItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    relationId = json['relationId'];
    sendDate = json['sendDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['relationId'] = this.relationId;
    data['sendDate'] = this.sendDate;
    return data;
  }

  String get sendDateString =>
      DateUtil.formatDateStr(this.sendDate, format: 'yyyy-MM-dd HH:mm');
}
