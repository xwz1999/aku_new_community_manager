import 'dart:math';

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
}

class BorrowModel {
  String borrowPerson;
  String phone;
  int borrowTime;
  GOODS_STATUS goodsStatus;
  String title;
  SingleBorrowGoods borrowGoods;

  BorrowModel({
    @required this.borrowPerson,
    @required this.phone,
    @required this.borrowTime,
    @required this.goodsStatus,
    @required this.borrowGoods,
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
  SingleBorrowGoods({
    this.name,
    this.code,
    this.assetpath,
    this.status,
  });
}
