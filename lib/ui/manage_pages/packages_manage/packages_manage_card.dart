import 'dart:math';

import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/package_manage/package_manage_list_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/aku_divider.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/tools/extensions/list_extension_tool.dart';

class PackageManageCard extends StatefulWidget {
  final int index;
  final PackageManageListModel model;
  final VoidCallback callRefresh;
  PackageManageCard({Key key, this.index, this.model, this.callRefresh})
      : super(key: key);

  @override
  _PackageManageCardState createState() => _PackageManageCardState();
}

class _PackageManageCardState extends State<PackageManageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
      padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              '3号柜${Random().nextInt(10)}号箱'
                  .text
                  .size(32.sp)
                  .color(kTextPrimaryColor)
                  .bold
                  .make(),
              Spacer(),
              (widget.index == 0 ? '未领取' : '已领取')
                  .text
                  .size(28.sp)
                  .color(widget.index == 1 ? kTextSubColor : kTextPrimaryColor)
                  .make()
            ],
          ),
          16.w.heightBox,
          AkuDivider.horizontal(),
          24.w.heightBox,
          ...<Widget>[
            _rowTile(
              R.ASSETS_MANAGE_IC_RENWU_PNG,
              '包裹代收',
              widget.model.code.text.size(24.sp).color(kTextSubColor).make(),
            ),
            _rowTile(
              R.ASSETS_MANAGE_IC_RENWU_PNG,
              '收件人',
              widget.model.addresseeName.text
                  .size(24.sp)
                  .color(kTextSubColor)
                  .make(),
            ),
            _rowTile(
              R.ASSETS_MESSAGE_IC_PHONE_PNG,
              '联系方式',
              widget.model.addresseeTel.text
                  .size(24.sp)
                  .color(kTextSubColor)
                  .make(),
            ),
            _rowTile(
              R.ASSETS_MANAGE_IC_TIME_PNG,
              '送达时间',
              DateUtil.formatDate(widget.model.receiveDate,
                      format: 'yyyy-MM-dd HH:mm')
                  .text
                  .size(24.sp)
                  .color(kTextSubColor)
                  .make(),
            ),
          ].sepWidget(separate: 12.w.heightBox),
          widget.index == 1 ? SizedBox() : _bottomButtons()
        ],
      ),
    );
  }

  Widget _bottomButtons() {
    return Padding(
      padding: EdgeInsets.only(top: 40.w),
      child: Row(
        children: [
          Spacer(),
          MaterialButton(
            height: 52.w,
            padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 24.w),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(74.w)),
            color: Colors.black,
            onPressed: () async {
              await _remindPackage(widget.model.id);
              widget.callRefresh();
            },
            elevation: 0,
            focusElevation: 0,
            hoverElevation: 0,
            highlightElevation: 0,
            child: '提醒领取'.text.size(26.sp).color(Colors.white).make(),
          )
        ],
      ),
    );
  }

  Future _remindPackage(int packageCollectionId) async {
    BaseModel baseModel = await NetUtil().get(API.manage.packageManageRemind,
        params: {"packageCollectionId": packageCollectionId});
    if (!baseModel.status) {
      BotToast.showText(text: baseModel.message);
    }
  }

  Widget _rowTile(String iconPath, String title, Widget content) {
    return Row(
      children: [
        SizedBox(
          width: 40.w,
          height: 40.w,
          child: Image.asset(iconPath),
        ),
        12.w.widthBox,
        title.text.size(24.sp).color(kTextSubColor).make(),
        Spacer(),
        content,
      ],
    );
  }
}
