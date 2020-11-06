import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/mock_models/borrow/borrow_model.dart';

class BorrowData {
  static List<BorrowModel> models = [
    BorrowModel(
      borrowPerson: '李慧珍',
      borrowTime: null,
      goodsStatus: null,
      phone: null,
      borrowGoods: SingleBorrowGoods(name: ''),
    ),
  ];

  static List<BorrowObject> borrowObjects = [
    BorrowObject.init(
      name: '电钻',
      assetPath: R.ASSETS_STATIC_TEMP_DRILL_PNG,
      allNumber: 5,
    ),
    BorrowObject.init(
      name: '梯子',
      assetPath: R.ASSETS_STATIC_TEMP_LADDER_PNG,
      allNumber: 3,
    ),
    BorrowObject.init(
      name: '三角榔头',
      assetPath: R.ASSETS_STATIC_TEMP_HAMMER_PNG,
      allNumber: 8,
    ),
  ];
}
