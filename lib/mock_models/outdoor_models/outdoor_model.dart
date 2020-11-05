import 'package:flutter/material.dart';
import 'package:aku_community_manager/const/resource.dart';

enum OUTDOORSTATUS {
  ///待出户
  NOT_OUT,

  ///已出户
  OUT_DONE,

  ///已驳回
  REJECTED,

  ///已作废
  CANCELLATION,
}

class ItemsOutdoorModel {
  ///出户状态
  OUTDOORSTATUS status;

///卡片上方时间，即开始时间
DateTime datetime;

  ///小区名字
  String communityname;

  ///想起地址
  String adress;

  ///出户人
  String name;

  ///身份
  String identify;

  ///物品
  ItemDetails items;

  ///出户时间
  String outtime;
  ItemsOutdoorModel(
      {@required this.status,
      @required this.datetime,
      @required this.communityname,
      @required this.adress,
      @required this.name,
      @required this.identify,
      @required this.items,
      @required this.outtime});

  static List<ItemsOutdoorModel> initList() {
    return [
      ItemsOutdoorModel(
        status: OUTDOORSTATUS.NOT_OUT,
        datetime: DateTime(2020,10,23,09,28,56),
        communityname: '深圳华悦茂峰',
        adress: '1幢1单元702室',
        name: '马云',
        identify: '业主',
        items: ItemDetails(
          itemname: '家具',
          weight: 40,
          way: '搬家公司',
          imagepath: [
            R.ASSETS_OUTDOOR_ITME1_PNG,
            R.ASSETS_OUTDOOR_ITEM2_PNG,
            R.ASSETS_OUTDOOR_ITEM3_PNG
          ],
        ),
        outtime: '2020-10-24 12:00',
      ),
      ItemsOutdoorModel(
        status: OUTDOORSTATUS.OUT_DONE,
        datetime: DateTime(2020,10,23,09,28,56),
        communityname: '深圳华悦茂峰',
        adress: '1幢1单元702室',
        name: '马云',
        identify: '业主',
        items: ItemDetails(
          itemname: '家具',
          weight: 60,
          way: '搬家公司',
          imagepath: [
            R.ASSETS_OUTDOOR_ITME1_PNG,
            R.ASSETS_OUTDOOR_ITEM2_PNG,
            R.ASSETS_OUTDOOR_ITEM3_PNG
          ],
        ),
        outtime: '2020-10-24 12:00',
      ),
      ItemsOutdoorModel(
        status: OUTDOORSTATUS.REJECTED,
        datetime: DateTime(2020,10,23,09,28,56),
        communityname: '深圳华悦茂峰',
        adress: '1幢1单元702室',
        name: '马云',
        identify: '业主',
        items: ItemDetails(
          itemname: '家具',
          weight: 80,
          way: '搬家公司',
          imagepath: [
            R.ASSETS_OUTDOOR_ITME1_PNG,
            R.ASSETS_OUTDOOR_ITEM2_PNG,
            R.ASSETS_OUTDOOR_ITEM3_PNG
          ],
        ),
        outtime: '2020-10-24 12:00',
      ),
      ItemsOutdoorModel(
        status: OUTDOORSTATUS.CANCELLATION,
        datetime: DateTime(2020,10,23,09,28,56),
        communityname: '深圳华悦茂峰',
        adress: '1幢1单元702室',
        name: '马云',
        identify: '业主',
        items: ItemDetails(
          itemname: '家具',
          weight: 120,
          way: '搬家公司',
          imagepath: [
            R.ASSETS_OUTDOOR_ITME1_PNG,
            R.ASSETS_OUTDOOR_ITEM2_PNG,
            R.ASSETS_OUTDOOR_ITEM3_PNG
          ],
        ),
        outtime: '2020-10-24 12:00',
      ),
    ];
  }

  static Map<OUTDOORSTATUS, String> outdoorStatusMap = {
    OUTDOORSTATUS.NOT_OUT: '待出户',
    OUTDOORSTATUS.OUT_DONE: '已出户',
    OUTDOORSTATUS.REJECTED: '已驳回',
    OUTDOORSTATUS.CANCELLATION: '已作废',
  };
  static Map<String, OUTDOORSTATUS> outdoorStatusStringMap = {
    '待出户': OUTDOORSTATUS.NOT_OUT,
    '已出户': OUTDOORSTATUS.OUT_DONE,
    '已驳回': OUTDOORSTATUS.REJECTED,
    '已作废': OUTDOORSTATUS.CANCELLATION,
  };
}

class ItemDetails {
  String itemname;
  double weight;
  String way;
  List<String> imagepath;
  ItemDetails(
      {@required this.itemname,
      @required this.weight,
      this.way,
      this.imagepath});
}