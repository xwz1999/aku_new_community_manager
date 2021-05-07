import 'dart:io';

class InspectionPointSubmitModel {
  int executePointId;
  List<ExecuteCheckList> executeCheckList;
  List<String> inspectionFaceImgPath;
  List<String> inspectionSpaceImgPath;
  InspectionPointSubmitModel(this.executePointId, this.executeCheckList,
      {
      this.inspectionFaceImgPath,
      this.inspectionSpaceImgPath});
  Map<String, dynamic> executeCheckListToJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.executeCheckList != null) {
      data["executeCheckList"] =
          this.executeCheckList.map((e) => e.toJson()).toList();
      return data;
    }
  }
}

class ExecuteCheckList {
  int id;
  int status;
  String remarkes;
  ExecuteCheckList(this.id, this.status, this.remarkes);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "id": this.id,
      "status": this.status,
      "remarks": this.remarkes,
    };
    return data;
  }
}
