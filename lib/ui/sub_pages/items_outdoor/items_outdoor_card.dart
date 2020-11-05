import 'package:aku_community_manager/mock_models/outdoor_models/outdoor_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/sub_pages/items_outdoor/items_outdoor_details_page.dart';
import 'package:aku_ui/common_widgets/aku_common_widgets.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aku_community_manager/const/resource.dart';
import 'package:get/get.dart';

class ItemsOutdoorCard extends StatefulWidget {
  final ItemsOutdoorModel cardModel;
  final bool isdetail;
  ItemsOutdoorCard({
    Key key,
    @required this.cardModel,
    this.isdetail = false,
  }) : super(key: key);

  @override
  _ItemsOutdoorCardState createState() => _ItemsOutdoorCardState();
}

class _ItemsOutdoorCardState extends State<ItemsOutdoorCard> {
  ItemsOutdoorModel _cardModel;
  String _datetime;

  @override
  void initState() {
    super.initState();
    _cardModel = widget.cardModel;
    _datetime =
        DateUtil.formatDate(_cardModel.datetime, format: "yyyy/MM/dd HH:mm:ss");
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle =
        TextStyle(color: AppStyle.minorTextColor, fontSize: 28.sp);
    return Container(
      color: Color(0xFFFFFFFF),
      margin: EdgeInsets.only(top: 16.w),
      padding: EdgeInsets.only(left: 24.w, right: 24.w),
      child: Column(children: [
        widget.isdetail
            ? Container(
                alignment: Alignment.centerLeft,
                height: 90.w,
                width: double.infinity,
                child: Row(
                  children: [
                    Text(
                      '出户信息',
                      style: TextStyle(
                          color: AppStyle.primaryTextColor,
                          fontSize: 36.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      ItemsOutdoorModel.outdoorStatusMap[_cardModel.status],
                      style: TextStyle(
                          color: _cardModel.status == OUTDOORSTATUS.CANCELLATION
                              ? Color(0xFF999999)
                              : Color(0xFFFF4501),
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            : Container(
                alignment: Alignment.centerLeft,
                height: 88.w,
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 112.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xFF3F8FFE), width: 2.w),
                      ),
                      child: Text(
                        '物品出户',
                        style: TextStyle(
                            color: Color(0xFF3F8FFE),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    AkuBox.w(16),
                    Text(
                      _datetime,
                      style: TextStyle(
                        color: AppStyle.minorTextColor,
                        fontSize: 22.sp,
                      ),
                    ),
                    Spacer(),
                    Text(
                      ItemsOutdoorModel.outdoorStatusMap[_cardModel.status],
                      style: TextStyle(
                          color: _cardModel.status == OUTDOORSTATUS.CANCELLATION
                              ? Color(0xFF999999)
                              : Color(0xFFFF4501),
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
        Row(
          children: [
            Image.asset(
              R.ASSETS_OUTDOOR_IC_HOME_PNG,
              width: 40.w,
              height: 40.w,
            ),
            AkuBox.w(4),
            Text(
              '小区名称',
              style: _textStyle,
            ),
            Spacer(),
            Text(
              _cardModel.communityname,
              style: AppStyle().primaryStyle,
            ),
          ],
        ),
        AkuBox.h(12),
        Row(
          children: [
            Image.asset(
              R.ASSETS_OUTDOOR_IC_ADDRESS_PNG,
              width: 40.w,
              height: 40.w,
            ),
            AkuBox.w(4),
            Text('详细地址', style: _textStyle),
            Spacer(),
            Text(
              _cardModel.adress,
              style: AppStyle().primaryStyle,
            ),
          ],
        ),
        AkuBox.h(12),
        Row(
          children: [
            Image.asset(
              R.ASSETS_OUTDOOR_IC_GOOUT_PNG,
              width: 40.w,
              height: 40.w,
            ),
            AkuBox.w(4),
            Text(
              '出户人',
              style: _textStyle,
            ),
            Spacer(),
            Text(
              _cardModel.name,
              style: AppStyle().primaryStyle,
            ),
          ],
        ),
        AkuBox.h(12),
        Row(
          children: [
            Image.asset(
              R.ASSETS_OUTDOOR_IC_PEOPLE_PNG,
              width: 40.w,
              height: 40.w,
            ),
            AkuBox.w(4),
            Text(
              '身份',
              style: _textStyle,
            ),
            Spacer(),
            Text(
              _cardModel.identify,
              style: AppStyle().primaryStyle,
            ),
          ],
        ),
        AkuBox.h(12),
        Row(
          children: [
            Image.asset(R.ASSETS_OUTDOOR_IC_CHUHU_PNG,width: 40.w,height: 40.w,),
            Text(
              '出户物品',
              style: _textStyle,
            ),
            Spacer(),
            Text(
              _cardModel.items.itemname,
              style: AppStyle().primaryStyle,
            ),
          ],
        ),
        AkuBox.h(12),
        Row(
          children: [
            Image.asset(
              R.ASSETS_OUTDOOR_IC_TIME_PNG,
              width: 40.w,
              height: 40.w,
            ),
            AkuBox.w(4),
            Text(
              '出户时间',
              style: _textStyle,
            ),
            Spacer(),
            Text(
              _cardModel.outtime,
              style: AppStyle().primaryStyle,
            ),
          ],
        ),
        AkuBox.h(24),
        Divider(
          height: 1.w,
        ),
        widget.isdetail
            ? AkuButton(
                onPressed: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 96.w,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        R.ASSETS_OUTDOOR_IC_PHONEBLUE_PNG,
                        width: 38.w,
                        height: 39.w,
                      ),
                      AkuBox.w(16),
                      Text('联系业主',
                          style: TextStyle(
                              color: Color(0xFF3F8FFE),
                              fontSize: 28.sp,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              )
            : Container(
                height: 112.w,
                alignment: Alignment.centerRight,
                child: AkuButton(
                  onPressed: () {
                    Get.to(ItemsOutdoorDetailsPage(
                      cardMedel: _cardModel,
                    ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 160.w,
                    height: 64.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                          AppStyle.primaryColor,
                          AppStyle.minorColor
                        ])),
                    child: Text(
                      '查看详情',
                      style: AppStyle().primaryStyle,
                    ),
                  ),
                ),
              ),
      ]),
    );
  }
}
