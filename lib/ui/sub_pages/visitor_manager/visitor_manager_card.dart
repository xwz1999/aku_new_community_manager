// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:common_utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/models/manager/visitor_item_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/sub_pages/visitor_manager/visitor_manager_page.dart';

class VisitorManagerCard extends StatefulWidget {
  final VisitorItemModel model;
  VisitorManagerCard({Key key, @required this.model}) : super(key: key);

  @override
  _VisitorManagerCardState createState() => _VisitorManagerCardState();
}

class _VisitorManagerCardState extends State<VisitorManagerCard> {
  TextStyle _textStyle = TextStyle(
    color: AppStyle.primaryTextColor,
    fontSize: 28.sp,
  );

  String get _time {
    if (widget.model.visit == null)
      return '无信息';
    else
      return DateUtil.formatDate(
        widget.model.visit,
        format: 'yyyy-MM-dd HH:mm',
      );
  }

  // String get _visitorStatus {
  //   switch (widget.model.visitorStatus) {
  //     case 1:
  //       if (widget.model.effective.difference(DateTime.now()).isNegative)
  //         return '已过期';
  //       return '未到';
  //     case 2:
  //       return '已到';
  //     case 3:
  //       return '已过期';
  //     case 4:
  //       return '作废';
  //     default:
  //       return '未知';
  //   }
  // }

  VisitorStatus get _visitorStatusEnum {
    switch (widget.model.visitorStatus) {
      case 1:
        if (widget.model.effective.difference(DateTime.now()).isNegative)
          return VisitorStatus.OUTDATE;
        return VisitorStatus.NOT_VISIT;
      case 2:
        return VisitorStatus.VISIT_DONE;
      case 3:
        return VisitorStatus.OUTDATE;
      default:
        return null;
    }
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
                    widget.model.roomName,
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
                        widget.model.name,
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
                        widget.model.carNum ?? '无信息',
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
                right: 0,
                bottom: 75.w - 28.w,
                child: Transform.rotate(
                  angle: pi / 4,
                  child: Image.asset(
                    _statusImage(_visitorStatusEnum),
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
