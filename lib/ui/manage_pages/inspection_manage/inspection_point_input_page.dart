import 'dart:io';

import 'package:aku_community_manager/models/manager/inspection/inspection_detail_model.dart';
import 'package:aku_community_manager/models/manager/inspection/inspection_point_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/manage_pages/inspection_manage/inspection_utils.dart';
import 'package:aku_community_manager/ui/widgets/app_widgets/aku_pick_image_widget.dart';
import 'package:aku_community_manager/ui/widgets/app_widgets/aku_single_check_button.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class InspectionPointInputPage extends StatefulWidget {
  final bool hasScan;
  final InspectionDetailModel detailModel;
  final int inspectionStatus;
  final InspectionPointModel pointModel;
  InspectionPointInputPage(
      {Key key,
      this.hasScan,
      this.detailModel,
      this.inspectionStatus,
      this.pointModel})
      : super(key: key);

  @override
  _InspectionPointInputPageState createState() =>
      _InspectionPointInputPageState();
}

class _InspectionPointInputPageState extends State<InspectionPointInputPage> {
  TextEditingController _cleaningExtraController;
  TextEditingController _meterExtraController;
  TextEditingController _meterCountContrlller;
  int _cleaningStatus;
  int _meterStatus;
  File _selfPhoto;
  File _scenePhoto;
  @override
  void initState() {
    super.initState();
    _cleaningExtraController = TextEditingController();
    _meterExtraController = TextEditingController();
    _meterCountContrlller = TextEditingController();
  }

