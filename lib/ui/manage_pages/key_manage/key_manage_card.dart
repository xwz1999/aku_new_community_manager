// Flutter imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/key_manage/key_manage_all_key_model.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

// Project imports:
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/aku_divider.dart';
import 'package:aku_community_manager/tools/extensions/list_extension_tool.dart';
import 'package:aku_community_manager/ui/manage_pages/key_manage/key_manage_map.dart';

class KeyManageCard extends StatefulWidget {
  final int index;
  final KeyMangeAllKeyModel model;
  final VoidCallback callRefresh;
  KeyManageCard({Key key, this.index, this.model, this.callRefresh})
      : super(key: key);

  @override
  _KeyManageCardState createState() => _KeyManageCardState();
}

class _KeyManageCardState extends State<KeyManageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              widget.model.facilityName.text
                  .size(32.sp)
                  .color(kTextPrimaryColor)
                  .bold
                  .make(),
              Spacer(),
              KeyManageMap.keyStatus[widget.model.status].text
                  .size(28.sp)
                  .bold
                  .color(KeyManageMap.keyStatusColor[widget.model.status])
                  .make()
            ],
          ),
          16.w.heightBox,
          AkuDivider.horizontal(),
          24.w.heightBox,
          ...<Widget>[
            _rowTile(
                R.ASSETS_MANAGE_KEY_PNG,
                '可申请钥匙/钥匙总数',
                '${widget.model.loanableNum}/${widget.model.totalNum}'
                    .text
                    .size(24.sp)
                    .color(kTextSubColor)
                    .make()),
            _rowTile(
                R.ASSETS_MANAGE_LOCK_PNG,
                '对应设备位置',
                widget.model.correspondingPosition.text
                    .size(24.sp)
                    .color(kTextSubColor)
                    .make()),
            _rowTile(
                R.ASSETS_OUTDOOR_IC_ADDRESS_PNG,
                '存放地址',
                widget.model.storageLocation.text
                    .size(24.sp)
                    .color(kTextSubColor)
                    .make())
          ].sepWidget(separate: 12.w.heightBox),
          _getBottomButtons(widget.model.status),
        ],
      ),
    );
  }

  Widget _getBottomButtons(int status) {
    MaterialButton button;
    switch (status) {
      case 1:
        button = _bottomButton('申请钥匙', () async {
          BaseModel baseModel = await NetUtil()
              .post(API.manage.applyKey, params: {"keyId": widget.model.id});
          BotToast.showText(text: baseModel.message);
          widget.callRefresh();
        }, Color(0xFFFFC40C), Colors.black);
        break;
      case 2:
        button = _bottomButton('归还钥匙', () async {
          BaseModel baseModel = await NetUtil()
              .post(API.manage.returnKey, params: {"keyId": widget.model.id});
          BotToast.showText(text: baseModel.message);
          widget.callRefresh();
        }, Color(0xFFFFC40C), Colors.black);
        break;
      case 3:
        button = _bottomButton('联系物业', () async {
          await launch('tel:057-87760023');
        }, Colors.white, Colors.black, hasBorder: true);
        break;
      // case 4:
      //   button = _bottomButton('归还钥匙', () {}, Colors.black, Colors.white);
      //   break;
      // case 5:
      //   button = _bottomButton('重新提交', () {}, Colors.white, Colors.black);
      //   break;
      // case 6:
      //   button = _bottomButton('联系物业', () {}, Colors.white, Colors.black);
      //   break;
      default:
    }
    return button == null
        ? SizedBox()
        : Padding(
            padding: EdgeInsets.only(top: 40.w),
            child: Row(
              children: [
                Spacer(),
                button,
              ],
            ),
          );
  }

  Widget _bottomButton(
      String title, Function onPressed, Color color, Color textColor,
      {bool hasBorder = false}) {
    return MaterialButton(
      height: 52.w,
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 24.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(74.w),
        side: !hasBorder ? BorderSide.none : BorderSide(color: Colors.black),
      ),
      color: color,
      onPressed: onPressed,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      child: title.text.size(26.sp).color(textColor).make(),
    );
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
