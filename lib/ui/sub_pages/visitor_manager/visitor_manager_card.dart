// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/sub_pages/visitor_manager/visitor_manager_page.dart';

class VisitorManagerCard extends StatefulWidget {
  final String adress;
  final String name;
  final String plate;
  final String time;
  final VisitorStatus status;
  VisitorManagerCard(
      {Key key,
      @required this.adress,
      @required this.name,
      this.plate,
      this.time,
      @required this.status})
      : super(key: key);

  @override
  _VisitorManagerCardState createState() => _VisitorManagerCardState();
}

class _VisitorManagerCardState extends State<VisitorManagerCard> {
  TextStyle _textStyle = TextStyle(
    color: AppStyle.primaryTextColor,
    fontSize: 28.sp,
  );
  String _adress;
  String _name;
  String _plate;
  String _time;
  VisitorStatus _status;
  @override
  void initState() {
    super.initState();
    _adress = widget.adress;
    _name = widget.name;
    _plate = widget.plate ?? '无信息';
    _time = widget.time ?? '无信息';
    _status = widget.status;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AkuBox.h(16),
        Container(
          color: Color(0xFFFFFFFF),
          width: double.infinity,
          height: 201.w,
          padding: EdgeInsets.only(top: 24.w, left: 24.w, bottom: 28.w),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _adress,
                    style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  AkuBox.h(16),
                  Row(
                    children: [
                      Image.asset(
                        R.ASSETS_OUTDOOR_IC_PEOPLE_PNG,
                        width: 40.w,
                        height: 40.w,
                      ),
                      AkuBox.w(8),
                      Text(
                        '$_name先生',
                        style: _textStyle,
                      ),
                      AkuBox.w(137),
                      Image.asset(
                        R.ASSETS_MANAGE_IC_CAR_PNG,
                        width: 40.w,
                        height: 40.w,
                      ),
                      AkuBox.w(8),
                      Text(
                        _plate,
                        style: _textStyle,
                      ),
                      Spacer(),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Image.asset(
                        R.ASSETS_MANAGE_IC_TIME_PNG,
                        width: 40.w,
                        height: 40.w,
                      ),
                      AkuBox.w(8),
                      Text(_time, style: _textStyle),
                      Spacer(),
                    ],
                  ),
                ],
              ),
              Positioned(
                left: 552.w - 24.w,
                bottom: 75.w - 28.w,
                child: Transform.rotate(
                  angle: pi / 4,
                  child: Image.asset(
                    _statusImage(_status),
                    width: 140.w,
                    height: 140.w,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _statusImage(VisitorStatus status) {
    switch (status) {
      case VisitorStatus.NOT_VISIT:
        return R.ASSETS_MANAGE_IC_WEIDAO_PNG;
      case VisitorStatus.VISIT_DONE:
        return R.ASSETS_MANAGE_IC_DAOFANG_PNG;
      case VisitorStatus.OUTDATE:
        return R.ASSETS_MANAGE_IC_GUOQI_PNG;
      default:
        return '';
    }
  }
}
