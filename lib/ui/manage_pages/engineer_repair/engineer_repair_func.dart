import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';

class EngineerRepairFunc {
  static Future addEngineerRepair(
      String area, int type, String reportDetail, List<String> urls) async {
    var model =
        await NetUtil().post(API.engineerRepair.engineerRepairInsert, params: {
      'repairArea': area,
      'type': type,
      'reportDetail': reportDetail,
      'fileUrls': urls,
    });
    return model.status ?? false;
  }
}
