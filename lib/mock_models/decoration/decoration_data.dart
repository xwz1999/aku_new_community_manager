// Project imports:
import 'package:aku_community_manager/mock_models/decoration/decoration_model.dart';
import 'package:aku_community_manager/mock_models/fix/fixer_model.dart';

class DecorationData {
  static List<DecorationModel> allModels = [
    DecorationModel(
      type: DecorationType.WAIT_HAND_OUT,
      statusType: DecorationStatusType.PROGRESS,
      decorationDate: DateTime(2020, 1, 23, 12, 23, 0),
      userHomeModel: UserHomeModel(
        userName: '林居明',
        plot: '深圳华茂悦峰',
        detailAddr: '2幢-2单元-501室',
        phone: '19995430126',
      ),
      decorationTeamModel: DecorationTeamModel(
        name: '深圳莫川装修有限公司',
        userName: '李惠政',
        phone: '19298540192',
      ),
      cycleCheck: CycleCheck(),
    ),
    DecorationModel(
      decorationDate: DateTime(2020, 1, 23, 12, 23, 0),
      type: DecorationType.HAND_OUT,
      statusType: DecorationStatusType.DONE,
      userHomeModel: UserHomeModel(
        userName: '李慧珍',
        plot: '深圳华茂悦峰',
        detailAddr: '1幢-1单元-302室',
        phone: '18201939840',
      ),
      decorationTeamModel: DecorationTeamModel(
        name: '深圳莫川装修有限公司',
        userName: '李惠政',
        phone: '19298540192',
      ),
      cycleCheck: CycleCheck(
        authPerson: FixerModel(name: '林鸿章', phone: '18294859301'),
        startDate: DateTime(2020, 1, 23, 20, 23, 0),
        checkCycle: 7,
        checkDetails: [
          CHECK_TYPE.ELECTRIC,
          CHECK_TYPE.WATER,
          CHECK_TYPE.WALL,
          CHECK_TYPE.DOOR_AND_WINDOWS,
        ],
      ),
      workFinishCheck: WorkFinishCheck(
        authPerson: FixerModel(name: '林鸿章', phone: '18294859301'),
        startDate: DateTime(2020, 1, 23, 20, 23, 0),
        checkDetails: [
          CHECK_TYPE.ELECTRIC,
          CHECK_TYPE.WATER,
          CHECK_TYPE.WALL,
          CHECK_TYPE.DOOR_AND_WINDOWS,
          CHECK_TYPE.SECURITY,
        ],
      ),
      checkInfomations: [
        CheckInfomation(
          checkDate: DateTime(2020, 3, 20, 12, 00),
          info: '正常',
          checkType: '完工检查',
          details: [
            CheckDetail(type: CHECK_TYPE.ELECTRIC),
            CheckDetail(type: CHECK_TYPE.WATER),
            CheckDetail(type: CHECK_TYPE.WALL),
            CheckDetail(type: CHECK_TYPE.DOOR_AND_WINDOWS),
          ],
        ),
        CheckInfomation(
          checkDate: DateTime(2020, 2, 14, 12, 00),
          info: '正常',
          checkType: '周期检查',
          details: [
            CheckDetail(type: CHECK_TYPE.ELECTRIC),
            CheckDetail(type: CHECK_TYPE.WATER),
            CheckDetail(type: CHECK_TYPE.WALL),
            CheckDetail(type: CHECK_TYPE.DOOR_AND_WINDOWS),
          ],
        ),
        CheckInfomation(
          checkDate: DateTime(2020, 2, 7, 12, 00),
          info: '厨房水路异常',
          checkType: '周期检查',
          details: [
            CheckDetail(type: CHECK_TYPE.ELECTRIC),
            CheckDetail(type: CHECK_TYPE.WATER, status: false),
            CheckDetail(type: CHECK_TYPE.WALL),
            CheckDetail(type: CHECK_TYPE.DOOR_AND_WINDOWS),
          ],
        ),
        CheckInfomation(
          checkDate: DateTime(2020, 1, 30, 12, 00),
          info: '正常',
          checkType: '周期检查',
          details: [
            CheckDetail(type: CHECK_TYPE.ELECTRIC),
            CheckDetail(type: CHECK_TYPE.WATER),
            CheckDetail(type: CHECK_TYPE.WALL),
            CheckDetail(type: CHECK_TYPE.DOOR_AND_WINDOWS),
          ],
        ),
        CheckInfomation(
          checkDate: DateTime(2020, 1, 23, 12, 00),
          info: '正常',
          checkType: '周期检查',
          details: [
            CheckDetail(type: CHECK_TYPE.ELECTRIC),
            CheckDetail(type: CHECK_TYPE.WATER),
            CheckDetail(type: CHECK_TYPE.WALL),
            CheckDetail(type: CHECK_TYPE.DOOR_AND_WINDOWS),
          ],
        ),
      ],
    ),
    DecorationModel(
      decorationDate: DateTime(2020, 1, 23, 12, 23, 0),
      type: DecorationType.DONE,
      statusType: DecorationStatusType.DONE,
      userHomeModel: UserHomeModel(
        userName: '李慧珍',
        plot: '深圳华茂悦峰',
        detailAddr: '1幢-1单元-302室',
        phone: '18201939840',
      ),
      decorationTeamModel: DecorationTeamModel(
        name: '深圳莫川装修有限公司',
        userName: '李惠政',
        phone: '19298540192',
      ),
      cycleCheck: CycleCheck(
        authPerson: FixerModel(name: '林鸿章', phone: '18294859301'),
        startDate: DateTime(2020, 1, 23, 20, 23, 0),
        checkCycle: 7,
        checkDetails: [
          CHECK_TYPE.ELECTRIC,
          CHECK_TYPE.WATER,
          CHECK_TYPE.WALL,
          CHECK_TYPE.DOOR_AND_WINDOWS,
        ],
      ),
      workFinishCheck: WorkFinishCheck(
        authPerson: FixerModel(name: '林鸿章', phone: '18294859301'),
        startDate: DateTime(2020, 1, 23, 20, 23, 0),
        checkDetails: [
          CHECK_TYPE.ELECTRIC,
          CHECK_TYPE.WATER,
          CHECK_TYPE.WALL,
          CHECK_TYPE.DOOR_AND_WINDOWS,
          CHECK_TYPE.SECURITY,
        ],
      ),
      checkInfomations: [
        CheckInfomation(
          checkDate: DateTime(2020, 3, 20, 12, 00),
          info: '正常',
          checkType: '完工检查',
          details: [
            CheckDetail(type: CHECK_TYPE.ELECTRIC),
            CheckDetail(type: CHECK_TYPE.WATER),
            CheckDetail(type: CHECK_TYPE.WALL),
            CheckDetail(type: CHECK_TYPE.DOOR_AND_WINDOWS),
          ],
        ),
        CheckInfomation(
          checkDate: DateTime(2020, 2, 14, 12, 00),
          info: '正常',
          checkType: '周期检查',
          details: [
            CheckDetail(type: CHECK_TYPE.ELECTRIC),
            CheckDetail(type: CHECK_TYPE.WATER),
            CheckDetail(type: CHECK_TYPE.WALL),
            CheckDetail(type: CHECK_TYPE.DOOR_AND_WINDOWS),
          ],
        ),
        CheckInfomation(
          checkDate: DateTime(2020, 2, 7, 12, 00),
          info: '厨房水路异常',
          checkType: '周期检查',
          details: [
            CheckDetail(type: CHECK_TYPE.ELECTRIC),
            CheckDetail(type: CHECK_TYPE.WATER, status: false),
            CheckDetail(type: CHECK_TYPE.WALL),
            CheckDetail(type: CHECK_TYPE.DOOR_AND_WINDOWS),
          ],
        ),
        CheckInfomation(
          checkDate: DateTime(2020, 1, 30, 12, 00),
          info: '正常',
          checkType: '周期检查',
          details: [
            CheckDetail(type: CHECK_TYPE.ELECTRIC),
            CheckDetail(type: CHECK_TYPE.WATER),
            CheckDetail(type: CHECK_TYPE.WALL),
            CheckDetail(type: CHECK_TYPE.DOOR_AND_WINDOWS),
          ],
        ),
        CheckInfomation(
          checkDate: DateTime(2020, 1, 23, 12, 00),
          info: '正常',
          checkType: '周期检查',
          details: [
            CheckDetail(type: CHECK_TYPE.ELECTRIC),
            CheckDetail(type: CHECK_TYPE.WATER),
            CheckDetail(type: CHECK_TYPE.WALL),
            CheckDetail(type: CHECK_TYPE.DOOR_AND_WINDOWS),
          ],
        ),
      ],
    ),
  ];

  static List<DecorationModel> getModels(DecorationType type) {
    return allModels.where((element) => element.type == type).toList();
  }

  static List<DecorationModel> getTypeModels(DecorationStatusType type) {
    return allModels.where((element) => element.statusType == type).toList();
  }

  static List<DecorationModel> get allPropertyModels {
    return allModels
        .where((element) => element.type != DecorationType.WAIT_HAND_OUT)
        .toList();
  }
}
