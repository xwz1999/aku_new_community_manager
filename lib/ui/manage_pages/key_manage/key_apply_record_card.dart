// Flutter imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/json_models/manager/key_manage/key_manage_record_list_model.dart';
// Project imports:
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/aku_divider.dart';
import 'package:aku_community_manager/tools/extensions/list_extension_tool.dart';
import 'package:aku_community_manager/ui/manage_pages/key_manage/key_manage_map.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class KeyApplyRecordCard extends StatefulWidget {
  final int index;
  final KeyManageRecordListModel model;
  final VoidCallback? callRefresh;
  KeyApplyRecordCard(
      {Key? key, required this.index, required this.model, this.callRefresh})
      : super(key: key);

  @override
  _KeyApplyRecordCardState createState() => _KeyApplyRecordCardState();
}

class _KeyApplyRecordCardState extends State<KeyApplyRecordCard> {
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
              (widget.model.facilityName ?? '')
                  .text
                  .size(32.sp)
                  .color(kTextPrimaryColor)
                  .bold
                  .make(),
              Spacer(),
              KeyManageMap.keyRecordStatus[widget.model.status]!.text
                  .size(28.sp)
                  .bold
                  .color(
                      KeyManageMap.keyRecordStatusColor[widget.model.status]!)
                  .make()
            ],
          ),
          16.w.heightBox,
          AkuDivider.horizontal(),
          24.w.heightBox,
          ...<Widget>[
            _rowTile(
                R.ASSETS_MANAGE_LOCK_PNG,
                '对应设备位置',
                (widget.model.correspondingPosition ?? '')
                    .text
                    .size(24.sp)
                    .color(kTextSubColor)
                    .make()),
            _rowTile(
                R.ASSETS_OUTDOOR_IC_ADDRESS_PNG,
                '存放地址',
                (widget.model.storageLocation ?? '')
                    .text
                    .size(24.sp)
                    .color(kTextSubColor)
                    .make()),
            _rowTile(
                R.ASSETS_MANAGE_IC_TIME_PNG,
                '审核时间',
                widget.model.auditDateString.text
                    .size(24.sp)
                    .color(kTextSubColor)
                    .make()),
          ].sepWidget(separate: 12.w.heightBox),
          _getBottomButtons(2),
        ],
      ),
    );
  }

  Widget _getBottomButtons(int status) {
    MaterialButton? button;
    switch (status) {
      case 1:
        // button = _bottomButton('申请钥匙', () {}, Color(0xFFFFC40C), Colors.black);
        break;
      case 2:
        break;
      case 3:
        button = _bottomButton('重新申请', () async {
          BaseModel baseModel = await NetUtil()
              .post(API.manage.applyKey, params: {"keyId": widget.model.id});
          BotToast.showText(text: baseModel.message ?? '网络错误');
          widget.callRefresh!();
        }, Colors.white, Colors.black) as MaterialButton?;
        break;
      case 4:
        break;

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
      String title, Function onPressed, Color color, Color textColor) {
    return MaterialButton(
      height: 52.w,
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 24.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(74.w)),
      color: color,
      onPressed: onPressed as void Function()?,
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
