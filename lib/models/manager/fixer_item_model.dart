class FixerItemModel {
  int? id;
  String? name;
  List<RepairmanVos>? repairmanVos;

  FixerItemModel({required this.id, this.name, this.repairmanVos});

  FixerItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['repairmanVos'] != null) {
      repairmanVos = <RepairmanVos>[];
      json['repairmanVos'].forEach((v) {
        repairmanVos!.add(new RepairmanVos.fromJson(v));
      });
    } else
      repairmanVos = [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.repairmanVos != null) {
      data['repairmanVos'] = this.repairmanVos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RepairmanVos {
  int? id;
  String? name;
  String? tel;

  RepairmanVos({this.id, this.name, this.tel});

  RepairmanVos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tel = json['tel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['tel'] = this.tel;
    return data;
  }
}
