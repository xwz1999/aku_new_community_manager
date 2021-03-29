import 'dart:io';

class InspectionPointSubmitModel {
  int executePointId;
  List<ExecuteCheckList> executeCheckList;
  File inspectionFaceImg;
  File inspectionSpaceImg;
  InspectionPointSubmitModel();
}

class ExecuteCheckList {
  int id;
  int status;
  String remarks;
  ExecuteCheckList();
}
