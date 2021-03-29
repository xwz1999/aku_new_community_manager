// Flutter imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/inspection/inspection_detail_model.dart';
import 'package:aku_community_manager/models/manager/inspection/inspection_point_model.dart';
import 'package:aku_community_manager/ui/manage_pages/inspection_manage/inspection_point_input_page.dart';
import 'package:aku_community_manager/ui/manage_pages/inspection_manage/qr_code_parase.dart';
import 'package:aku_community_manager/ui/manage_pages/inspection_manage/qr_scanner_page.dart';
import 'package:aku_community_manager/ui/sub_pages/manage_func.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:aku_ui/aku_ui.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:aku_community_manager/utils/extension/list_extension.dart';
import 'package:aku_community_manager/style/app_style.dart';
// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

class InspectionManageDetailsPage extends StatefulWidget {
  final int executeId;
  InspectionManageDetailsPage({
    Key key,
    @required this.executeId,
  }) : super(key: key);

  @override
  _InspectionManageDetailsPageState createState() =>
      _InspectionManageDetailsPageState();
}

class _InspectionManageDetailsPageState
    extends State<InspectionManageDetailsPage> {
  TextStyle _textstyle =
      TextStyle(color: AppStyle.minorTextColor, fontSize: 28.sp);
  Map<int, String> _inspectionStatus = {1: '待巡检', 2: '已巡检', 3: '巡检中', 4: '未巡检'};
  Color _inspectionColor(int status) {
    switch (status) {
      case 1:
        return Color(0xFFFF4501);
        break;
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

  InspectionDetailModel _detailModel;
  List<InspectionPointModel> _pointModels;
  bool _onload = true;
  EasyRefreshController _refreshController;
  @override
  void initState() {
    super.initState();
    _refreshController = EasyRefreshController();
  }

  @override
  void dispose() {
    _refreshController?.dispose();
    super.dispose();
  }

  Widget _emptyWidget() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
        title: '巡检详情',
        body: EasyRefresh(
          controller: _refreshController,
          firstRefresh: true,
          header:
              MaterialHeader(valueColor: AlwaysStoppedAnimation(kPrimaryColor)),
          onRefresh: () async {
            _detailModel =
                await ManageFunc.getInspectionDetail(widget.executeId);
            _pointModels = await (_detailModel.status == 1
                ? ManageFunc.getInspectionPointByPlanId(
                    planId: _detailModel.inspectionPlanId)
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
                          '巡检站点'.text.black.size(32.sp).bold.make(),
                          ..._pointModels
                                  ?.map((e) => _buildInspectionTile(
                                      e.name, e.checkNum, e.id))
                                  ?.toList() ??
                              []
                        ].sepWidget(separate: 16.w.heightBox),
                      ),
                    )
                  ],
                ),
        ),
        bottom: (!_onload) &&
                (_detailModel.status != 2) &&
                (_detailModel.status != 4)
            ? AkuButton(
                onPressed: _detailModel.status == 1
                    ? () async {
                        BaseModel _baseModel = await NetUtil().get(
                            API.manage.inspectionStart,
                            params: {"executeId": widget.executeId});
                        if (_baseModel.status) {
                          setState(() {});
                        } else {
                          BotToast.showText(text: _baseModel.message);
                        }
                      }
                    : () async {
                        Barcode result = await Get.to(() => QrScannerPage());
                        BaseModel baseModel =
                            await ManageFunc.getInspectionFindCheckDetailByQr(
                                _detailModel.id,
                                QRCodeParase.getExecutePointId(result.code));
                        if (baseModel.status) {
                          Get.to(() => InspectionPointInputPage());
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
                child: (_detailModel.status == 1 ? '开始巡检' : '立即扫码')
                    .text
                    .black
                    .bold
                    .size(32.sp)
                    .make(),
              ).pOnly(bottom: MediaQuery.of(context).padding.bottom)
            : SizedBox());
  }

  Widget _errorDialog() {
    return CupertinoAlertDialog(
      title: '扫码异常'
          .text
          .isIntrinsic
          .color(kTextPrimaryColor)
          .bold
          .size(36.sp)
          .make(),
      content: '请扫描此次巡检点二维码'
          .text
          .isIntrinsic
          .color(kTextPrimaryColor)
          .size(30.sp)
          .make(),
      actions: [
        CupertinoDialogAction(
            child: '确定'
                .text
                .isIntrinsic
                .color(Color(0xFFFF4501))
                .bold
                .size(36.sp)
                .make())
      ],
    );
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
                    '${_detailModel.name}',
                    style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontSize: 36.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  _inspectionStatus[_detailModel.status]
                      .text
                      .color(_inspectionColor(_detailModel.status))
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
                      style: _textstyle,
                    ),
                  ],
                ),
                36.w.widthBox,
                Text(
                  _detailModel.name,
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
                  style: _textstyle,
                ),
                Spacer(),
                Text(
                  _detailModel.code,
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
                Text('规定巡检时间', style: _textstyle),
                Spacer(),
                Text(
                  '${DateUtil.formatDateStr(_detailModel.beginDate, format: "yyyy-MM-dd HH:mm")}${_detailModel?.endDate == null ? '' : '～'}${_detailModel?.endDate == null ? '' : DateUtil.formatDateStr(_detailModel.endDate, format: "HH:mm")}',
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
                          '开始巡检时间',
                          style: _textstyle,
                        ),
                        Spacer(),
                        Text(
                          '${DateUtil.formatDateStr(_detailModel.actualBeginDate, format: "yyyy-MM-dd HH:mm")}',
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
                        '${DateUtil.formatDateStr(_detailModel.actualEndDate, format: "yyyy-MM-dd HH:mm")}',
                        style: AppStyle().primaryStyle,
                      ),
                    ],
                  )
          ]),
        ),
      ],
    );
  }

  Widget _buildInspectionTile(
    String inspectionStation,
    int inspectionCount,
    int index,
  ) {
    return Row(
      children: [
        CircleAvatar(
          child:
              '巡$index'.text.color(Color(0xFF3F8FFE)).size(28.sp).bold.make(),
          radius: 48.w,
          backgroundColor: Color(0xFFE9F2FF),
        ),
        24.w.widthBox,
        Column(
          children: [
            inspectionStation.text.black.size(28.sp).bold.make(),
            '$inspectionCount项检查'.text.color(kTextSubColor).size(24.sp).make()
          ],
        ),
        Spacer(),
        _inspectionStatus[_detailModel.status]
            .text
            .size(24.sp)
            .bold
            .color(_inspectionColor(_detailModel.status))
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
        .onInkTap(() {});
  }
}
// Widget _inspectionPersons(){
//   return Container(
//         width: double.infinity,
//         color: Color(0xFFFFFFFF),
//         margin: EdgeInsets.only(top: 16.w),
//         padding: EdgeInsets.only(
//             top: 24.w, left: 32.w, right: 86.w, bottom: 40.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               '巡检人员',
//               style: TextStyle(
//                   color: AppStyle.primaryTextColor,
//                   fontSize: 32.sp,
//                   fontWeight: FontWeight.bold),
//             ),
//             AkuBox.h(16),
//             GridView(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   childAspectRatio: 250 / 40,
//                   mainAxisSpacing: 16.w),
//               children: widget.cardModel.persons
//                   .map((e) => _person(widget.cardModel.persons.indexOf(e)))
//                   .toList(),
//             ),
//           ],
//         ),
//       ),
//       AkuBox.h(16),
//       Container(
//         color: Color(0xFFFFFFFF),
//         padding: EdgeInsets.only(top: 24.w, left: 32.w, right: 32.w),
//         width: double.infinity,
//         child:
//             Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Text('巡检站点',
//               style: TextStyle(
//                   color: AppStyle.primaryTextColor,
//                   fontSize: 32.sp,
//                   fontWeight: FontWeight.bold)),
//           AkuBox.h(16),
//           Wrap(
//             runSpacing: 16.w,
//             children: widget.cardModel.stations
//                 .map((e) => _station(widget.cardModel.stations.indexOf(e)))
//                 .toList(),
//           ),
//           AkuBox.h(24),
//           Image.asset(
//             R.ASSETS_INSPECTION_INSPECTION_STATION_PNG,
//             width: 686.w,
//             height: 343.w,
//           ),
//         ]),
//       );

// Widget _station(index) {
//   return Row(
//     mainAxisSize: MainAxisSize.min,
//     children: [
//       Container(
//         padding:
//             EdgeInsets.only(top: 16.w, left: 24.w, bottom: 15.w, right: 24.w),
//         color: Color(0xFFF9F9F9),
//         height: 64.w,
//         alignment: Alignment.center,
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               widget.cardModel.stations[index],
//               style: TextStyle(
//                   color: AppStyle.primaryTextColor, fontSize: 24.sp),
//             ),
//           ],
//         ),
//       ),
//       AkuBox.w(8),
//       (widget.cardModel.stations.length - 1) != index
//           ? Container(
//               width: 56.w,
//               height: 3.w,
//               color: Color(0xFFE8E8E8),
//             )
//           : SizedBox(),
//     ],
//   );
// }

// Widget _person(index) {
//   return Container(
//     height: 40.w,
//     child: Row(mainAxisSize: MainAxisSize.min, children: [
//       Image.asset(
//         R.ASSETS_MESSAGE_IC_PEOPLE_PNG,
//         width: 40.w,
//         height: 40.w,
//       ),
//       AkuBox.w(8),
//       Text(
//         widget.cardModel.persons[index],
//         style: TextStyle(
//           color: AppStyle.primaryTextColor,
//           fontSize: 28.sp,
//         ),
//       ),
//     ]),
//   );
// }