  @override
  void dispose() {
    _cleaningExtraController?.dispose();
    _meterExtraController?.dispose();
    _meterCountContrlller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '巡检点',
      body: ListView(
        children: [
          16.w.heightBox,
          _inspectionHeadCard(),
          16.w.heightBox,
          _cleaningCard(),
          _meterCard(),
          _selfPhotoCard(),
          _scenePhotoCard(),
        ],
      ),
    );
  }

  Widget _scenePhotoCard() {
    return Column(
      children: [
        Row(
          children: [
            '3.巡更人员自拍人脸'.text.color(kTextPrimaryColor).size(32.sp).bold.make()
          ],
        ),
        32.w.heightBox,
        AkuPickImageWidget(
          onChanged: (file) {
            _scenePhoto = file;
          },
        ),
      ],
    ).box.color(Colors.white).make();
  }

  Widget _selfPhotoCard() {
    return Column(
      children: [
        Row(
          children: [
            '3.巡更人员自拍人脸'.text.color(kTextPrimaryColor).size(32.sp).bold.make()
          ],
        ),
        32.w.heightBox,
        AkuPickImageWidget(
          onChanged: (file) {
            _selfPhoto = file;
          },
        ),
      ],
    ).box.color(Colors.white).make();
  }

  Widget _meterCard() {
    return Column(
      children: [
        Row(
          children: [
            '2.检查小区南门抄表数据'.text.color(kTextPrimaryColor).size(32.sp).make()
          ],
        ),
        32.w.heightBox,
        Row(
          children: [
            AkuSingleCheckButton(
              text: '正常',
              value: 0,
              gropValue: _meterStatus,
              onPressed: () {
                _cleaningStatus = 0;
              },
            ),
            80.w.widthBox,
            AkuSingleCheckButton(
              text: '异常',
              value: 0,
              gropValue: _meterStatus,
              onPressed: () {
                _cleaningStatus = 1;
              },
            ),
          ],
        ),
        36.w.heightBox,
        Row(
          children: [
            '抄表值'.text.color(kTextPrimaryColor).size(28.sp).make(),
            Spacer(),
            TextField(
              controller: _meterCountContrlller,
              textAlign: TextAlign.end,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]*'))
              ],
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '请输入抄表值',
                hintStyle: TextStyle(
                  fontSize: 28.sp,
                  color: kTextSubColor,
                ),
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
            )
          ],
        ),
        28.w.heightBox,
        Divider(),
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
          child: TextField(
            minLines: 5,
            controller: _meterExtraController,
            decoration: InputDecoration(
              hintText: '请输入备注信息',
              hintStyle: TextStyle(
                fontSize: 28.sp,
                color: kTextSubColor,
              ),
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              isDense: true,
            ),
          ),
        ),
      ],
    )
        .box
        .padding(EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w))
        .color(Colors.white)
        .make();
  }

  Widget _cleaningCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            '1.${widget.pointModel.name}'.text.black.size(32.sp).bold.make()
          ],
        ),
        32.w.heightBox,
        Row(
          children: [
            AkuSingleCheckButton(
              text: '正常',
              value: 0,
              gropValue: _cleaningStatus,
              onPressed: () {
                _cleaningStatus = 0;
              },
            ),
            80.w.widthBox,
            AkuSingleCheckButton(
              text: '异常',
              value: 0,
              gropValue: _cleaningStatus,
              onPressed: () {
                _cleaningStatus = 1;
              },
            ),
          ],
        ),
        32.w.heightBox,
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
          child: TextField(
            minLines: 5,
            controller: _cleaningExtraController,
            decoration: InputDecoration(
              hintText: '请输入备注信息',
              hintStyle: TextStyle(
                fontSize: 28.sp,
                color: kTextSubColor,
              ),
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              isDense: true,
            ),
          ),
        ),
      ],
    )
        .box
        .color(Colors.white)
        .padding(EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w))
        .make();
  }

  Widget _inspectionHeadCard() {
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
                    '${widget.detailModel.name}',
                    style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontSize: 36.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  InspectionUtils.status[widget.inspectionStatus].text
                      .color(InspectionUtils.color(widget.inspectionStatus))
                      .bold
                      .size(28.sp)
                      .make()
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  R.ASSETS_MANAGE_IC_RENWU_PNG,
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
                  widget.detailModel.name,
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
                  R.ASSETS_MANAGE_IC_RENWU_PNG,
                  width: 40.w,
                  height: 40.w,
                ),
                4.w.widthBox,
                Text(
                  '巡检编号',
                  style: InspectionUtils.textstyle,
                ),
                Spacer(),
                Text(
                  widget.detailModel.code,
                  style: AppStyle().primaryStyle,
                )
              ],
            ),
            12.w.heightBox,
            Row(
              children: [
                Image.asset(
                  R.ASSETS_INSPECTION_IC_XUNJIAN_PNG,
                  width: 40.w,
                  height: 40.w,
                ),
                4.w.widthBox,
                Text(
                  '规定巡检时间',
                  style: InspectionUtils.textstyle,
                ),
                Spacer(),
                Text(
                  '${DateUtil.formatDateStr(widget.detailModel.beginDate, format: "yyyy-MM-dd HH:mm")}～${widget.detailModel?.endDate == null ? '' : DateUtil.formatDateStr(widget.detailModel.endDate, format: "HH:mm")}',
                  style: AppStyle().primaryStyle,
                ),
              ],
            ),
            12.w.heightBox,
            ...widget.detailModel?.actualBeginDate == null
                ? <Widget>[SizedBox()]
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
                          style: InspectionUtils.textstyle,
                        ),
                        Spacer(),
                        Text(
                          '${DateUtil.formatDateStr(widget.detailModel.actualBeginDate, format: "yyyy-MM-dd HH:mm")}',
                          style: AppStyle().primaryStyle,
                        ),
                      ],
                    ),
                    12.w.heightBox,
                  ],
            widget.detailModel?.actualEndDate == null
                ? SizedBox()
                : Row(
                    children: [
                      Image.asset(
                        R.ASSETS_MESSAGE_IC_PEOPLE_PNG,
                        width: 40.w,
                        height: 40.w,
                      ),
                      4.w.widthBox,
                      Text(
                        '结束巡检时间',
                        style: InspectionUtils.textstyle,
                      ),
                      Spacer(),
                      Text(
                        '${DateUtil.formatDateStr(widget.detailModel.actualEndDate, format: "yyyy-MM-dd HH:mm")}',
                        style: AppStyle().primaryStyle,
                      ),
                    ],
                  )
          ]),
        ),
      ],
    );
  }
}
