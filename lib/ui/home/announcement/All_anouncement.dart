// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:aku_community_manager/ui/widgets/common/aku_button.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/models/announce/announcement_detail_model.dart';
import 'package:aku_community_manager/models/announce/announcement_list_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/home/announcement/anouncement_details.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';

class AllAnouncement extends StatefulWidget {
  AllAnouncement({Key key}) : super(key: key);

  @override
  AllAnouncementState createState() => AllAnouncementState();
}

class AllAnouncementState extends State<AllAnouncement> {
  EasyRefreshController _refreshController = EasyRefreshController();

  static Widget anounceCard(AnnouncementListModel model, {String body}) {
    return Column(
      children: [
        AkuButton(
          onPressed: () async {
            BaseModel baseModel = await NetUtil().get(
                API.message.announcementFindByld,
                params: {'announcementId': model.id});
            AnnouncementDetailModel detailModel =
                AnnouncementDetailModel.fromJson(baseModel.data);
            Get.to(
              AnouncementDetails(
                model: detailModel,
              ),
            );
          },
          child: Container(
            color: Color(0xFFFFFFFF),
            width: double.infinity,
            height: 152.w,
            padding: EdgeInsets.only(top: 24.w, left: 24.w, bottom: 24.w),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
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
                  child: Image.asset(
                    R.ASSETS_MANAGE_IC_ANNOUNCE_PNG,
                    width: 74.w,
                    height: 60.w,
                  ),
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
                            model.releaseTime,
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
    List<AnnouncementListModel> cards,
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
              (e) => Container(),
            )
            .toList()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '全部公告',
      body: BeeListView(
          path: API.message.announcementList,
          controller: _refreshController,
          convert: (models) {
            return models.tableList
                .map((e) => AnnouncementListModel.fromJson(e))
                .toList();
          },
          builder: (items) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return anounceCard(items[index]);
                },
                separatorBuilder: (_, __) {
                  return AkuBox.h(10);
                },
                itemCount: items.length);
          }),
    );
  }
}
