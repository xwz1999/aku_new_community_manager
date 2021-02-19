// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:aku_ui/common_widgets/aku_common_widgets.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:aku_community_manager/mock_models/outdoor_models/outdoor_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

class OutdoorPassPage extends StatefulWidget {
  final ItemsOutdoorModel model;
  OutdoorPassPage({Key key, @required this.model}) : super(key: key);

  @override
  _OutdoorPassPageState createState() => _OutdoorPassPageState();
}

class _OutdoorPassPageState extends State<OutdoorPassPage> {
  TextEditingController _textController;
  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String _currentTime = DateUtil.formatDate(DateTime.now());

    return AkuScaffold(
      title: '放行',
      body: Column(
        children: [
          AkuBox.h(16),
          Container(
            padding: EdgeInsets.only(
              left: 32.w,
            ),
            color: Color(0xFFFFFFFF),
            alignment: Alignment.center,
            width: double.infinity,
            height: 96.w,
            child: Row(
              children: [
                Text(
                  '当前时间',
                  style: AppStyle().secondaryTextStyle,
                ),
                AkuBox.w(80),
                Text(
                  _currentTime,
                  style: AppStyle().primaryStyle,
                ),
                Spacer(),
              ],
            ),
          ),
          Divider(
            height: 1.w,
          ),
          Container(
            padding: EdgeInsets.only(left: 32.w),
            color: Color(0xFFFFFFFF),
            alignment: Alignment.center,
            width: double.infinity,
            height: 96.w,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '当前出口',
                  style: AppStyle().secondaryTextStyle,
                ),
                AkuBox.w(32),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 48.w),
                    child: TextFormField(
                      controller: _textController,
                      maxLines: 1,
                      style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontSize: 32.sp,
                      ),
                      decoration: InputDecoration(
                          hintText: '请输入当前入口',
                          hintStyle: AppStyle().secondaryTextStyle,
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottom: AkuButton(
        onPressed: _textController.text == null
            ? () {
                BotToast.showText(text: '出口不能为空！');
              }
            : () {
                widget.model.finalOutTime = _currentTime;
                widget.model.outPlace = _textController.text;
                widget.model.datetime = DateTime.now();
                widget.model.status = OUTDOORSTATUS.OUT_DONE;
                Get.back();
                Get.back();
              },
        child: Container(
          color: Color(0xFFFFC40C),
          height: 98.w,
          alignment: Alignment.center,
          child: Text(
            '确认放行',
            style: TextStyle(
                color: AppStyle.primaryTextColor,
                fontSize: 32.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
