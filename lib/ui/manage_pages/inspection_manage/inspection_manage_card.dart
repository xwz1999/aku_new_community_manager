import 'package:aku_community_manager/models/manager/inspection/inspection_list_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_ui/aku_ui.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class InspectionManageCard extends StatefulWidget {
  final InspectionListModel cardModel;
  final bool extra;
  InspectionManageCard({Key key, this.cardModel, this.extra = true})
      : super(key: key);

  @override
  _InspectionManageCardState createState() => _InspectionManageCardState();
}

class _InspectionManageCardState extends State<InspectionManageCard> {
  @override
  Widget build(BuildContext context) {
    TextStyle _textstyle =
        TextStyle(color: AppStyle.minorTextColor, fontSize: 28.sp);
    Map<int, String> _inspectionStatus = {
      1: '待巡检',
      2: '已巡检',
    };
    Color _inspectionColor(int status) {
      switch (status) {
        case 1:
          return Color(0xFF4501);
          break;
        case 2:
          return Color(0x999999);
        default:
          return Colors.black;
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        16.w.heightBox,
        AkuButton(
          onPressed: widget.extra
              ? () {
                  // Get.to(
                  //   InspectionManageDetailsPage(
                  //     widget.cardModel: widget.cardModel,
                  //   ),
                  // );
                }
              : () {},
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
                left: 24.w, right: 24.w, bottom: widget.extra ? 48.w : 40.w),
            width: double.infinity,
            height: widget.extra ? 362.w : 270.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                color: Color(0xFFFFFFFF)),
            child: Column(children: [
              Container(
                height: widget.extra ? 93.w : 86.w,
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      '1号巡检任务',
                      style: TextStyle(
                          color: AppStyle.primaryTextColor,
                          fontSize: widget.extra ? 32.sp : 36.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    _inspectionStatus[widget.cardModel.status]
                        .text
                        .color(_inspectionColor(widget.cardModel.status))
                        .bold
                        .size(28.sp)
                        .make()
                  ],
                ),
              ),
              widget.extra
                  ? Divider(
                      height: 1.w,
                    )
                  : SizedBox(),
              widget.extra ? 24.w.heightBox : SizedBox(),
              Row(
                children: [
                  Image.asset(
                    R.ASSETS_MANAGE_IC_RENWU_PNG,
                    width: 40.w,
                    height: 40.w,
                  ),
                  4.w.widthBox,
                  Text(
                    '巡检编号',
                    style: _textstyle,
                  ),
                  Spacer(),
                  Text(
                    widget.cardModel.code,
                    style: AppStyle().primaryStyle,
                  )
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Image.asset(
                    R.ASSETS_INSPECTION_IC_XUNJIAN_PNG,
                    width: 40.w,
                    height: 40.w,
                  ),
                  4.w.widthBox,
                  Text('规定巡检时间', style: _textstyle),
                  Spacer(),
                  Text(
                    '${DateUtil.formatDateStr(widget.cardModel.beginDate, format: "yyyy-MM-dd HH:mm")}～${DateUtil.formatDateStr(widget.cardModel.endDate, format: "HH:mm")}',
                    style: AppStyle().primaryStyle,
                  ),
                ],
              ),
              Spacer(),
              ...widget.cardModel.actualBeginDate == null
                  ? [SizedBox()]
                  : [
                      Row(
                        children: [
                          Image.asset(
                            R.ASSETS_MANAGE_IC_TIME_PNG,
                            width: 40.w,
                            height: 40.w,
                          ),
                          4.w.widthBox,
                          Text(
                            '开始巡检时间',
                            style: _textstyle,
                          ),
                          Spacer(),
                          Text(
                            '${DateUtil.formatDateStr(widget.cardModel.actualBeginDate, format: "yyyy-MM-dd HH:mm")}',
                            style: AppStyle().primaryStyle,
                          ),
                        ],
                      ),
                      Spacer(),
                    ],
              widget.cardModel.actualEndDate == null
                  ? Row(
                      children: [
                        Image.asset(
                          R.ASSETS_MESSAGE_IC_PEOPLE_PNG,
                          width: 40.w,
                          height: 40.w,
                        ),
                        4.w.widthBox,
                        Text(
                          '结束巡检时间',
                          style: _textstyle,
                        ),
                        Spacer(),
                        Text(
                          '${DateUtil.formatDateStr(widget.cardModel.actualEndDate, format: "yyyy-MM-dd HH:mm")}',
                          style: AppStyle().primaryStyle,
                        ),
                      ],
                    )
                  : SizedBox(),
            ]),
          ),
        ),
      ],
    );
  }
}
