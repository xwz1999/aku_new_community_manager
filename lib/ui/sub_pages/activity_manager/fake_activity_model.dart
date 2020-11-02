import 'package:aku_community_manager/const/resource.dart';

class FakeActivityManagerModel {
  String title;
  String imgPath;
  String location;
  String hostName;

  String article;
  String people;

  DateTime dateStart;
  DateTime dateEnd;
  DateTime checkInDate;
  FakeActivityManagerModel({
    this.title,
    this.imgPath,
    this.location,
    this.hostName,
    this.article,
    this.people,
    this.dateStart,
    this.dateEnd,
    this.checkInDate,
  });
}

List<FakeActivityManagerModel> fakeAcitivityManagerModels = [
  FakeActivityManagerModel(
    title: '华茂悦峰社区第三届六一亲子活动',
    imgPath: R.ASSETS_STATIC_TEMP_F1_WEBP,
    location: '中央活动区',
    hostName: '深圳万科物业有限公司',
    article:
        '''为丰富文化体育生活，不断增进小区凝聚力和人与人之间的协作能力，市委政法委机关党办、机关工会联合举办“我参与、我健康、我快乐”系列主题活动。 
    鞋底擦地的沙沙声，拉绳时的呼号声，乘着悠悠暖风奏成一曲夏的交响乐。汗水落地迸溅的瞬间，队员们奋力拼搏的身姿，与融融暖阳，绘成一幅夏的长卷。
    ''',
    people: '不限',
    dateStart: DateTime(2020, 4, 12, 12, 0),
    dateEnd: DateTime(2020, 4, 15, 12, 0),
    checkInDate: DateTime(2020, 4, 13, 12, 0),
  ),
  FakeActivityManagerModel(
    title: '宁化社区第一届煎蛋比赛报名开始',
    imgPath: R.ASSETS_STATIC_TEMP_F5_WEBP,
    location: '中央活动区',
    hostName: '深圳万科物业有限公司',
    article:
        '''为丰富文化体育生活，不断增进小区凝聚力和人与人之间的协作能力，市委政法委机关党办、机关工会联合举办“我参与、我健康、我快乐”系列主题活动。 
    鞋底擦地的沙沙声，拉绳时的呼号声，乘着悠悠暖风奏成一曲夏的交响乐。汗水落地迸溅的瞬间，队员们奋力拼搏的身姿，与融融暖阳，绘成一幅夏的长卷。
    ''',
    people: '不限',
    dateStart: DateTime(2020, 4, 12, 12, 0),
    dateEnd: DateTime(2020, 4, 15, 12, 0),
    checkInDate: DateTime(2020, 4, 13, 12, 0),
  ),
];
