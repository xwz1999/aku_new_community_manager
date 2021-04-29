import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:flutter/material.dart';

class FacilitiesInspectReportPage extends StatefulWidget {
  FacilitiesInspectReportPage({Key key}) : super(key: key);

  @override
  _FacilitiesInspectReportPageState createState() =>
      _FacilitiesInspectReportPageState();
}

class _FacilitiesInspectReportPageState
    extends State<FacilitiesInspectReportPage> {
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '检查报告',
      body: ListView(),
    );
  }
}
