// Flutter imports:
import 'package:aku_community_manager/models/manager/facilities/facilities_check_list_model.dart';
// Project imports:
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/aku_divider.dart';
import 'package:aku_community_manager/ui/manage_pages/facilities/facilities_inspect_report_page.dart';
import 'package:aku_community_manager/ui/manage_pages/facilities/facilities_map.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class FacilitiesCard extends StatefulWidget {
  final int index;
  final int facilitiesType;
  final FacilitiesCheckListModel model;
  final VoidCallback? callRefresh;

  FacilitiesCard(
      {Key? key,
      required this.index,
      required this.model,
      required this.facilitiesType,
      this.callRefresh})
      : super(key: key);

  @override
  _FacilitiesCardState createState() => _FacilitiesCardState();
}

class _FacilitiesCardState extends State<FacilitiesCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            widget.model.facilitiesName!.text
                .color(kTextPrimaryColor)
                .size(32.sp)
                .bold
                .make(),
            Spacer(),
            FacilitiesMap.inspectStatus[widget.model.status!]!.text
                .color(FacilitiesMap.insepectColor[widget.model.status!]!)
                .size(28.sp)
                .bold
                .make(),
          ],
        ),
        16.w.heightBox,
        AkuDivider.horizontal(),
        24.w.heightBox,
        _buildTile(R.ASSETS_MANAGE_ADDRESS_PNG, '场地地址',
            widget.model.facilitiesAddress!),
        ..._midTile(),
        ...widget.index != 0
            ? []
            : [
                40.w.heightBox,
                Row(
                  children: [
                    Spacer(),
                    AkuMaterialButton(
                        radius: 74.w,
                        height: 52.w,
                        padding: EdgeInsets.symmetric(
                            vertical: 8.w, horizontal: 24.w),
                        color: Color(0xFFFFC40C),
                        onPressed: () async {
                          await Get.to(() => FacilitiesInspectReportPage(
                                facilitiesType: widget.facilitiesType,
                                id: widget.model.id!,
                                model: widget.index != 1 ? widget.model : null,
                              ));
                          widget.callRefresh!();
                        },
                        child: '填写报告'
                            .text
                            .size(26.sp)
                            .color(kTextPrimaryColor)
                            .bold
                            .make())
                  ],
                ),
              ],
      ],
    )
        .box
        .width(double.infinity)
        .withRounded(value: 8.w)
        .color(Colors.white)
        .padding(EdgeInsets.all(24.w))
        .make()
        .onInkTap(() async {
      await Get.to(() => FacilitiesInspectReportPage(
            facilitiesType: widget.facilitiesType,
            id: widget.model.id!,
            model: widget.index != 1 ? widget.model : null,
          ));
      widget.callRefresh!();
    });
  }

  _midTile() {
    switch (widget.index) {
      case 0:
        return [
          15.w.heightBox,
          _buildTile(R.ASSETS_MANAGE_CLOCK_PNG, '任务时间',
              '${DateUtil.formatDateStr(widget.model.beginDate!, format: 'yyyy-MM-dd HH:mm')}-${DateUtil.formatDateStr(widget.model.endDate!, format: 'HH;mm')}'),
        ];

      case 1:
        return [
          15.w.heightBox,
          _buildTile(
              R.ASSETS_MANAGE_CLOCK_PNG, '场地情况', widget.model.situationString,
              color: Color(0xFF3F8FFE)),
          15.w.heightBox,
          _buildTile(R.ASSETS_MANAGE_CLOCK_PNG, '规定任务时间',
              '${DateUtil.formatDateStr(widget.model.beginDate!, format: 'yyyy-MM-dd HH:mm')}-${DateUtil.formatDateStr(widget.model.endDate!, format: 'HH;mm')}'),
          15.w.heightBox,
          _buildTile(
              R.ASSETS_MANAGE_CLOCK_PNG,
              '检查提交时间',
              DateUtil.formatDateStr(widget.model.checkDate ?? '',
                  format: 'yyyy-MM-dd HH:mm')),
        ];
      case 2:
        return [
          15.w.heightBox,
          _buildTile(
              R.ASSETS_MANAGE_CLOCK_PNG, '未完成原因', widget.model.detail ?? '',
              color: Colors.red),
          15.w.heightBox,
          _buildTile(R.ASSETS_MANAGE_CLOCK_PNG, '规定任务时间',
              '${DateUtil.formatDateStr(widget.model.beginDate!, format: 'yyyy-MM-dd HH:mm')}-${DateUtil.formatDateStr(widget.model.endDate!, format: 'HH;mm')}'),
        ];
      default:
        return [];
    }
  }

  Widget _buildTile(String icon, String title, String text,
      {Color color = kTextSubColor}) {
    return Row(
      children: [
        Image.asset(
          icon,
          width: 40.w,
          height: 40.w,
        ),
        20.w.widthBox,
        title.text.size(24.sp).color(kTextSubColor).make(),
        Spacer(),
        text.text.size(24.sp).color(color).make(),
      ],
    );
  }
}
