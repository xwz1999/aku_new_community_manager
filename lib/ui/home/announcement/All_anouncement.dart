import 'dart:ui';

import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_ui/aku_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aku_community_manager/const/resource.dart';

class AnouncementCard {
  String title;
  String date;
  AnouncementCard(
    this.title,
    this.date,
  );
}

class AllAnouncement extends StatefulWidget {
  AllAnouncement({Key key}) : super(key: key);

  @override
  _AllAnouncementState createState() => _AllAnouncementState();
}

class _AllAnouncementState extends State<AllAnouncement> {
  Widget _anounceCard(String title, String date,) {
    return Column(
      children: [
        AkuButton(
          onPressed: (){},
          // color: Color(0xFFFFFFFF),
          child: Container(
            color: Color(0xFFFFFFFF),
            width: double.infinity,
            height: 152.w,
            padding: EdgeInsets.only(top: 24.w, left: 24.w, bottom: 24.w),
            child: Row(
              children: [
                Container(
                  width: 104.w,
                  height: 104.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(52.w),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF7EB4FF),
                            Color(0xFF3F8FFE),
                          ])),
                  child: Image.asset(R.ASSETS_MESSAGE_IC_TONGZHI_PNG),
                ),
                SizedBox(
                  width: 24.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,style: AppStyle().primaryStyle,),
                      SizedBox(height: 12.w),
                      Row(
                        children: [
                          Text('智慧管家', style: AppStyle().minorStyle),
                          SizedBox(
                            width: 24.w,
                          ),
                          Text(
                            date,
                            style: AppStyle().minorStyle,
                          ),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.w,),
      ],
    );
  }

  Widget _anouncementList(String date, List<AnouncementCard> cards,) {
    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 24.w + 33.w,
            child: Text(
              date,
              style: AppStyle().minorStyle,
            )),
        ...(cards
            .map(
              (e) => _anounceCard(e.title, e.date),
            )
            .toList()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '全部公告',
      body: ListView(
        padding: EdgeInsets.only(top: 24.w, left: 32.w, right: 32.w),
        children: [
          _anouncementList('2020-10-22', [
            AnouncementCard('关于国庆放假的通知和安排', '2020-10-22 10:00',),
            AnouncementCard('关于绿化组人员调动通知', '2020-10-22 11:00',),
          ]),
          _anouncementList('2020-10-20', [])
        ],
      ),
    );
  }
}
