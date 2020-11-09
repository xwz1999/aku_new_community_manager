import 'package:aku_community_manager/mock_models/manage_models/manage_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/manage_pages/inspection_manage/inspection_manage_details_page.dart';
import 'package:aku_ui/common_widgets/aku_common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:aku_community_manager/const/resource.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

class InspectionManageCard {
  final InspectionManageCardModel cardModel;
  final bool extra;
  InspectionManageCard(this.cardModel, {this.extra = true});

  Widget inspectionManageCard() {
    TextStyle _textstyle =
        TextStyle(color: AppStyle.minorTextColor, fontSize: 28.sp);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AkuBox.h(16),
        AkuButton(
          onPressed: extra? () {
            Get.to(InspectionManageDetailsPage(cardModel: cardModel,));
          }:(){},
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: extra? 48.w:40.w),
            width: double.infinity,
            height:extra? 362.w:270.w,
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(8.w),color: Color(0xFFFFFFFF)),
            child: Column(children: [
              Container(
                  height:extra? 93.w :86.w,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    cardModel.title,
                    style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontSize: extra? 32.sp:36.sp,
                        fontWeight: FontWeight.bold),
                  )),
              extra
                  ? Divider(
                      height: 1.w,
                    )
                  : SizedBox(),
              extra? AkuBox.h(24):SizedBox(),
              Row(
                children: [
                  Image.asset(
                    R.ASSETS_MANAGE_IC_RENWU_PNG,
                    width: 40.w,
                    height: 40.w,
                  ),
                  AkuBox.w(4),
                  Text(
                    '巡检日期',
                    style: _textstyle,
                  ),
                  Spacer(),
                  Text(
                    cardModel.date,
                    style: AppStyle().primaryStyle,
                  )
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Image.asset(
                    R.ASSETS_INSPECTION_IC_XUNJIAN_PNG,
                    width: 40.w,
                    height: 40.w,
                  ),
                  AkuBox.w(4),
                  Text('巡检周期', style: _textstyle),
                  Spacer(),
                  Text(
                    cardModel.cycle,
                    style: AppStyle().primaryStyle,
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Image.asset(
                    R.ASSETS_MANAGE_IC_TIME_PNG,
                    width: 40.w,
                    height: 40.w,
                  ),
                  AkuBox.w(4),
                  Text(
                    '巡检时间',
                    style: _textstyle,
                  ),
                  Spacer(),
                  Text(
                    cardModel.time,
                    style: AppStyle().primaryStyle,
                  ),
                ],
              ),
              extra ? Spacer() : SizedBox(),
              extra
                  ? Row(
                      children: [
                        Image.asset(
                          R.ASSETS_MESSAGE_IC_PEOPLE_PNG,
                          width: 40.w,
                          height: 40.w,
                        ),
                        AkuBox.w(4),
                        Text(
                          '巡检人员',
                          style: _textstyle,
                        ),
                        Spacer(),
                        Text(
                          cardModel.persons.length > 2
                              ? '${cardModel.persons[0]}、${cardModel.persons[1]}等'
                              : cardModel.persons[0],
                          style: AppStyle().primaryStyle,
                        ),
                      ],
                    )
                  : SizedBox(),
            ]),
          ),
        ),
      ],
    );
  }
}
