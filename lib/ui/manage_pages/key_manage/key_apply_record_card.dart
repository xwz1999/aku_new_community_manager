// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

// Project imports:
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/aku_divider.dart';
import 'package:aku_community_manager/tools/extensions/list_extension_tool.dart';
import 'package:aku_community_manager/ui/manage_pages/key_manage/key_manage_map.dart';

class KeyApplyRecordCard extends StatefulWidget {
  final int index;
  KeyApplyRecordCard({Key key, this.index}) : super(key: key);

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
              '3-1-203配电箱'
                  .text
                  .size(32.sp)
                  .color(kTextPrimaryColor)
                  .bold
                  .make(),
              Spacer(),
              KeyManageMap.keyStatus[2].text
                  .size(28.sp)
                  .bold
                  .color(KeyManageMap.keyStatusColor[2])
                  .make()
            ],
          ),
          16.w.heightBox,
          AkuDivider.horizontal(),
          24.w.heightBox,
          ...<Widget>[
            _rowTile(R.ASSETS_MANAGE_KEY_PNG, '可申请钥匙数/钥匙总数',
                '2/5'.text.size(24.sp).color(kTextSubColor).make()),
            _rowTile(R.ASSETS_MANAGE_LOCK_PNG, '对应设备位置',
                '2栋1楼2-3'.text.size(24.sp).color(kTextSubColor).make()),
            _rowTile(R.ASSETS_OUTDOOR_IC_ADDRESS_PNG, '存放地址',
                '物业管理处2号柜'.text.size(24.sp).color(kTextSubColor).make()),
          ].sepWidget(separate: 12.w.heightBox),
          _getBottomButtons(2),
        ],
      ),
    );
  }

  Widget _getBottomButtons(int status) {
    MaterialButton button;
    switch (status) {
      case 1:
        button = _bottomButton('申请钥匙', () {}, Color(0xFFFFC40C), Colors.black);
        break;
      case 2:
        break;
      case 3:
        button = _bottomButton('确认领取', () {}, Color(0xFFFFC40C), Colors.black);
        break;
      case 4:
        button = _bottomButton('归还钥匙', () {}, Colors.black, Colors.white);
        break;
      case 5:
        button = _bottomButton('重新提交', () {}, Colors.white, Colors.black);
        break;
      case 6:
        button = _bottomButton('联系物业', () {}, Colors.white, Colors.black);
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
