class BussinessAndFixModel {
  int? id;
  int? dispatchId;
  String? reportDetail;
  String? repairDate;
  int? status;
  List<ImgUrls>? imgUrls;
  int? type;

  BussinessAndFixModel(
      {required this.id,
      this.dispatchId,
      this.reportDetail,
      this.repairDate,
      this.status,
      this.imgUrls,
      this.type});

  BussinessAndFixModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dispatchId = json['dispatchId'];
    reportDetail = json['reportDetail'];
    repairDate = json['repairDate'];
    status = json['status'];
    if (json['imgUrls'] != null) {
      imgUrls = [];
      json['imgUrls'].forEach((v) {
        imgUrls!.add(new ImgUrls.fromJson(v));
      });
    }
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dispatchId'] = this.dispatchId;
    data['reportDetail'] = this.reportDetail;
    data['repairDate'] = this.repairDate;
    data['status'] = this.status;
    if (this.imgUrls != null) {
      data['imgUrls'] = this.imgUrls!.map((v) => v.toJson()).toList();
    }
    data['type'] = this.type;
    return data;
  }
}

class ImgUrls {
  String? url;
  String? size;
  int? longs;
  int? paragraph;
  int? sort;

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
