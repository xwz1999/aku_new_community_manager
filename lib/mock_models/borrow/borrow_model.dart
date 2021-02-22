// Dart imports:
import 'dart:math';

// Package imports:
import 'package:meta/meta.dart';

enum BORROW_STATUS {
  ///出借中
  BORROWING,

  ///待检查
  WAIT_CHECK,

  ///未出借
  NOT_BORROW,

  ///已归还
  DONE,
}

enum GOODS_STATUS {
  NORMAL,
  BROKEN,
  LOST,
}

//TODO CLEAN BOTTOM CODES.
@Deprecated(" borrow_model need to be cleaned.")
class BorrowModel {
  String borrowPerson;
  String phone;
  int borrowTime;
  GOODS_STATUS goodsStatus;
  String title;
  SingleBorrowGoods borrowGoods;
  DateTime date;

  BorrowModel({
    @required this.borrowPerson,
    @required this.phone,
    @required this.borrowTime,
    @required this.goodsStatus,
    @required this.borrowGoods,
    @required this.title,
    @required this.date,
  });
}

class BorrowObject {
  String name;
  int allNumber;
  dynamic assetPath;
  int borrowNumber;
  int get restNumber => allNumber - borrowNumber;
  List<SingleBorrowGoods> items;

  BorrowObject.init({
    this.name,
    this.allNumber,
    this.assetPath,
  }) {
    this.borrowNumber = 0;
    items = List.generate(
      this.allNumber,
      (index) => SingleBorrowGoods(
        name: '${this.name}${index + 1}',
        code: (179264234 + Random().nextInt(999999)).toString(),
        status: BORROW_STATUS.NOT_BORROW,
        assetpath: this.assetPath,
      ),
    );
  }
}

class SingleBorrowGoods {
  String name;
  String code;
  dynamic assetpath;
  BORROW_STATUS status;
  String get borrowValue => {
        BORROW_STATUS.BORROWING: '出借中',
        BORROW_STATUS.DONE: '已归还',
        BORROW_STATUS.NOT_BORROW: '未出借',
        BORROW_STATUS.WAIT_CHECK: '待检查',
      }[status];
  SingleBorrowGoods({
    this.name,
    this.code,
    this.assetpath,
    this.status,
  });
}
