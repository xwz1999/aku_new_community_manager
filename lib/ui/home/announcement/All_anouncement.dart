import 'dart:ui';

import 'package:aku_community_manager/mock_models/anouncement/anouncement_model.dart';
import 'package:aku_community_manager/provider/anouncement_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/home/announcement/anouncement_details.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_ui/aku_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aku_community_manager/const/resource.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AllAnouncement extends StatefulWidget {
  AllAnouncement({Key key}) : super(key: key);

  @override
  AllAnouncementState createState() => AllAnouncementState();
}

class AllAnouncementState extends State<AllAnouncement> {
  static Widget anounceCard(
   AnouncementCardModel model
  ) {
    return Column(
      children: [
        AkuButton(
          onPressed: () {
            Get.to(AnouncementDetails(
              title: model.title,
              date: model.date,
              body: model.body==null?'':model.body,
            ));
          },
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
                  child: Image.asset(R.ASSETS_MANAGE_IC_ANNOUNCE_PNG),
                ),
                SizedBox(
                  width: 24.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.title,
                        style: AppStyle().primaryStyle,
                      ),
                      SizedBox(height: 12.w),
                      Row(
                        children: [
                          Text('智慧管家', style: AppStyle().minorStyle),
                          SizedBox(
                            width: 24.w,
                          ),
                          Text(
                            model.date,
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
        SizedBox(
          height: 16.w,
        ),
      ],
    );
  }

  Widget _anouncementList(
    String date,
    List<AnouncementCardModel> cards,
  ) {
    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 48.w + 33.w,
            child: Text(
              date,
              style: AppStyle().minorStyle,
            )),
        ...(cards
            .map(
              (e) => anounceCard(e),
            )
            .toList()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
  final  AnouncementProvider _anouncementProvider=Provider.of<AnouncementProvider>(context);
    return AkuScaffold(
      title: '全部公告',
      body: ListView(
        padding: EdgeInsets.only(left: 32.w, right: 32.w),
        children: [
          _anouncementList('2020-10-22', _anouncementProvider.anouncementCardModels.sublist(0,2)),
          _anouncementList('2020-10-20', _anouncementProvider.anouncementCardModels.sublist(2,2)),
        ],
      ),
    );
  }
}
