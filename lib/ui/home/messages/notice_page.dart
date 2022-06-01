import 'package:flutter/cupertino.dart';
import '../../../style/app_style.dart';
import '../../widgets/common/aku_scaffold.dart';
import 'announce_view.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '通知公告',
      titleStyle: AppStyle().barTitleStyle,
      body: AnnounceView()
    );
  }
}
