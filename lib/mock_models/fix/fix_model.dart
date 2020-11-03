import 'package:aku_community_manager/const/resource.dart';
import 'package:flutter/material.dart';

enum FIX_ENUM {
  ///待派单
  HAND_OUT,

  ///已派单&&待接单
  WAIT_PICKUP,

  ///处理中
  PROCESSING,

  ///已处理
  DONE,
}

class FixModel {
  static Map<FIX_ENUM, String> managerRoleMap = {
    FIX_ENUM.HAND_OUT: '待派单',
    FIX_ENUM.WAIT_PICKUP: '已派单',
    FIX_ENUM.PROCESSING: '处理中',
    FIX_ENUM.DONE: '已处理',
  };

  static Map<FIX_ENUM, String> otherRoleMap = {
    FIX_ENUM.HAND_OUT: '',
    FIX_ENUM.WAIT_PICKUP: '待接单',
    FIX_ENUM.PROCESSING: '处理中',
    FIX_ENUM.DONE: '已处理',
  };

  String title;
  DateTime dateStart;
  FIX_ENUM type;

  ///dynamic type
  ///
  ///当img 的类型为String时渲染asset图片，当img 类型为File 时渲染File图片
  List imgs;
  FixDetailModel detail;
  FixModel({
    @required this.title,
    @required this.dateStart,
    @required this.type,
    @required this.imgs,
    @required this.detail,
  });

  static List<FixModel> initList() {
    return [
      FixModel(
        title: '小区西大门车栏坏了，请物业尽快修理更换。',
        dateStart: DateTime(2020, 10, 21, 7, 28, 56),
        type: FIX_ENUM.WAIT_PICKUP,
        imgs: [R.ASSETS_STATIC_FIX_AIR1_PNG, R.ASSETS_STATIC_FIX_AIR2_PNG],
        detail: FixDetailModel(
          userName: '杨建',
          userPhoneNumber: '18882928888',
          fixArea: 'B区',
          type: FIX_PAYMENT_TYPE.FREE,
          limit: FIX_DATE_LIMIT.HOUR_24,
          subType: FIX_SUB_TYPE.NORMAL,
          fixStatuses: [
            FixStatus(title: '申请保修', date: DateTime(2020, 10, 23, 10, 28, 56)),
            FixStatus(
                title: '分派给李保国师傅', date: DateTime(2020, 10, 23, 10, 32, 14)),
            FixStatus(title: '师傅已接单', date: DateTime(2020, 10, 23, 10, 38, 26)),
          ],
          result: FixResult(
            detail: '电饭煲插头没插',
            material: '无',
            imgs: [R.ASSETS_STATIC_FIX_FOOD_PNG],
          ),
          review: UserReviewInfo(
            rate: 5,
            content: '师傅太用心了',
          ),
        ),
      ),
      FixModel(
        title: '家里空调坏了，请师傅抓紧时间尽快维修。',
        dateStart: DateTime(2020, 10, 21, 7, 28, 56),
        type: FIX_ENUM.PROCESSING,
        imgs: [R.ASSETS_STATIC_FIX_AIR1_PNG, R.ASSETS_STATIC_FIX_AIR2_PNG],
        detail: FixDetailModel(
          userName: '杨建',
          userPhoneNumber: '18882929292',
          fixArea: 'A区',
          type: FIX_PAYMENT_TYPE.FREE,
          limit: FIX_DATE_LIMIT.HOUR_24,
          subType: FIX_SUB_TYPE.NORMAL,
          fixStatuses: [
            FixStatus(title: '申请保修', date: DateTime(2020, 10, 23, 10, 28, 56)),
            FixStatus(
                title: '分派给李保国师傅', date: DateTime(2020, 10, 23, 10, 32, 14)),
            FixStatus(title: '师傅已接单', date: DateTime(2020, 10, 23, 10, 38, 26)),
          ],
          result: FixResult(
            detail: '电饭煲插头没插',
            material: '无',
            imgs: [R.ASSETS_STATIC_FIX_FOOD_PNG],
          ),
          review: UserReviewInfo(
            rate: 5,
            content: '师傅太用心了',
          ),
        ),
      ),
      FixModel(
        title: '家中电饭煲出问题了，请师傅速来。',
        dateStart: DateTime(2020, 10, 22, 9, 28, 56),
        type: FIX_ENUM.DONE,
        imgs: [R.ASSETS_STATIC_FIX_FOOD2_PNG, R.ASSETS_STATIC_FIX_FOOD_PNG],
        detail: FixDetailModel(
          userName: '杨建',
          userPhoneNumber: '18882929292',
          fixArea: 'A区',
          type: FIX_PAYMENT_TYPE.FREE,
          limit: FIX_DATE_LIMIT.HOUR_24,
          subType: FIX_SUB_TYPE.NORMAL,
          fixStatuses: [
            FixStatus(title: '申请保修', date: DateTime(2020, 10, 23, 10, 28, 56)),
            FixStatus(
                title: '分派给李保国师傅', date: DateTime(2020, 10, 23, 10, 32, 14)),
            FixStatus(title: '师傅已接单', date: DateTime(2020, 10, 23, 10, 38, 26)),
            FixStatus(title: '处理完成', date: DateTime(2020, 10, 23, 11, 01, 08)),
          ],
          result: FixResult(
            detail: '电饭煲插头没插',
            material: '无',
            imgs: [R.ASSETS_STATIC_FIX_FOOD_PNG],
          ),
          review: UserReviewInfo(
            rate: 5,
            content: '师傅太用心了',
          ),
        ),
      ),
    ];
  }
}

///派单类型
enum FIX_PAYMENT_TYPE {
  FREE,
  PAY,
}

///工单子类
enum FIX_SUB_TYPE {
  ///一般单
  NORMAL,

  ///加急单
  HURRY,
}

///工单时限
enum FIX_DATE_LIMIT {
  HOUR_24,
  HOUR_12,
  HOUR_8,
}

class FixDetailModel {
  ///报修人
  String userName;

  String userPhoneNumber;

  String fixArea;

  FIX_PAYMENT_TYPE type;

  FIX_DATE_LIMIT limit;

  FIX_SUB_TYPE subType;

  List<FixStatus> fixStatuses;

  FixResult result;

  UserReviewInfo review;
  FixDetailModel({
    this.userName,
    this.userPhoneNumber,
    this.fixArea,
    this.type,
    this.limit,
    this.subType,
    this.fixStatuses,
    this.result,
    this.review,
  });
}

class FixStatus {
  String title;
  DateTime date;
  FixStatus({
    this.title,
    this.date,
  });
}

class FixResult {
  String detail;
  String material;

  ///dynamic img
  List imgs;
  FixResult({
    this.detail,
    this.material,
    this.imgs,
  });
}

class UserReviewInfo {
  double rate;
  String content;
  UserReviewInfo({
    this.rate,
    this.content,
  });
}
