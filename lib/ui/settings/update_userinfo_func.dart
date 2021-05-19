// Project imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';

class UpdateUserInfoFunc {
  static Future<BaseModel> sendTelUpdateCode(String tel) async {
    BaseModel baseModel =
        await NetUtil().post(API.user.sendTelUpdateCode, params: {
      'newTel': tel,
    });
    return baseModel;
  }

  static Future<BaseModel> updateTel(
      String oldTel, String newTel, String code) async {
    BaseModel baseModel = await NetUtil().post(API.user.updateTel, params: {
      'oldTel': oldTel,
      'newTel': newTel,
      'code': code,
    });
    return baseModel;
  }
}
