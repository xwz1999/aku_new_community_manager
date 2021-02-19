// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:aku_ui/aku_ui.dart';
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/mock_models/outdoor_models/outdoor_model.dart';
import 'package:aku_community_manager/mock_models/users/user_info_model.dart';
import 'package:aku_community_manager/provider/outdoor_provider.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/sub_pages/items_outdoor/items_outdoor_card.dart';
import 'package:aku_community_manager/ui/sub_pages/items_outdoor/outdoor_notpass_page.dart';
import 'package:aku_community_manager/ui/sub_pages/items_outdoor/outdoor_pass_page.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

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
    UserProvider _userprovider =
        Provider.of<UserProvider>(context, listen: false);
    USER_ROLE userRole = _userprovider.userInfoModel.role;
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
            padding: EdgeInsets.only(
                top: 24.w, left: 32.w, right: 32.w, bottom: 40.w),
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
      bottom: _bottomCard(userRole),
    );
  }

  Widget _bottomCard(USER_ROLE userRole) {
    switch (widget.cardMedel.status) {
      case OUTDOORSTATUS.NOT_OUT:
        return userRole == USER_ROLE.SECURITY
            ? Container(
                height: 98.w,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFF9F9F9),
                      offset: Offset(0, -10.w),
                      blurRadius: 10.w,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                margin: EdgeInsets.only(top: 22.w),
                padding: EdgeInsets.only(
                    top: 13.w, bottom: 13.w, left: 32.w, right: 32.w),
                child: Row(
                  children: [
                    AkuButton(
                      onPressed: () {
                        Get.to(OutdoorNotpassPage(
                          model: widget.cardMedel,
                        ));
                      },
                      child: Container(
                        width: 304.w,
                        height: 72.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFFFFC40C), width: 2.w),
                          borderRadius: BorderRadius.circular(4.w),
                        ),
                        child: Text(
                          '不放行',
                          style: AppStyle().primaryStyle,
                        ),
                      ),
                    ),
                    Spacer(),
                    AkuMaterialButton(
                      onPressed: () {
                        Get.to(OutdoorPassPage(
                          model: widget.cardMedel,
                        ));
                      },
                      radius: 4.w,
                      color: Color(0xFFFFC40C),
                      child: Text(
                        '放行',
                        style: AppStyle().primaryStyle,
                      ),
                      minWidth: 304.w,
                      height: 72.w,
                    ),
                  ],
                ),
              )
            : SizedBox();
        break;
      case OUTDOORSTATUS.OUT_DONE:
        return Container(
          height: 226.w,
          color: Color(0xFFFFFFFF),
          margin: EdgeInsets.only(top: 16.w),
          padding:
              EdgeInsets.only(top: 24.w, left: 32.w, right: 32.w, bottom: 40.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('放行信息', style: AppStyle().barTitleStyle),
              Spacer(),
              Row(
                children: [
                  Image.asset(
                    R.ASSETS_OUTDOOR_IC_TIME_PNG,
                    width: 40.w,
                    height: 40.w,
                  ),
                  AkuBox.w(4),
                  Text(
                    '出门时间',
                    style: AppStyle().secondaryTextStyle,
                  ),
                  Spacer(),
                  Text(
                    widget.cardMedel.finalOutTime,
                    style: AppStyle().primaryStyle,
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Image.asset(
                    R.ASSETS_OUTDOOR_IC_CHUHU_PNG,
                    width: 40.w,
                    height: 40.w,
                  ),
                  AkuBox.w(4),
                  Text(
                    '物品出门',
                    style: AppStyle().secondaryTextStyle,
                  ),
                  Spacer(),
                  Text(
                    widget.cardMedel.outPlace,
                    style: AppStyle().primaryStyle,
                  ),
                ],
              ),
            ],
          ),
        );
        break;
      case OUTDOORSTATUS.REJECTED:
        return Container(
          height: 226.w,
          color: Color(0xFFFFFFFF),
          margin: EdgeInsets.only(top: 16.w),
          padding:
              EdgeInsets.only(top: 24.w, left: 32.w, right: 32.w, bottom: 40.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('放行信息', style: AppStyle().barTitleStyle),
              Spacer(),
              Row(
                children: [
                  Image.asset(
                    R.ASSETS_OUTDOOR_IC_TIME_PNG,
                    width: 40.w,
                    height: 40.w,
                  ),
                  AkuBox.w(4),
                  Text(
                    '驳回时间',
                    style: AppStyle().secondaryTextStyle,
                  ),
                  Spacer(),
                  Text(
                    widget.cardMedel.finalOutTime,
                    style: AppStyle().primaryStyle,
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Image.asset(
                    R.ASSETS_OUTDOOR_IC_CHUHU_PNG,
                    width: 40.w,
                    height: 40.w,
                  ),
                  AkuBox.w(4),
                  Text(
                    '驳回理由',
                    style: AppStyle().secondaryTextStyle,
                  ),
                  Spacer(),
                  Text(widget.cardMedel.rejectReason,
                      style: TextStyle(
                          color: Color(0xFFFF4501),
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        );
        break;
      default:
        return SizedBox();
    }
  }
}
