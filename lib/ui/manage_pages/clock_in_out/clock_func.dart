import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/clock_in_out/today_clock_record_model.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:common_utils/common_utils.dart';

class ClockFunc {
  static Future initClockInfo() async {
    BaseModel baseModel = await NetUtil().get(API.manage.todayClockRecord);
    if (baseModel.status && baseModel.data != null) {
      return TodayClockRecordModel.fromJson(baseModel.data);
    } else {
      BotToast.showText(text: baseModel.message);
    }
  }

  static Future clockIn(int id, DateTime dateTime) async {
    BaseModel baseModel = await NetUtil().post(
      API.manage.clockInOut,
      params: {
        "id": id,
        "startClockDate":
            DateUtil.formatDate(dateTime, format: 'yyyy-MM-dd HH:mm:ss'),
      },
      showMessage: true,
    );
  }

  static Future clockOut(int id, DateTime dateTime) async {
    BaseModel baseModel = await NetUtil().post(API.manage.clockInOut,
        params: {
          "id": id,
          "endClockDate":
              DateUtil.formatDate(dateTime, format: 'yyyy-MM-dd HH:mm:ss'),
        },
        showMessage: true);
  }

  static Future clockApply(
      String reason, int type, DateTime start, DateTime end) async {
    BaseModel baseModel = await NetUtil().post(API.manage.clockApply,
        params: {
          "reason": reason,
          'type': type,
          "startDate":
              DateUtil.formatDate(start, format: 'yyyy-MM-dd HH:mm:ss'),
          "endDate": DateUtil.formatDate(end, format: 'yyyy-MM-dd HH:mm:ss')
        },
        showMessage: true);
    return baseModel.status;
  }
}
