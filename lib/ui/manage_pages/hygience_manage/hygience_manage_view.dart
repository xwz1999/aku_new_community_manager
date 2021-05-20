import 'package:aku_community_manager/ui/manage_pages/hygience_manage/hygience_manage_card.dart';
import 'package:flutter/material.dart';

class HygienceManageView extends StatefulWidget {
  final int index;
  HygienceManageView({Key key, this.index}) : super(key: key);

  @override
  _HygienceManageViewState createState() => _HygienceManageViewState();
}

class _HygienceManageViewState extends State<HygienceManageView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HyginecManageCard(index: widget.index,)
      ],
    );
  }
}
