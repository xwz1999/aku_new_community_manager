import 'package:aku_community_manager/models/manager/new_renovation/new_renovation_list_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/aku_divider.dart';
import 'package:aku_community_manager/ui/sub_pages/decoration_manager/new_renovation/new_renovation_detail_page.dart';
import 'package:aku_community_manager/ui/sub_pages/decoration_manager/new_renovation/new_renovation_finsih_submit_page.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_row_tile.dart';
import 'package:aku_community_manager/ui/widgets/common/car_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:aku_community_manager/tools/extensions/list_extension_tool.dart';

class NewRenovationCard extends StatefulWidget {
  final NewRenovationListModel model;
  final VoidCallback? callRefresh;
  NewRenovationCard({
    Key? key,
    required this.model,
    this.callRefresh,
  }) : super(key: key);

  @override
  _NewRenovationCardState createState() => _NewRenovationCardState();
}

class _NewRenovationCardState extends State<NewRenovationCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => NewRenovationDetailPage(
              model: widget.model,
            ));
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.model.roomName!,
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: kTextPrimaryColor,
                  ),
                ),
                Spacer(),
                widget.model.statusString.text
                    .size(30.sp)
                    .color(widget.model.statusColor)
                    .bold
                    .make(),
              ],
            ),
            16.w.heightBox,
            AkuDivider.horizontal(),
            24.w.heightBox,
            ...<Widget>[
              AkuRowTile(
                assetPath: R.ASSETS_MANAGE_IC_RENWU_PNG,
                title: '装修公司',
                content: widget.model.constructionUnit!.text
                    .size(24.sp)
                    .color(kTextSubColor)
                    .make(),
              ),
              AkuRowTile(
                assetPath: R.ASSETS_MANAGE_IC_RENWU_PNG,
                title: '负责人姓名',
                content: widget.model.director!.text
                    .size(24.sp)
                    .color(kTextSubColor)
                    .make(),
              ),
              AkuRowTile(
                assetPath: R.ASSETS_MANAGE_IC_RENWU_PNG,
                title: '负责人电话',
                content: widget.model.directorTel!.text
                    .size(24.sp)
                    .color(kTextSubColor)
                    .make(),
              ),
              AkuRowTile(
                assetPath: R.ASSETS_MANAGE_IC_RENWU_PNG,
                title: '预计装修时间',
                content: widget.model.expectSlot.text
                    .size(24.sp)
                    .color(kTextSubColor)
                    .make(),
              ),
              ..._nullableRowTile(
                  widget.model.actualEnd.isEmptyOrNull,
                  R.ASSETS_MANAGE_IC_RENWU_PNG,
                  '实际装修时间',
                  widget.model.actualSlot.text
                      .size(24.sp)
                      .color(kTextSubColor)
                      .make()),
              ..._nullableRowTile(
                  widget.model.isQualified == null,
                  R.ASSETS_MANAGE_IC_RENWU_PNG,
                  '检查情况',
                  widget.model.qualitfied.text
                      .size(24.sp)
                      .color(kTextSubColor)
                      .make())
            ].sepWidget(separate: 12.w.heightBox),
            ..._bottomWidgets(),
          ],
        ),
      ),
    );
  }

  List<Widget> _bottomWidgets() {
    return (widget.model.status != 6)
        ? []
        : [
            40.w.heightBox,
            Row(
              children: [Spacer(), ..._getButtons()],
            ),
          ];
  }

  List<Widget> _getButtons() {
    List<CardBottomButton> buttons = [];
    switch (widget.model.status) {
      case 6:
        buttons = [
          CardBottomButton.yellow(
              text: '提交报告',
              onPressed: () async {
                Get.to(() => NewRenovationFinishSubmitPage(
                      id: widget.model.id!,
                      callRefresh: () {
                        widget.callRefresh!();
                      },
                    ));
              })
        ];
        break;
      default:
        buttons = [];
    }
    return buttons;
  }

  _nullableRowTile(
      bool isNull, String assetPath, String title, Widget content) {
    return isNull
        ? []
        : [
            AkuRowTile(assetPath: assetPath, title: title, content: content),
          ];
  }
}
