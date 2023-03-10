// Dart imports:
import 'dart:async';

import 'package:aku_new_community_manager/const/saas_api.dart';
import 'package:aku_new_community_manager/models/manager/inspection/inspection_detail_model.dart';
import 'package:aku_new_community_manager/models/manager/inspection/inspection_point_model.dart';
import 'package:aku_new_community_manager/models/manager/inspection/inspection_qrcode_model.dart';
import 'package:aku_new_community_manager/provider/app_provider.dart';
import 'package:aku_new_community_manager/saas_models/net_model/base_model.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/ui/manage_pages/inspection_manage/inspection_point_detail_page.dart';
import 'package:aku_new_community_manager/ui/manage_pages/inspection_manage/inspection_point_input_page.dart';
import 'package:aku_new_community_manager/ui/manage_pages/inspection_manage/qr_scanner_page.dart';
import 'package:aku_new_community_manager/ui/sub_pages/manage_func.dart';
import 'package:aku_new_community_manager/ui/tool_pages/warning/warning_page.dart';

// Flutter imports:
import 'package:aku_new_community_manager/ui/widgets/common/aku_button.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/utils/extension/list_extension.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
import 'package:amap_flutter_base/amap_flutter_base.dart';
import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:velocity_x/src/extensions/num_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/container.dart';
import 'package:velocity_x/src/flutter/gesture.dart';
import 'package:velocity_x/src/flutter/padding.dart';
import 'package:velocity_x/src/flutter/widgets.dart';

class InspectionManageDetailsPage extends StatefulWidget {
  final int executeId;

  InspectionManageDetailsPage({
    Key? key,
    required this.executeId,
  }) : super(key: key);

  @override
  _InspectionManageDetailsPageState createState() =>
      _InspectionManageDetailsPageState();
}

