import 'dart:io';

class InspectionPointSubmitModel {
  int executePointId;
  List<ExecuteCheckList> executeCheckList;
  File inspectionFaceImg;
  File inspectionSpaceImg;
  String inspectionFaceImgPath;
  String inspectionSpaceImgPath;
  InspectionPointSubmitModel(this.executePointId, this.executeCheckList,
      {this.inspectionFaceImg,
      this.inspectionSpaceImg,
      this.inspectionFaceImgPath,
      this.inspectionSpaceImgPath});
}

class ExecuteCheckList {
  int id;
  int status;
  String remarks;
  ExecuteCheckList(this.id, this.status, this.remarks);
}
