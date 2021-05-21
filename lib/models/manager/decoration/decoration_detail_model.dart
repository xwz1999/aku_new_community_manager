class DecorationDetailModel {
  TrackInspectionFBIVo trackInspectionFBIVo;
  DecorationFBIVo decorationFBIVo;
  List<ChecksContentVos> checksContentVos;
  List<TrackRecordVos> trackRecordVos;

  DecorationDetailModel(
      {this.trackInspectionFBIVo,
      this.decorationFBIVo,
      this.checksContentVos,
      this.trackRecordVos});

  DecorationDetailModel.fromJson(Map<String, dynamic> json) {
    trackInspectionFBIVo = json['trackInspectionFBIVo'] != null
        ? new TrackInspectionFBIVo.fromJson(json['trackInspectionFBIVo'])
        : null;
    decorationFBIVo = json['decorationFBIVo'] != null
        ? new DecorationFBIVo.fromJson(json['decorationFBIVo'])
        : null;
    if (json['checksContentVos'] != null) {
      checksContentVos = new List<ChecksContentVos>();
      json['checksContentVos'].forEach((v) {
        checksContentVos.add(new ChecksContentVos.fromJson(v));
      });
    }
    if (json['trackRecordVos'] != null) {
      trackRecordVos = new List<TrackRecordVos>();
      json['trackRecordVos'].forEach((v) {
        trackRecordVos.add(new TrackRecordVos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trackInspectionFBIVo != null) {
      data['trackInspectionFBIVo'] = this.trackInspectionFBIVo.toJson();
    }
    if (this.decorationFBIVo != null) {
      data['decorationFBIVo'] = this.decorationFBIVo.toJson();
    }
    if (this.checksContentVos != null) {
      data['checksContentVos'] =
          this.checksContentVos.map((v) => v.toJson()).toList();
    }
    if (this.trackRecordVos != null) {
      data['trackRecordVos'] =
          this.trackRecordVos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrackInspectionFBIVo {
  int id;
  int trackId;
  String trackName;
  String startDate;
  int inspectionCycle;

  TrackInspectionFBIVo(
      {this.id,
      this.trackId,
      this.trackName,
      this.startDate,
      this.inspectionCycle});

  TrackInspectionFBIVo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trackId = json['trackId'];
    trackName = json['trackName'];
    startDate = json['startDate'];
    inspectionCycle = json['inspectionCycle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['trackId'] = this.trackId;
    data['trackName'] = this.trackName;
    data['startDate'] = this.startDate;
    data['inspectionCycle'] = this.inspectionCycle;
    return data;
  }
}

class DecorationFBIVo {
  int id;
  String roomName;
  String residentName;
  String residentTel;
  String constructionUnit;
  String director;
  String directorTel;
  String actualBegin;
  String expectedEnd;
  int tracker;

  DecorationFBIVo(
      {this.id,
      this.roomName,
      this.residentName,
      this.residentTel,
      this.constructionUnit,
      this.director,
      this.directorTel,
      this.actualBegin,
      this.expectedEnd,
      this.tracker});

  DecorationFBIVo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomName = json['roomName'];
    residentName = json['residentName'];
    residentTel = json['residentTel'];
    constructionUnit = json['constructionUnit'];
    director = json['director'];
    directorTel = json['directorTel'];
    actualBegin = json['actualBegin'];
    expectedEnd = json['expectedEnd'];
    tracker = json['tracker'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['roomName'] = this.roomName;
    data['residentName'] = this.residentName;
    data['residentTel'] = this.residentTel;
    data['constructionUnit'] = this.constructionUnit;
    data['director'] = this.director;
    data['directorTel'] = this.directorTel;
    data['actualBegin'] = this.actualBegin;
    data['expectedEnd'] = this.expectedEnd;
    data['tracker'] = this.tracker;
    return data;
  }
}

class ChecksContentVos {
  int id;
  String name;

  ChecksContentVos({this.id, this.name});

  ChecksContentVos.fromJson(Map<String, dynamic> json) {
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

class TrackRecordVos {
  int id;
  String trackDate;
  int type;
  String description;
  int result;
  List<RecordDetailVoList> recordDetailVoList;

  TrackRecordVos(
      {this.id,
      this.trackDate,
      this.type,
      this.description,
      this.result,
      this.recordDetailVoList});

  String get typeString {
    switch (this.type) {
      case 1:
        return '周期检查';
      case 2:
        return '完工检查';
      default:
        return '未知';
    }
  }

  String get resultString {
    switch (this.result) {
      case 1:
        return '合格';
      case 2:
        return '不合格';

      default:
        return '未知';
    }
  }

  TrackRecordVos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trackDate = json['trackDate'];
    type = json['type'];
    description = json['description'];
    result = json['result'];
    if (json['recordDetailVoList'] != null) {
      recordDetailVoList = new List<RecordDetailVoList>();
      json['recordDetailVoList'].forEach((v) {
        recordDetailVoList.add(new RecordDetailVoList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['trackDate'] = this.trackDate;
    data['type'] = this.type;
    data['description'] = this.description;
    data['result'] = this.result;
    if (this.recordDetailVoList != null) {
      data['recordDetailVoList'] =
          this.recordDetailVoList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecordDetailVoList {
  int id;
  String checksContent;
  int isQualified;

  RecordDetailVoList({this.id, this.checksContent, this.isQualified});

  RecordDetailVoList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    checksContent = json['checksContent'];
    isQualified = json['isQualified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['checksContent'] = this.checksContent;
    data['isQualified'] = this.isQualified;
    return data;
  }

  String get qualifiedString {
    switch (this.isQualified) {
      case 1:
        return '正常';
      case 2:
        return '异常';
      default:
        return '未知';
    }
  }
  
}
