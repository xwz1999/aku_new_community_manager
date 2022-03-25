class InspectionQRCodeModel {
  int? id;
  String? code;
  String? name;
  int? type;
  List<CheckVoList>? checkList;

  InspectionQRCodeModel(
      {required this.id, this.code, this.name, this.type, this.checkList});

  InspectionQRCodeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    type = json['type'];
    if (json['checkList'] != null) {
      checkList = <CheckVoList>[];
      json['checkVoList'].forEach((v) {
        checkList!.add(new CheckVoList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['type'] = this.type;
    if (this.checkList != null) {
      data['checkList'] = this.checkList!.map((v) => v.toJson()).toList();
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

class CheckVoList {
  int? id;
  String? name;

  CheckVoList({this.id, this.name});

  CheckVoList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
