
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:aku_community_manager/style/app_style.dart';

import 'AlarmModel.dart';

class FireDialog {
  static  Future fireAlert(String subTitle) async {
    var json = jsonDecode(subTitle);
    AlarmModel alarmModel = AlarmModel.fromJson(json);



    await Get.dialog(
      CupertinoAlertDialog(
        title:  getImage(alarmModel),
        content: Column(
          children: [

            Text(getTitle(alarmModel)),
            10.w.heightBox,
            Text(getContent(alarmModel)),

          ],
        ),
        actions: [
          CupertinoDialogAction(
            child: Text('确认'),
            onPressed: () => Get.back(),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }


 static String getTitle(AlarmModel alarmModel){
    switch(alarmModel.type){
      case 1:
        return '发现火灾！请立刻组织疏散人群！';
      case 2:
        return '设备故障';
      case 3:
        return '管家端APP报警';
      default:
        return '';

    }
  }

  static String getContent(AlarmModel alarmModel){
    switch(alarmModel.type){
      case 1:
        return '于${alarmModel.time},${alarmModel.deviceName}附近出现了火灾报警，请各位业主、租户保持镇静，不要慌乱，有序开始撤离！';
      case 2:
        return '于${alarmModel.time},小区内有设备${alarmModel.deviceName}发生了报警，请物业负责人员尽快前往现场排查故障！';
      case 3:
        return '注意：\n于${alarmModel.time},${alarmModel.deviceNo}${alarmModel.deviceName}'+
            '在管家端app上点击了"一键报警",请尽快联系他沟通情况。\n'+
                '${alarmModel.deviceName}联系方式：${alarmModel.alarmNo}\n'+
                    '如未能联系到${alarmModel.deviceName}。可择情报警'
            ;
      default:
        return '';

    }
  }

  static Widget getImage(AlarmModel alarmModel){
    switch(alarmModel.type){
      case 1:
        return Image.asset(R.ASSETS_HOME_FIRE_ALARM_PNG,width: 110.w,height: 110.w,fit: BoxFit.fill,);
      case 2:
        return Image.asset(R.ASSETS_HOME_DEVICE_ALARM_PNG,width: 110.w,height: 110.w,fit: BoxFit.fill,);
      case 3:
        return Image.asset(R.ASSETS_HOME_APP_ALARM_PNG,width: 110.w,height: 110.w,fit: BoxFit.fill,);
      default:
        return SizedBox();

    }
  }

}