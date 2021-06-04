class DispatchReportModel {
  int? dispatchListId;
  int? workOrderTyoe;
  int? workOrderTypeDetail;
  int? workOrderTimeLimit;
  int? type;
  int? operato;
  String? remark;

  DispatchReportModel.zero() {
    dispatchListId = -1;
    workOrderTyoe = -1;
    workOrderTypeDetail = -1;
    workOrderTimeLimit = -1;
    type = -1;
    operato = -1;
    remark = '';
  }
  DispatchReportModel(
      {required this.dispatchListId,
      this.operato,
      this.remark,
      this.type,
      this.workOrderTimeLimit,
      this.workOrderTyoe,
      this.workOrderTypeDetail});
}
