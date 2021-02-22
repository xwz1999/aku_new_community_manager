// Project imports:
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/mock_models/borrow/borrow_model.dart';

//TODO CLEAN BOTTOM CODES.
@Deprecated("borrow_data need to be cleaned.")
class BorrowData {
  static List<BorrowModel> get checkModels => models.where((e) {
        return e.borrowGoods.status == BORROW_STATUS.WAIT_CHECK;
      }).toList();
  static List<BorrowModel> get borrowModels => models.where((e) {
        return e.borrowGoods.status == BORROW_STATUS.BORROWING;
      }).toList();

  static List<BorrowModel> get doneModels => models.where((e) {
        return e.borrowGoods.status == BORROW_STATUS.DONE;
      }).toList();

  static List<BorrowModel> models = [
    BorrowModel(
      title: '归还梯子一个',
      borrowPerson: '李慧珍',
      borrowTime: 5,
      goodsStatus: GOODS_STATUS.BROKEN,
      phone: '19981712931',
      borrowGoods: SingleBorrowGoods(
        name: '梯子',
        assetpath: R.ASSETS_STATIC_TEMP_LADDER_PNG,
        code: '3193713894',
        status: BORROW_STATUS.WAIT_CHECK,
      ),
      date: DateTime(2020, 5, 5, 12, 35, 45),
    ),
    BorrowModel(
      title: '归还梯子一个',
      borrowPerson: '李慧珍',
      borrowTime: 5,
      goodsStatus: GOODS_STATUS.BROKEN,
      phone: '19981712931',
      borrowGoods: SingleBorrowGoods(
        name: '梯子',
        assetpath: R.ASSETS_STATIC_TEMP_LADDER_PNG,
        code: '3193713894',
        status: BORROW_STATUS.DONE,
      ),
      date: DateTime(2020, 5, 5, 12, 35, 45),
    ),
    BorrowModel(
      title: '借用电钻一把',
      borrowPerson: '刘虎门',
      borrowTime: 12,
      goodsStatus: GOODS_STATUS.NORMAL,
      phone: '19981738879',
      borrowGoods: SingleBorrowGoods(
        name: '电钻',
        assetpath: R.ASSETS_STATIC_TEMP_DRILL_PNG,
        code: '31937293841',
        status: BORROW_STATUS.BORROWING,
      ),
      date: DateTime(2020, 4, 5, 12, 35, 45),
    ),
    BorrowModel(
      borrowPerson: '刘海保',
      borrowTime: 5,
      title: '借用榔头一把',
      goodsStatus: GOODS_STATUS.NORMAL,
      phone: '19981738879',
      borrowGoods: SingleBorrowGoods(
        name: '榔头',
        assetpath: R.ASSETS_STATIC_TEMP_HAMMER_PNG,
        code: '3193794102481',
        status: BORROW_STATUS.BORROWING,
      ),
      date: DateTime(2020, 3, 5, 12, 35, 45),
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
