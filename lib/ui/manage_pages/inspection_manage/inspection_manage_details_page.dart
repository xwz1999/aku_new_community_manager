// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/mock_models/manage_models/manage_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/manage_pages/inspection_manage/inspection_manage_card.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

class InspectionManageDetailsPage extends StatelessWidget {
  final InspectionManageCardModel cardModel;
  InspectionManageDetailsPage({Key key, this.cardModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '巡检详情',
      body: Column(
        children: [
          InspectionManageCard(cardModel, extra: false).inspectionManageCard(),
          Container(
            width: double.infinity,
            color: Color(0xFFFFFFFF),
            margin: EdgeInsets.only(top: 16.w),
            padding: EdgeInsets.only(
                top: 24.w, left: 32.w, right: 86.w, bottom: 40.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '巡检人员',
                  style: TextStyle(
                      color: AppStyle.primaryTextColor,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold),
                ),
                AkuBox.h(16),
                GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 250 / 40,
                      mainAxisSpacing: 16.w),
                  children: cardModel.persons
                      .map((e) => _person(cardModel.persons.indexOf(e)))
                      .toList(),
                ),
              ],
            ),
          ),
          AkuBox.h(16),
          Container(
            color: Color(0xFFFFFFFF),
            padding: EdgeInsets.only(top: 24.w, left: 32.w, right: 32.w),
            width: double.infinity,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('巡检站点',
                  style: TextStyle(
                      color: AppStyle.primaryTextColor,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold)),
              AkuBox.h(16),
              Wrap(
                runSpacing: 16.w,
                children: cardModel.stations
                    .map((e) => _station(cardModel.stations.indexOf(e)))
                    .toList(),
              ),
              AkuBox.h(24),
              Image.asset(
                R.ASSETS_INSPECTION_INSPECTION_STATION_PNG,
                width: 686.w,
                height: 343.w,
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _station(index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding:
              EdgeInsets.only(top: 16.w, left: 24.w, bottom: 15.w, right: 24.w),
          color: Color(0xFFF9F9F9),
          height: 64.w,
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                cardModel.stations[index],
                style: TextStyle(
                    color: AppStyle.primaryTextColor, fontSize: 24.sp),
              ),
            ],
          ),
        ),
        AkuBox.w(8),
        (cardModel.stations.length - 1) != index
            ? Container(
                width: 56.w,
                height: 3.w,
                color: Color(0xFFE8E8E8),
              )
            : SizedBox(),
      ],
    );
  }

  Widget _person(index) {
    return Container(
      height: 40.w,
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          R.ASSETS_MESSAGE_IC_PEOPLE_PNG,
          width: 40.w,
          height: 40.w,
        ),
        AkuBox.w(8),
        Text(
          cardModel.persons[index],
          style: TextStyle(
            color: AppStyle.primaryTextColor,
            fontSize: 28.sp,
          ),
        ),
      ]),
    );
  }
}