class _InspectionManageDetailsPageState
    extends State<InspectionManageDetailsPage> {
  TextStyle _textstyle =
      TextStyle(color: AppStyle.minorTextColor, fontSize: 28.sp);
  Map<int, String> _inspectionStatus = {1: '?????????', 2: '?????????', 3: '?????????', 4: '?????????'};

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

  AMapController? _aMapController;
  Timer? _timer;
  bool _canUploadLocation = false;

  InspectionDetailModel? _detailModel;
  late List<InspectionPointModel> _pointModels;
  bool _onload = true;
  EasyRefreshController? _refreshController;
  bool _exit = false;
  List<LatLng> _points = [];
  List<Polyline> _polylines = [];

  @override
  void initState() {
    super.initState();
    _refreshController = EasyRefreshController();

    PermissonUtil.getLocationPermisson();
  }

  @override
  void dispose() {
    _refreshController?.dispose();
    _aMapController?.disponse();
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  Widget _emptyWidget() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await showCupertinoDialog(
            context: context,
            builder: (context) {
              return exitDialog();
            });
        return _exit;
      },
      child: AkuScaffold(
          title: '????????????',
          body: EasyRefresh(
            controller: _refreshController,
            firstRefresh: true,
            header: MaterialHeader(
                valueColor: AlwaysStoppedAnimation(kPrimaryColor)),
            onRefresh: () async {
              _detailModel =
                  await ManageFunc.getInspectionDetail(widget.executeId);
              _pointModels = await (_detailModel!.status == 1
                  ? ManageFunc.getInspectionPointByPlanId(
                      planId: _detailModel!.inspectionPlanId!)
                  : ManageFunc.getInspectionPointByExcuteId(
                      excuteId: widget.executeId));
              _onload = false;
              setState(() {});
            },
            child: _onload
                ? _emptyWidget()
                : Column(
                    children: [
                      _inspectionHeadCard(),
                      16.w.heightBox,
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.w, vertical: 24.w),
                        decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
                        width: double.infinity,
                        constraints: BoxConstraints(
                          minHeight: 85.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            '????????????'.text.black.size(32.sp).bold.make(),
                            ..._pointModels
                                .map((e) => _buildInspectionTile(
                                    e, _pointModels.indexOf(e)))
                                .toList(),
                          ].sepWidget(separate: 16.w.heightBox),
                        ),
                      ),
                      16.w.heightBox,
                      _locationWidget(),
                    ],
                  ),
          ),
          bottom: (!_onload) &&
                  (_detailModel!.status != 2) &&
                  (_detailModel!.status != 4)
              ? AkuButton(
                  onPressed: _detailModel!.status == 1
                      ? () async {
                          BaseModel _baseModel = await NetUtil().get(
                              SAASAPI.inspection.startInspection,
                              params: {"executeId": widget.executeId});
                          if (_baseModel.success) {
                            BotToast.showText(text: _baseModel.msg);
                            _refreshController!.callRefresh();
                            _startTimer(5000);
                          } else {
                            BotToast.showText(text: _baseModel.msg);
                          }
                        }
                      : () async {
                          Barcode result =
                              await (Get.to(() => QrScannerPage()));
                          BaseModel baseModel =
                              await ManageFunc.getInspectionFindCheckDetailByQr(
                                  _detailModel!.id!, result.code);
                          if (baseModel.success) {
                            await Get.to(() => InspectionPointInputPage(
                                  inspectionName: _detailModel!.name,
                                  qrModel: InspectionQRCodeModel.fromJson(
                                      baseModel.data),
                                ));
                            _refreshController?.callRefresh();
                          } else {
                            showCupertinoDialog(
                                context: context,
                                builder: (context) {
                                  return _errorDialog();
                                });
                          }
                        },
                  padding: EdgeInsets.symmetric(vertical: 26.w),
                  color: kPrimaryColor,
                  child: (_detailModel!.status == 1 ? '????????????' : '????????????')
                      .text
                      .black
                      .bold
                      .size(32.sp)
                      .make(),
                ).pOnly(bottom: MediaQuery.of(context).padding.bottom)
              : SizedBox()),
    );
  }

  Widget exitDialog() {
    return CupertinoAlertDialog(
      content:
          '?????????????????????????????????????????????????????????'.text.size(30.sp).black.bold.isIntrinsic.make(),
      actions: [
        CupertinoDialogAction(
          child: '??????'.text.size(28.sp).black.isIntrinsic.bold.make(),
          onPressed: () {
            _exit = true;
            _stopTimer();
            Get.back();
          },
        ),
        CupertinoDialogAction(
          child: '??????'.text.size(28.sp).black.light.isIntrinsic.bold.make(),
          onPressed: () {
            _exit = false;
            Get.back();
          },
        )
      ],
    );
  }

  Widget _errorDialog() {
    return CupertinoAlertDialog(
      title: '????????????'
          .text
          .isIntrinsic
          .color(kTextPrimaryColor)
          .bold
          .size(36.sp)
          .make(),
      content: '?????????????????????????????????'
          .text
          .isIntrinsic
          .color(kTextPrimaryColor)
          .size(30.sp)
          .make(),
      actions: [
        CupertinoDialogAction(
            onPressed: () {
              Get.back();
            },
            child: '??????'
                .text
                .isIntrinsic
                .color(Color(0xFFFF4501))
                .bold
                .size(36.sp)
                .make())
      ],
    );
  }

  _startTimer(int milliseconds) {
    _timer = Timer.periodic(Duration(milliseconds: milliseconds), (event) {
      _canUploadLocation = true;
    });
  }

  _stopTimer() {
    _canUploadLocation = false;
    _timer?.cancel();
    _timer = null;
    _points.clear();
    _polylines.clear();
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
                    '????????????',
                    style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontSize: 36.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  _inspectionStatus[_detailModel!.status!]!
                      .text
                      .color(_inspectionColor(_detailModel!.status))
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
                  R.ASSETS_INSPECTION_IC_INSPECTION_NAME_PNG,
                  width: 40.w,
                  height: 40.w,
                ),
                4.w.widthBox,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '????????????',
                      style: _textstyle,
                    ),
                  ],
                ),
                36.w.widthBox,
                Text(
                  _detailModel!.name!,
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
                  '????????????',
                  style: _textstyle,
                ),
                Spacer(),
                Text(
                  _detailModel!.code!,
                  style: AppStyle().primaryStyle,
                )
              ],
            ),
            12.w.heightBox,
            Row(
              children: [
                Image.asset(
                  R.ASSETS_MANAGE_IC_TIME_PNG,
                  width: 40.w,
                  height: 40.w,
                ),
                4.w.widthBox,
                Text('????????????', style: _textstyle),
                Spacer(),
                Text(
                  '${DateUtil.formatDateStr(_detailModel!.beginDate!, format: "yyyy-MM-dd HH:mm")}${_detailModel?.endDate == null ? '' : '???'}${_detailModel?.endDate == null ? '' : DateUtil.formatDateStr(_detailModel!.endDate!, format: "HH:mm")}',
                  style: AppStyle().primaryStyle,
                ),
              ],
            ),
            12.w.heightBox,
            ..._detailModel?.actualBeginDate == null
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
                          '??????????????????',
                          style: _textstyle,
                        ),
                        Spacer(),
                        Text(
                          '${DateUtil.formatDateStr(_detailModel!.actualBeginDate!, format: "yyyy-MM-dd HH:mm")}',
                          style: AppStyle().primaryStyle,
                        ),
                      ],
                    ),
                    12.w.heightBox,
                  ],
            _detailModel?.actualEndDate == null
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
                        '??????????????????',
                        style: _textstyle,
                      ),
                      Spacer(),
                      Text(
                        '${DateUtil.formatDateStr(_detailModel!.actualEndDate!, format: "yyyy-MM-dd HH:mm")}',
                        style: AppStyle().primaryStyle,
                      ),
                    ],
                  )
          ]),
        ),
      ],
    );
  }

  Widget _buildInspectionTile(InspectionPointModel model, int index) {
    return Row(
      children: [
        CircleAvatar(
          child: '???${index + 1}'
              .text
              .color(model.completeDate == null
                  ? Color(0xFF3F8FFE)
                  : Color(0xFFA6CBFF))
              .size(28.sp)
              .bold
              .make(),
          radius: 48.w,
          backgroundColor: Color(0xFFE9F2FF),
        ),
        24.w.widthBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            model.name!.text
                .color(model.completeDate == null
                    ? kTextPrimaryColor
                    : kTextSubColor)
                .size(28.sp)
                .bold
                .make(),
            '${model.checkNum}?????????'.text.color(kTextSubColor).size(24.sp).make()
          ],
        ),
        Spacer(),
        (model.completeDate == null ? '?????????' : '?????????')
            .text
            .size(24.sp)
            .bold
            .color(model.completeDate == null
                ? Color(0xFFFF4501)
                : Color(0xFF52C41A))
            .make(),
        14.w.widthBox,
        Icon(
          CupertinoIcons.chevron_right,
          size: 28.w,
          color: Color(0xFF999999),
        ),
      ],
    )
        .box
        .color(Color(0xFFF9F9F9))
        .withRounded(value: 4.w)
        .padding(EdgeInsets.all(24.w))
        .make()
        .onInkTap(() {
      Get.to(() => InspectionPointDetailPage(
            hasScan: model.completeDate == null ? false : true,
            executePointId: model.id!,
            executeName: _detailModel!.name,
            status: _detailModel!.status!,
          ));
    });
  }

  Widget _locationWidget() {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        '????????????'.text.color(Color(0xFF333333)).size(32.sp).bold.make(),
        16.w.heightBox,
        SizedBox(
          width: 750.w,
          height: 343.w,
          child: AMapWidget(
            apiKey: AMapApiKey(androidKey: '0c11d9ba47089d971dc4d889b66593ab'),
            privacyStatement: AMapPrivacyStatement(
                hasContains: true, hasShow: true, hasAgree: true),
            rotateGesturesEnabled: false,
            scaleEnabled: false,
            scrollGesturesEnabled: false,
            tiltGesturesEnabled: false,
            zoomGesturesEnabled: false,
            onMapCreated: (controller) {
              _aMapController = controller;
              LatLng _target = LatLng(
                  appProvider.location!['latitude'] as double,
                  appProvider.location!['longitude'] as double);
              _aMapController!.moveCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(target: _target, zoom: 19)));
            },
            myLocationStyleOptions: MyLocationStyleOptions(true,
                circleFillColor: Colors.yellow.withOpacity(0.1),
                circleStrokeColor: Colors.transparent,
                icon: BitmapDescriptor.defaultMarkerWithHue(210)),
            onLocationChanged: (argument) async {
              _aMapController!.moveCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(target: argument.latLng, zoom: 19)));
              if (_canUploadLocation) {
                BaseModel baseModel = await (_uploadLocation(widget.executeId,
                    argument.latLng.longitude, argument.latLng.latitude));
                if (!baseModel.success) {
                  // BotToast.showText(text: baseModel.msg);
                } else {
                  _canUploadLocation = false;
                  //????????????
                  _points.add(argument.latLng);
                  if (_points.length % 5 == 0) {
                    if (_polylines.isEmpty) {
                      _polylines.add(Polyline(
                        points: _points,
                        color: Colors.red,
                        width: 10.w,
                      ));
                      setState(() {});
                    } else {
                      _polylines[0] = (Polyline(
                        points: _points,
                        color: Colors.red,
                        width: 10.w,
                      ));
                      setState(() {});
                    }
                  }
                }
              }
            },
            // ????????????
            polylines: Set<Polyline>.of(_polylines),
          ),
        ),
      ],
    )
        .box
        .width(double.infinity)
        .color(Colors.white)
        .padding(EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w))
        .make();
  }

  // void _creatPolyline() {
  //   final Polyline _polyline = Polyline(
  //     points: _points,
  //     color: Colors.red,
  //     width: 5.w,
  //   );
  //   setState(() {
  //     _polylines.add(_polyline);
  //   });
  // }

  Future _uploadLocation(
      int executeId, double longitude, double latitude) async {
    BaseModel baseModel = await NetUtil().post(
        SAASAPI.inspection.uploadLocation,
        params: {
          "executeId": executeId,
          "longitude": longitude,
          "latitude": latitude
        },
        showMessage: false);
    return baseModel;
  }
}
