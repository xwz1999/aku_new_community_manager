// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:aku_community_manager/models/manager/facilities/facilities_card.dart';

class FacilitiesView extends StatefulWidget {
  final int index;
  FacilitiesView({Key key, this.index}) : super(key: key);

  @override
  _FacilitiesViewState createState() => _FacilitiesViewState();
}

class _FacilitiesViewState extends State<FacilitiesView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 32.w),
      children: [
        FacilitiesCard(
          index: widget.index,
        ),
      ],
    );
  }
}
