import 'dart:io';

class InspectionPointSubmitModel {
  int executePointId;
  List<ExecuteCheckList> executeCheckList;
  File inspectionFaceImg;
  File inspectionSpaceImg;
  List<String> inspectionFaceImgPath;
  List<String> inspectionSpaceImgPath;
  InspectionPointSubmitModel(this.executePointId, this.executeCheckList,
      {this.inspectionFaceImg,
      this.inspectionSpaceImg,
      this.inspectionFaceImgPath,
      this.inspectionSpaceImgPath});
  // Map<String, dynamic> executeCheckListToJson() {
  //   final Map<String,dynamic>
  //   if (this.executeCheckList != null) {
  //     this.executeCheckList.map((e) => e.toJson()).toList();
  //     return
  //   } else {}
  // }
}

class ExecuteCheckList {
  int id;
  int status;
  String remarks;
  ExecuteCheckList(this.id, this.status, this.remarks);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "id": this.id,
      "status": this.status,
      "remarks": this.remarks,
    };
    return data;
  }
}
