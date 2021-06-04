// Flutter imports:
import 'package:aku_community_manager/ui/widgets/common/aku_button.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

// Project imports:
import 'package:aku_community_manager/models/manager/inspection/inspection_list_model.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/manage_pages/inspection_manage/inspection_manage_details_page.dart';
import 'package:aku_community_manager/utils/extension/aku_date.dart';

class InspectionManageCard extends StatefulWidget {
  final InspectionListModel cardModel;
  InspectionManageCard({
    Key? key,
    required this.cardModel,
  }) : super(key: key);

  @override
  _InspectionManageCardState createState() => _InspectionManageCardState();
}

class _InspectionManageCardState extends State<InspectionManageCard> {
  TextStyle _textstyle =
      TextStyle(color: AppStyle.minorTextColor, fontSize: 28.sp);
  Map<int, String> _inspectionStatus = {1: '待巡检', 2: '已巡检', 3: '巡检中', 4: '未巡检'};
  Color _inspectionColor(int? status) {
    switch (status) {
      case 1:
        return Color(0xFFFF4501);
        
      case 2:
        return Color(0xFF999999);
      case 3:
        return Color(0xFFFF4501);
      case 4:
        return Color(0xFFFF4501);
      default:
        return Colors.blue;
    }
  }

  bool get isManager {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return userProvider.infoModel!.canOperation;
  }

  @override
  Widget build(BuildContext context) {
    return AkuButton(
      onPressed: () {
        Get.to(
          InspectionManageDetailsPage(
            executeId: widget.cardModel.id!,
          ),
        );
      },
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 40.w),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w), color: Color(0xFFFFFFFF)),
        child: Column(children: [
          Container(
            height: 93.w,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(
                  '${widget.cardModel.name}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: AppStyle.primaryTextColor,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold),
                ).expand(),
                _inspectionStatus[widget.cardModel.status!]!
                    .text
                    .color(_inspectionColor(widget.cardModel.status))
                    .bold
                    .size(28.sp)
                    .make()
              ],
            ),
          ),
          Divider(height: 1.w),
          24.w.heightBox,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                R.ASSETS_INSPECTION_IC_DATE_PNG,
                width: 40.w,
                height: 40.w,
              ),
              4.w.widthBox,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '巡检编号',
                    style: _textstyle,
                  ),
                ],
              ),
              36.w.widthBox,
              Text(
                widget.cardModel.code!,
                maxLines: 2,
                textAlign: TextAlign.right,
                style: AppStyle().primaryStyle,
              ).expand()
            ],
          ),
          12.w.heightBox,
          ...isManager
              ? [
                  Row(
                    children: [
                      Image.asset(
                        R.ASSETS_MESSAGE_IC_PEOPLE_PNG,
                        width: 40.w,
                        height: 40.w,
                      ),
                      4.w.widthBox,
                      Text(
                        '巡检人',
                        style: _textstyle,
                      ),
                      Spacer(),
                      Text(
                        widget.cardModel.inspectorName!,
                        style: AppStyle().primaryStyle,
                      )
                    ],
                  ),
                  12.w.heightBox,
                ]
              : [SizedBox()],
          Row(
            children: [
              Image.asset(
                R.ASSETS_MANAGE_IC_TIME_PNG,
                width: 40.w,
                height: 40.w,
              ),
              4.w.widthBox,
              Text('规定巡检时间', style: _textstyle),
              Spacer(),
              Text(
                '${widget.cardModel.beginDate!.akuDate()}${widget.cardModel.endDate == null ? '' : '～'}${widget.cardModel.endDate == null ? '' : DateUtil.formatDateStr(widget.cardModel.endDate!, format: "HH:mm")}',
                style: AppStyle().primaryStyle,
              ),
            ],
          ),
          12.w.heightBox,
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
                        '${DateUtil.formatDateStr(widget.cardModel.actualBeginDate!, format: "yyyy-MM-dd HH:mm")}',
                        style: AppStyle().primaryStyle,
                      ),
                    ],
                  ),
                  12.w.heightBox,
                ],
          widget.cardModel.actualEndDate == null
              ? SizedBox()
              : Row(
                  children: [
                    Image.asset(
                      R.ASSETS_MANAGE_IC_TIME_PNG,
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
                      '${DateUtil.formatDateStr(widget.cardModel.actualEndDate!, format: "yyyy-MM-dd HH:mm")}',
                      style: AppStyle().primaryStyle,
                    ),
                  ],
                )
        ]),
      ),
    );
  }
}
