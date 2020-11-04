import 'package:flutter/material.dart';

class GreenManageCardModel {
  String title;
  String task;
  String timestart;
  String timeend;
  String name;
  String body;
  GreenManageCardModel(
      this.title, this.task, this.timestart, this.timeend, this.name,
      this.body);

  static List<GreenManageCardModel> initList() {
    return [
      GreenManageCardModel(
          '中部广场周围绿化调整', '除杂草、松土、培土', '2020-10-08', '2020-10-18', '陈晖洁',
           '''详细描述
1.在小区的园林建设中首先要保证小区园林设计的美观
性以及与小区其他建筑的协调性，不仅能够吸引小区居
民的目光，丰富人们的精神生活，也要使小区园林设计
起到减少噪音污染，为人们遮风避凉。
2.营造小区美丽园林中要选择合适的树木品种绿化小区
内不同地方的环境在小区的园路树选择中不能种植矮小
的树这样不会起到遮阴的作用还有在小区水池周围不能
选择落叶较多的树这样不利于清理另外，还有小区其他
的绿化地方，要根据实际情况，合理科学的选择。'''),
      GreenManageCardModel(
          '东区周围绿化调整', '修剪、造型', '2020-10-08', '2020-10-18', '刘小青',''),
      GreenManageCardModel(
          '西区周围绿化调整', '修剪、造型', '2020-10-10', '2020-10-20', '张空间',''),
      GreenManageCardModel(
          '北区周围绿化调整', '修剪造型', '2020-10-15', '2020-10-25', '凯尔希',''),
    ];
  }
}
