// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:aku_ui/common_widgets/aku_common_widgets.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';

class OutdoorPassPage extends StatefulWidget {
  final int id;

  OutdoorPassPage({Key key, this.id}) : super(key: key);

  @override
  _OutdoorPassPageState createState() => _OutdoorPassPageState();
}

class _OutdoorPassPageState extends State<OutdoorPassPage> {
  int _doorValue;
  @override
  Widget build(BuildContext context) {
    String _currentTime =
        DateUtil.formatDate(DateTime.now(), format: 'yyyy-MM-dd HH:mm');

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
                  child: PopupMenuButton(
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(child: Text('东门'), value: 1),
                        PopupMenuItem(child: Text('南门'), value: 2),
                        PopupMenuItem(child: Text('西门'), value: 3),
                        PopupMenuItem(child: Text('北门'), value: 4),
                      ];
                    },
                    onSelected: (value) {
                      _doorValue = value;
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 48.w),
                      child: Text(
                        _doorValue == null
                            ? '请输入当前入口'
                            : {
                                1: '东门',
                                2: '南门',
                                3: '西门',
                                4: '北门',
                              }[_doorValue],
                        style: _doorValue == null
                            ? AppStyle().secondaryTextStyle
                            : AppStyle().primaryStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottom: AkuButton(
        onPressed: _doorValue == null
            ? () {
                BotToast.showText(text: '出口不能为空！');
              }
            : () async {
                Function cancel = BotToast.showLoading();
                NetUtil().post(
                  API.manage.goodsOutRelease,
                  params: {
                    'id': widget.id,
                    'export': _doorValue,
                  },
                  showMessage: true,
                );
                cancel();
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
