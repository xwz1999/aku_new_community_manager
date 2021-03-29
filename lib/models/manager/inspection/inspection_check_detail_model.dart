class InspectionCheckDetialModel {
  int id;
  int executeId;
  String code;
  String name;
  int type;
  String completeDate;
  List<CheckFBIVoList> checkFBIVoList;
  List<String> faceImg;
  List<String> spaceImg;

  InspectionCheckDetialModel(
      {this.id,
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
      checkFBIVoList = new List<CheckFBIVoList>();
      json['checkFBIVoList'].forEach((v) {
        checkFBIVoList.add(new CheckFBIVoList.fromJson(v));
      });
    }
    faceImg = json['faceImg'].cast<String>();
    spaceImg = json['spaceImg'].cast<String>();
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
          this.checkFBIVoList.map((v) => v.toJson()).toList();
    }
    data['faceImg'] = this.faceImg;
    data['spaceImg'] = this.spaceImg;
    return data;
  }
}

class CheckFBIVoList {
  int id;
  String name;
  int status;
  String remakes;

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
