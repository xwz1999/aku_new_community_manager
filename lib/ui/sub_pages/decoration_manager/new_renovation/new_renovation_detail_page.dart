import 'package:aku_community_manager/models/manager/new_renovation/new_renovation_list_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/aku_divider.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_row_tile.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:aku_community_manager/tools/extensions/list_extension_tool.dart';

class NewRenovationDetailPage extends StatefulWidget {
  final NewRenovationListModel model;
  NewRenovationDetailPage({Key? key, required this.model}) : super(key: key);

  @override
  _NewRenovationDetailPageState createState() =>
      _NewRenovationDetailPageState();
}

class _NewRenovationDetailPageState extends State<NewRenovationDetailPage> {
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '装修详情',
      body: ListView(
        padding: EdgeInsets.all(32.w),
        children: [
          _renovationInfo(),
          40.w.heightBox,
          _contentWidget(),
          ..._checkWidge(),
        ],
      ),
    );
  }

  Widget _contentWidget() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
      padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              '装修反馈'.text.size(32.sp).color(kTextPrimaryColor).bold.make(),
              Spacer(),
            ],
          ),
          16.w.heightBox,
          AkuDivider.horizontal(),
          20.w.heightBox,
          (widget.model.rejectReason ?? '')
              .text
              .size(28.sp)
              .color(kTextPrimaryColor)
              .make(),
          ...widget.model.auditDate.isEmptyOrNull
              ? []
              : [
                  40.w.heightBox,
                  Row(
                    children: [
                      Spacer(),
                      widget.model.auditDate!.text
                          .size(24.sp)
                          .color(kTextSubColor)
                          .make(),
                    ],
                  ),
                ],
          ...widget.model.checkVoList!.isEmpty ? [] : [..._checkWidge()]
        ],
      ),
    );
  }

  List<Widget> _checkWidge() {
    return widget.model.checkVoList!
        .map((e) => Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.w)),
              padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
              child: Column(
                children: [
                  16.w.heightBox,
                  AkuDivider.horizontal(),
                  20.w.heightBox,
                  Row(
                    children: [
                      '完工检查${widget.model.checkVoList!.indexOf(e)}'
                          .text
                          .size(32.sp)
                          .color(kTextPrimaryColor)
                          .bold
                          .make(),
                      Spacer(),
                    ],
                  ),
                  12.w.heightBox,
                  e.qualitfied.text
                      .size(28.sp)
                      .color(e.isQualified == 1 ? Colors.green : Colors.red)
                      .make(),
                  20.w.heightBox,
                  Row(
                    children: [
                      Spacer(),
                      e.createDate!
                          .text
                          .size(24.sp)
                          .color(kTextSubColor)
                          .make(),
                    ],
                  ),
                ],
              ),
            ))
        .toList();
  }

  Widget _renovationInfo() {
    return Container(
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
                    .make())
          ].sepWidget(separate: 12.w.heightBox),
        ],
      ),
    );
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
