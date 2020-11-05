import 'package:aku_community_manager/mock_models/outdoor_models/outdoor_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/sub_pages/items_outdoor/items_outdoor_card.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aku_community_manager/const/resource.dart';

class ItemsOutdoorDetailsPage extends StatefulWidget {
  final ItemsOutdoorModel cardMedel;
  ItemsOutdoorDetailsPage({Key key, @required this.cardMedel})
      : super(key: key);

  @override
  _ItemsOutdoorDetailsPageState createState() =>
      _ItemsOutdoorDetailsPageState();
}

class _ItemsOutdoorDetailsPageState extends State<ItemsOutdoorDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '出户详情',
      body: ListView(
        children: [
          ItemsOutdoorCard(
            cardModel: widget.cardMedel,
            isdetail: true,
          ),
          Container(
            color: Color(0xFFFFFFFF),
            margin: EdgeInsets.only(top: 16.w),
            padding: EdgeInsets.only(top: 24.w, left: 32.w, right: 32.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '物品信息',
                  style: AppStyle().barTitleStyle,
                ),
                AkuBox.h(16),
                Row(
                  children: [
                    Image.asset(
                      R.ASSETS_OUTDOOR_IC_CHUHU_PNG,
                      width: 40.w,
                      height: 40.w,
                    ),
                    AkuBox.w(4),
                    Text(
                      '出户物品',
                      style: AppStyle().secondaryTextStyle,
                    ),
                    Spacer(),
                    Text(
                      widget.cardMedel.items.itemname,
                      style: AppStyle().primaryStyle,
                    ),
                  ],
                ),
                AkuBox.h(16),
                Row(
                  children: [
                    Image.asset(
                      R.ASSETS_OUTDOOR_IC_WEIGHT_PNG,
                      width: 40.w,
                      height: 40.w,
                    ),
                    AkuBox.w(4),
                    Text(
                      '物品重量',
                      style: AppStyle().secondaryTextStyle,
                    ),
                    Spacer(),
                    Text(
                      widget.cardMedel.items.weight < 50.0
                          ? '<50kg'
                          : '${widget.cardMedel.items.weight}kg',
                      style: AppStyle().primaryStyle,
                    ),
                  ],
                ),
                AkuBox.h(16),
                Row(
                  children: [
                    Image.asset(
                      R.ASSETS_OUTDOOR_IC_TRANSPORT_PNG,
                      width: 40.w,
                      height: 40.w,
                    ),
                    AkuBox.w(4),
                    Text(
                      '搬运方式',
                      style: AppStyle().secondaryTextStyle,
                    ),
                    Spacer(),
                    Text(
                      widget.cardMedel.items.way,
                      style: AppStyle().primaryStyle,
                    )
                  ],
                ),
                AkuBox.h(16),
                Row(
                  children: [
                    Image.asset(
                      R.ASSETS_OUTDOOR_IC_IMAGE_PNG,
                      width: 40.w,
                      height: 40.w,
                    ),
                    AkuBox.w(4),
                    Text(
                      '图片信息',
                      style: AppStyle().secondaryTextStyle,
                    ),
                    Spacer(),
                  ],
                ),
                AkuBox.h(16),
                Wrap(
                  spacing: 16.w,
                  children: widget.cardMedel.items.imagepath
                      .map(
                        (e) => ClipRRect(
                            borderRadius: BorderRadius.circular(4.w),
                            child: Image.asset(
                              e,
                              width: 218.w,
                              height: 218.w,
                            )),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
