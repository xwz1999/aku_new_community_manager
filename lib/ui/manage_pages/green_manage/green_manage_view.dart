import 'package:aku_community_manager/ui/manage_pages/green_manage/green_manage_card.dart';
import 'package:flutter/material.dart';

class GreenManageView extends StatefulWidget {
  final int index;
  GreenManageView({Key key, this.index}) : super(key: key);

  @override
  _GreenManageViewState createState() => _GreenManageViewState();
}

class _GreenManageViewState extends State<GreenManageView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [GreenManageCard(index: widget.index,)],
    );
  }
}
