import 'package:aku_community_manager/models/manager/bussiness_and_fix/bussiness_and_fix_model.dart';
import 'package:aku_community_manager/models/todo_bussiness/todo_outdoor_model.dart';

class ToDoModel {
  dynamic dynamicModel;
  int type;

  ToDoModel({this.dynamicModel, this.type});

  ToDoModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    switch (type) {
      case 1:
        dynamicModel = json['dataList'] != null
            ? new BussinessAndFixModel.fromJson(json['dataList'])
            : null;
        break;
      case 2:
        dynamicModel = json['dataList'] != null
            ? new ToDoOutDoorModel.fromJson(json['dataList'])
            : null;
        break;
      default:
        dynamicModel = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dynamicModel != null) {
      data['dataList'] = this.dynamicModel.toJson();
    }
    data['type'] = this.type;
    return data;
  }
}
