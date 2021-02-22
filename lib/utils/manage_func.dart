import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/utils/network/base_list_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';

class ManageFunc {
  static Future visitorList(int page, int size, {int statuts}) async {
    BaseListModel baseListModel;
    if (statuts == 0) {
      baseListModel = await NetUtil().getList(API.manage.visitorList, params: {
        'pageNum': page,
        'size': size,
      });
    } else {
      baseListModel = await NetUtil().getList(API.manage.visitorList, params: {
        'pageNum': page,
        'size': size,
        'visitorStatus': statuts,
      });
    }

    return baseListModel;
  }
}
