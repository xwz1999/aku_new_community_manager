class FixedDetailModel {
  HandlingSituation handlingSituation;
  DispatchType dispatchType;
  CostDetail costDetail;
  RepairDetail repairDetail;
  String evaluateInfo;
  int type;
  List<ProcessRecord> processRecord;

  FixedDetailModel(
      {this.handlingSituation,
      this.dispatchType,
      this.costDetail,
      this.repairDetail,
      this.evaluateInfo,
      this.type,
      this.processRecord});

  FixedDetailModel.fromJson(Map<String, dynamic> json) {
    handlingSituation = json['handlingSituation'] != null
        ? new HandlingSituation.fromJson(json['handlingSituation'])
        : null;
    dispatchType = json['dispatchType'] != null
        ? new DispatchType.fromJson(json['dispatchType'])
        : null;
    costDetail = json['costDetail'] != null
        ? new CostDetail.fromJson(json['costDetail'])
        : null;
    repairDetail = json['repairDetail'] != null
        ? new RepairDetail.fromJson(json['repairDetail'])
        : null;
    evaluateInfo = json['evaluateInfo'];
    type = json['type'];
    if (json['processRecord'] != null) {
      processRecord = new List<ProcessRecord>();
      json['processRecord'].forEach((v) {
        processRecord.add(new ProcessRecord.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.handlingSituation != null) {
      data['handlingSituation'] = this.handlingSituation.toJson();
    }
    if (this.dispatchType != null) {
      data['dispatchType'] = this.dispatchType.toJson();
    }
    if (this.costDetail != null) {
      data['costDetail'] = this.costDetail.toJson();
    }
    if (this.repairDetail != null) {
      data['repairDetail'] = this.repairDetail.toJson();
    }
    data['evaluateInfo'] = this.evaluateInfo;
    data['type'] = this.type;
    if (this.processRecord != null) {
      data['processRecord'] =
          this.processRecord.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HandlingSituation {
  int id;
  String detail;
  String materialList;
  List<ImgUrls> imgUrls;

  HandlingSituation({this.id, this.detail, this.materialList, this.imgUrls});

  HandlingSituation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    detail = json['detail'];
    materialList = json['materialList'];
    if (json['imgUrls'] != null) {
      imgUrls = new List<ImgUrls>();
      json['imgUrls'].forEach((v) {
        imgUrls.add(new ImgUrls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['detail'] = this.detail;
    data['materialList'] = this.materialList;
    if (this.imgUrls != null) {
      data['imgUrls'] = this.imgUrls.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImgUrls {
  String url;
  String size;
  int longs;
  int paragraph;
  int sort;

  ImgUrls({this.url, this.size, this.longs, this.paragraph, this.sort});

  ImgUrls.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    size = json['size'];
    longs = json['longs'];
    paragraph = json['paragraph'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['size'] = this.size;
    data['longs'] = this.longs;
    data['paragraph'] = this.paragraph;
    data['sort'] = this.sort;
    return data;
  }
}

class DispatchType {
  int dispatchType;
  String workOrderLimitName;
  String workOrderSubclassName;

  DispatchType(
      {this.dispatchType, this.workOrderLimitName, this.workOrderSubclassName});

  DispatchType.fromJson(Map<String, dynamic> json) {
    dispatchType = json['dispatchType'];
    workOrderLimitName = json['workOrderLimitName'];
    workOrderSubclassName = json['workOrderSubclassName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dispatchType'] = this.dispatchType;
    data['workOrderLimitName'] = this.workOrderLimitName;
    data['workOrderSubclassName'] = this.workOrderSubclassName;
    return data;
  }
}

class CostDetail {
  int laborCost;
  int materialCost;
  int totalCost;

  CostDetail({this.laborCost, this.materialCost, this.totalCost});

  CostDetail.fromJson(Map<String, dynamic> json) {
    laborCost = json['laborCost'];
    materialCost = json['materialCost'];
    totalCost = json['totalCost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['laborCost'] = this.laborCost;
    data['materialCost'] = this.materialCost;
    data['totalCost'] = this.totalCost;
    return data;
  }
}

class RepairDetail {
  int id;
  int dispatchId;
  String name;
  String tel;
  int type;
  int status;
  List<ImgUrls> imgUrls;

  RepairDetail(
      {this.id,
      this.dispatchId,
      this.name,
      this.tel,
      this.type,
      this.status,
      this.imgUrls});

  RepairDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dispatchId = json['dispatchId'];
    name = json['name'];
    tel = json['tel'];
    type = json['type'];
    status = json['status'];
    if (json['imgUrls'] != null) {
      imgUrls = new List<ImgUrls>();
      json['imgUrls'].forEach((v) {
        imgUrls.add(new ImgUrls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dispatchId'] = this.dispatchId;
    data['name'] = this.name;
    data['tel'] = this.tel;
    data['type'] = this.type;
    data['status'] = this.status;
    if (this.imgUrls != null) {
      data['imgUrls'] = this.imgUrls.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProcessRecord {
  int id;
  int operationType;
  String operationDate;

  ProcessRecord({this.id, this.operationType, this.operationDate});

  ProcessRecord.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    operationType = json['operationType'];
    operationDate = json['operationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['operationType'] = this.operationType;
    data['operationDate'] = this.operationDate;
    return data;
  }
}
