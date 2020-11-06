import 'package:flutter/material.dart';

class AnouncementCardModel {
  String title;
  String date;
  String body;
  AnouncementCardModel(this.title, this.date, {this.body});

  static List<AnouncementCardModel> initList() {
    return [
      AnouncementCardModel(
        '关于国庆放假的通知和安排',
        '2020-10-22 10:00',
        body: '''
各位同事：
深圳永成物业员工2016年国庆节放假通知如下10月1日至7日放假调休，共7天。10月8日（星期六）上班。调休期间，值班室至少三人，请各级主管自行安排。请将此消息转达给我们所有的同事、客户、供应商和任何有品要迅知的伙伴

祝全体员工度过一个欢乐样和的国庆节假日''',
      ),
      AnouncementCardModel(
        '关于国庆放假的通知和安排',
        '2020-10-22 10:00',
      ),
      AnouncementCardModel('关于中秋放假通知与工作安排', '2020-10-22 10:00'),
      AnouncementCardModel('疫情期间对大家的表扬和鼓励', '2020-10-22 11:00'),
    ];
  }
}
