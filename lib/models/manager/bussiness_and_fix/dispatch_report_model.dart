class DispatchReportModel {
  int dispatchListId;
  int workOrderTyoe;
  int workOrderTypeDetail;
  int workOrderTimeLimit;
  int type;
  int operato;
  String remark;

  DispatchReportModel.zero() {
    dispatchListId = 0;
    workOrderTyoe = 0;
    workOrderTyoe = 0;
    workOrderTimeLimit = 0;
    type = 0;
    operato = 0;
    remark = '';
  }
  DispatchReportModel(
      {this.dispatchListId,
      this.operato,
      this.remark,
      this.type,
      this.workOrderTimeLimit,
      this.workOrderTyoe,
      this.workOrderTypeDetail});
}
