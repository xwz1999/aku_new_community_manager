import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/json_models/manager/house_keeping/house_keeping_process_model.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';

class HouseKeepingFunc {
   ///获取家政服务进程
  static Future getHouseKeepingProcess(int id) async {
    BaseModel baseModel = await NetUtil().get(API.manage.newHouseKeepingProcess,
        params: {"housekeepingServiceId": id});
    if (baseModel.status ?? false) {
      return (baseModel.data as List)
          .map((e) => HouseKeepingProcessModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }
}