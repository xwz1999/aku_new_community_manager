class InspectionQRCodeModel {
  int id;
  String code;
  String name;
  int type;
  List<CheckVoList> checkVoList;

  InspectionQRCodeModel(
      {this.id, this.code, this.name, this.type, this.checkVoList});

  InspectionQRCodeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    type = json['type'];
    if (json['checkVoList'] != null) {
      checkVoList = new List<CheckVoList>();
      json['checkVoList'].forEach((v) {
        checkVoList.add(new CheckVoList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['type'] = this.type;
    if (this.checkVoList != null) {
      data['checkVoList'] = this.checkVoList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CheckVoList {
  int id;
  String name;

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