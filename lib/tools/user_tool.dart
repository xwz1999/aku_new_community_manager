// Package imports:
// Project imports:
import 'package:aku_new_community_manager/provider/app_provider.dart';
import 'package:aku_new_community_manager/provider/data_provider.dart';
import 'package:aku_new_community_manager/provider/message_provider.dart';
import 'package:aku_new_community_manager/provider/user_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

///获取应用或用户状态
class UserTool {
  ///应用信息
  static AppProvider get appProvider =>
      Provider.of<AppProvider>(Get.context!, listen: false);

  ///用户信息
  static UserProvider get userProvider =>
      Provider.of<UserProvider>(Get.context!, listen: false);

  ///消息中心
  static MessageProvider get messageProvider =>
      Provider.of<MessageProvider>(Get.context!, listen: false);

  ///本地存储数据信息
  static DataProvider get dataProvider =>
      Provider.of<DataProvider>(Get.context!, listen: false);

  UserTool();
}
