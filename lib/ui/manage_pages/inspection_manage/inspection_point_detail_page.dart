import 'package:aku_community_manager/models/manager/inspection/inspection_check_detail_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/manage_pages/inspection_manage/inspection_utils.dart';
import 'package:aku_community_manager/ui/sub_pages/manage_func.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:common_utils/common_utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class InspectionPointDetailPage extends StatefulWidget {
  final int executePointId;
  final String executeName;
  final hasScan;
  InspectionPointDetailPage({
    Key key,
    this.executePointId,
    this.executeName,
    @required this.hasScan,
  }) : super(key: key);

  @override
  _InspectionPointDetailPageState createState() =>
      _InspectionPointDetailPageState();
}

class _InspectionPointDetailPageState extends State<InspectionPointDetailPage> {
  bool _onload = true;
  EasyRefreshController _easyRefreshController;
  InspectionCheckDetialModel _detialModel;
  @override
  void initState() {
    super.initState();
    _easyRefreshController = EasyRefreshController();
  }

  String inspectionPattern(int type) {
    switch (type) {
      case 1:
        return '巡检模式1';
        break;
      default:
        return '';
    }
  }

  @override
  void dispose() {
    _easyRefreshController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '巡检点',
      body: EasyRefresh(
        header:
            MaterialHeader(valueColor: AlwaysStoppedAnimation(kPrimaryColor)),
        firstRefresh: true,
        onRefresh: () async {
          _detialModel = await ManageFunc.getInspectionPointCheckDetail(
              widget.executePointId);
          _onload = false;
          setState(() {});
        },
        controller: _easyRefreshController,
        child: _onload
            ? _emptyWidget()
            : ListView(
                children: [
                  16.w.heightBox,
                  _inspectionHeadCard(_detialModel),
                  16.w.heightBox,
                  ..._detialModel.checkFBIVoList
                      .map((e) => _bodyCard(e))
                      .toList(),
                  _selfPhotoCard(),
                  _scenePhotoCard(),
                ],
              ),
      ),
    );
  }

  Widget _selfPhotoCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            '3.巡更人员自拍人脸'.text.color(kTextPrimaryColor).size(32.sp).bold.make()
          ],
        ),
        32.w.heightBox,
        widget.hasScan
            ? Container(
                width: 320.w,
                height: 320.w,
                child: Placeholder(),
              )
            : DottedBorder(
                borderType: BorderType.RRect,
                dashPattern: [6, 3],
                color: Color(0xFF999999),
                strokeWidth: 2.w,
                radius: Radius.circular(8.w),
                child: Container(
                  width: 160.w,
                  height: 160.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        R.ASSETS_MANAGE_IC_IMAGE_PNG,
                        width: 60.w,
                        height: 60.w,
                        color: Color(0xFF999999),
                      ),
                      4.w.heightBox,
                      '上传图片'.text.color(kTextSubColor).size(22.sp).bold.make(),
                    ],
                  ),
                ),
              )
      ],
    )
        .box
        .color(Colors.white)
        .padding(EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w))
        .make();
  }

  Widget _scenePhotoCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            '3.巡更人员拍摄现场'.text.color(kTextPrimaryColor).size(32.sp).bold.make()
          ],
        ),
        32.w.heightBox,
        widget.hasScan
            ? Container(
                width: 320.w,
                height: 320.w,
                child: Placeholder(),
              )
            : DottedBorder(
                borderType: BorderType.RRect,
                dashPattern: [6, 3],
                color: Color(0xFF999999),
                strokeWidth: 2.w,
                radius: Radius.circular(8.w),
                child: Container(
                  width: 160.w,
                  height: 160.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        R.ASSETS_MANAGE_IC_IMAGE_PNG,
                        width: 60.w,
                        height: 60.w,
                        color: Color(0xFF999999),
                      ),
                      4.w.heightBox,
                      '上传图片'.text.color(kTextSubColor).size(22.sp).bold.make(),
                    ],
                  ),
                ),
              )
      ],
    )
        .box
        .color(Colors.white)
        .padding(EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w))
        .make();
  }

  Widget _bodyCard(CheckFBIVoList model) {
    return Column(
      children: [
        Row(
          children: [
            '2.${model.name}'.text.color(kTextPrimaryColor).size(32.sp).make()
          ],
        ),
        32.w.heightBox,
        widget.hasScan
            ? Row(
                children: [
                  Container(
                    width: 180.w,
                    height: 72.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.w),
                      color: Color(0xFFFFF8E0),
                      border: Border.all(color: Color(0xFFFFC40C), width: 3.w),
                    ),
                    child: model.status == 1
                        ? '正常'
                            .text
                            .color(kTextPrimaryColor)
                            .size(32.sp)
                            .bold
                            .make()
                        : '异常'
                            .text
                            .color(kTextPrimaryColor)
                            .size(32.sp)
                            .bold
                            .make(),
                  ),
                ],
              )
            : Row(
                children: [
                  Container(
                      width: 180.w,
                      height: 72.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.w),
                        color: Color(0xFFF9F9F9),
                        border:
                            Border.all(color: Color(0xFF999999), width: 3.w),
                      ),
                      child: '正常'
                          .text
                          .color(kTextSubColor)
                          .size(32.sp)
                          .bold
                          .make()),
                  80.w.widthBox,
                  Container(
                      width: 180.w,
                      height: 72.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.w),
                        color: Color(0xFFF9F9F9),
                        border:
                            Border.all(color: Color(0xFF999999), width: 3.w),
                      ),
                      child: '异常'
                          .text
                          .color(kTextSubColor)
                          .size(32.sp)
                          .bold
                          .make()),
                ],
              ),
        ...!widget.hasScan
            ? []
            : [
                36.w.heightBox,
                Container(
                  width: 686.w,
                  height: 120.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    border: Border.all(
                      width: 2.w,
                      color: Color(0xFFE8E8E8),
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 16.w, horizontal: 24.w),
                  child: model.remakes.text
                      .color(kTextPrimaryColor)
                      .size(28.sp)
                      .make(),
                ),
              ],
      ],
    )
        .box
        .padding(EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w))
        .color(Colors.white)
        .make();
  }

  Widget _emptyWidget() {
    return Container();
  }

  Widget _inspectionHeadCard(InspectionCheckDetialModel model) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        16.w.heightBox,
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 40.w),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              color: Color(0xFFFFFFFF)),
          child: Column(children: [
            Container(
              height: 86.w,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    '巡检点信息',
                    style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontSize: 36.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  R.ASSETS_INSPECTION_IC_INSPECTION_NAME_PNG,
                  width: 40.w,
                  height: 40.w,
                ),
                4.w.widthBox,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '巡检名称',
                      style: InspectionUtils.textstyle,
                    ),
                  ],
                ),
                36.w.widthBox,
                Text(
                  widget.executeName,
                  maxLines: 2,
                  textAlign: TextAlign.right,
                  style: AppStyle().primaryStyle,
                ).expand()
              ],
            ),
            12.w.heightBox,
            Row(
              children: [
                Image.asset(
                  R.ASSETS_INSPECTION_IC_DATE_PNG,
                  width: 40.w,
                  height: 40.w,
                ),
                4.w.widthBox,
                Text(
                  '巡检点编号',
                  style: InspectionUtils.textstyle,
                ),
                Spacer(),
                Text(
                  model.code,
                  style: AppStyle().primaryStyle,
                )
              ],
            ),
            12.w.heightBox,
            Row(
              children: [
                Image.asset(
                  R.ASSETS_INSPECTION_IC_STATION_PNG,
                  width: 40.w,
                  height: 40.w,
                ),
                4.w.widthBox,
                Text(
                  '巡检点名称',
                  style: InspectionUtils.textstyle,
                ),
                Spacer(),
                Text(
                  '${model.name}',
                  style: AppStyle().primaryStyle,
                ),
              ],
            ),
            12.w.heightBox,
            Row(
              children: [
                Image.asset(
                  R.ASSETS_INSPECTION_IC_PATTERN_PNG,
                  width: 40.w,
                  height: 40.w,
                ),
                4.w.widthBox,
                Text(
                  '巡检模式',
                  style: InspectionUtils.textstyle,
                ),
                Spacer(),
                Text(
                  '${inspectionPattern(model.type)}',
                  style: AppStyle().primaryStyle,
                ),
              ],
            ),
            ...model.completeDate == null
                ? []
                : [
                    12.w.heightBox,
                    Row(
                      children: [
                        Image.asset(
                          R.ASSETS_MANAGE_IC_TIME_PNG,
                          width: 40.w,
                          height: 40.w,
                        ),
                        4.w.widthBox,
                        Text(
                          '扫码时间',
                          style: InspectionUtils.textstyle,
                        ),
                        Spacer(),
                        Text(
                          '${DateUtil.formatDateStr(model.completeDate, format: "yyyy-MM-dd HH:mm")}',
                          style: AppStyle().primaryStyle,
                        ),
                      ],
                    ),
                  ]
          ]),
        ),
      ],
    );
  }
}
