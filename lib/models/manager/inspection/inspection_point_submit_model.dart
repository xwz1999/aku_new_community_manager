// Dart imports:

class InspectionPointSubmitModel {
  int executePointId;
  List<ExecuteCheckList>? executeCheckList;
  List<String?>? inspectionFaceImg;
  List<String?>? inspectionSpaceImg;
  InspectionPointSubmitModel(this.executePointId, this.executeCheckList,
      {this.inspectionFaceImg, this.inspectionSpaceImg});
  Map<String, dynamic>? executeCheckListToJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.executeCheckList != null) {
      data["executeCheckList"] =
          this.executeCheckList!.map((e) => e.toJson()).toList();
      return data;
    }
    return null;
  }
}

class ExecuteCheckList {
  int? id;
  int status;
  String remakes;
  ExecuteCheckList(this.id, this.status, this.remakes);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "id": this.id,
      "status": this.status,
      "remakes": this.remakes,
    };
    return data;
  }
}
