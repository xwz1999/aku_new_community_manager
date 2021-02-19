// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

class WarningDetailPage extends StatefulWidget {
  WarningDetailPage({Key key}) : super(key: key);

  @override
  _WarningDetailPageState createState() => _WarningDetailPageState();
}

class _WarningDetailPageState extends State<WarningDetailPage> {
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      appBarColor: Color(0xFFF9F9F9),
      title: '功能说明',
      body: ListView(
        padding: EdgeInsets.all(32.w),
        children: [
          Text(
            '一键报警',
            style: TextStyle(
              color: AppStyle.primaryTextColor,
              fontSize: 32.w,
              fontWeight: FontWeight.bold,
            ),
          ),
          AkuBox.h(20),
          Text(
            '点击“呼叫110”后，您可以直接拨打本地110。页面中提供了您当前所在位置，以便您与警方沟通。（GPS信号弱时，位置可能存在偏移）',
            style: TextStyle(
              color: Color(0xFF666666),
              fontSize: 28.w,
            ),
          ),
        ],
      ),
      // body: ,
    );
  }
}
