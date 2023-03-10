import 'package:aku_new_community_manager/const/saas_api.dart';
import 'package:aku_new_community_manager/gen/assets.gen.dart';
import 'package:aku_new_community_manager/new_ui/work_order/dialog/urge_dialog.dart';
import 'package:aku_new_community_manager/saas_models/work_order/work_order_detail_model.dart';
import 'package:aku_new_community_manager/ui/widgets/app_widgets/bee_grid_image_view.dart';
import 'package:aku_new_community_manager/ui/widgets/app_widgets/bee_image_network.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/common/bee_divider.dart';
import 'package:aku_new_community_manager/ui/widgets/common/bee_long_button.dart';
import 'package:aku_new_community_manager/ui/widgets/common/bottom_plural_button_widget.dart';
import 'package:aku_new_community_manager/ui/widgets/common/stack_avatar.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/src/extensions/num_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';

import '../finish_report_page.dart';
import '../history_report_page.dart';
import '../report_progress.dart';
import '../team_list_page.dart';
import '../work_order_func.dart';
import '../work_order_map.dart';

class ReceiverDetailPage extends StatefulWidget {
  final int id;

  const ReceiverDetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _ReceiverDetailPageState createState() => _ReceiverDetailPageState();
}

class _ReceiverDetailPageState extends State<ReceiverDetailPage> {
  WorkOrderDetailModel? _model;
  EasyRefreshController _refreshController = EasyRefreshController();

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '',
      appBarColor: Colors.transparent,
      extendBody: true,
      body: Stack(
        children: [
          _model == null
              ? Container()
              : Container(
                  width: double.infinity,
                  height: 380.w,
                  decoration: BoxDecoration(
                    gradient: _getLiner,
                  ),
                  child: Column(
                    children: [
                      150.w.heightBox,
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await WorkOrderFuc.getProgress(
                                        workOrderId: widget.id);
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        '${WorkOrderMap.orderStatus[_model?.status] ?? ''}'
                                            .text
                                            .size(40.sp)
                                            .color(Colors.black)
                                            .bold
                                            .make(),
                                        16.w.widthBox,
                                        Icon(
                                          CupertinoIcons.chevron_right,
                                          size: 32.w,
                                          color: Colors.black.withOpacity(0.65),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                '${WorkOrderMap.subStatusString[_model?.status] ?? ''}'
                                    .text
                                    .size(24.sp)
                                    .color(Colors.black.withOpacity(0.45))
                                    .make(),
                              ],
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
          SafeArea(
              child: Padding(
            padding: EdgeInsets.only(top: 140.w),
            child: EasyRefresh(
              firstRefresh: true,
              header: MaterialHeader(),
              controller: _refreshController,
              onRefresh: () async {
                var base = await NetUtil().get(SAASAPI.workOrder.findById,
                    params: {'workOrderId': widget.id});
                if (base.success) {
                  _model = WorkOrderDetailModel.fromJson(base.data);
                  setState(() {});
                }
              },
              child: _model == null
                  ? Container()
                  : ListView(
                      padding: EdgeInsets.only(left: 32.w, right: 32.w),
                      children: [
                        Offstage(
                            offstage: _model!.status < 5,
                            child: Column(
                              children: [
                                _historyReport(),
                                24.w.heightBox,
                              ],
                            )),
                        Offstage(
                            offstage: _model!.servicePersonnelImgList == null ||
                                _model!.servicePersonnelImgList!.isEmpty,
                            child: Column(
                              children: [
                                _servicePeople(),
                                24.w.heightBox,
                              ],
                            )),
                        _head(),
                        24.w.heightBox,
                        _content(),
                        24.w.heightBox,
                        _taskInfo(),
                      ],
                    ),
            ),
          )),
        ],
      ),
      bottom: Padding(
          padding: EdgeInsets.only(
              left: 32.w,
              right: 32.w,
              bottom: MediaQuery.of(context).padding.bottom + 32.w),
          child: _getBottomButton()),
    );
  }

  LinearGradient get _getLiner {
    switch (_model?.status) {
      case 7:
      case 8:
        return LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFA5A5A6).withOpacity(0),
              Color(0xFFE0DDDE),
            ]);
      case 9:
        return LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFFF0000).withOpacity(0),
              Color(0xFFFC5757),
            ]);
      default:
        return LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFFFD589).withOpacity(0),
              Color(0xFFFAC058),
            ]);
    }
  }

  Widget _getBottomButton() {
    switch (_model?.status) {
      case 2:
        return BeeLongButton(
            onPressed: () async {
              var re = await WorkOrderFuc.receiveTask(widget.id);
              if (re) {
                _refreshController.callRefresh();
              }
            },
            text: '????????????');
      case 3:
        return BeeLongButton(
            onPressed: () async {
              Get.bottomSheet(UrgeDialog(
                  onConfirm: () async {
                    var re = await WorkOrderFuc.startService(widget.id);
                    if (re) {
                      _refreshController.callRefresh();
                    }
                  },
                  title: '?????????????????????',
                  content: '????????????????????????????????????\n???????????????????????????????????????????????????'));
            },
            text: '????????????');

      case 4:
        return BottomPluralButtonWidget(
            onLeftTap: () {
              Get.to(() => ReportProgress(id: widget.id,));
            },
            onRightTap: () {
              Get.to(() => FinishReportPage(id:widget.id));
            },
            leftTitle: '????????????',
            rightTitle: '????????????');

      case 5:
        return BeeLongButton(
            onPressed: () async {
              var re = await WorkOrderFuc.reminderConfirm(widget.id);
              if (re) {
                _refreshController.callRefresh();
              }
            },
            text: '??????????????????');
      case 6:
        return BeeLongButton(
            onPressed: () async {
              WorkOrderFuc.getBill(
                workOrderId: widget.id,
                onConfirm: () async {
                  var re = await WorkOrderFuc.reminderPay(widget.id);
                  if (re) {
                    _refreshController.callRefresh();
                  }
                  Get.back();
                },
              );
            },
            text: '??????????????????');
      case 7:

      case 8:

      case 9:
        return SizedBox.shrink();
      case 10:
        return SizedBox.shrink();
      default:
        return SizedBox.shrink();
    }
  }

  Widget _historyReport() {
    return GestureDetector(
      onTap: () {
        Get.to(HistoryReportPage(id: widget.id));
      },
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16.w)),
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
          child: Row(
            children: [
              '????????????'
                  .text
                  .size(28.sp)
                  .color(Colors.black.withOpacity(0.85))
                  .make(),
              Spacer(),
              '????????????'
                  .text
                  .size(24.sp)
                  .color(Colors.black.withOpacity(0.45))
                  .make(),
              24.w.widthBox,
              Icon(
                CupertinoIcons.chevron_right,
                size: 24.w,
                color: Colors.black.withOpacity(0.45),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _servicePeople() {
    return Container(
      padding: EdgeInsets.all(24.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          '??????????????????'
              .text
              .size(28.sp)
              .color(Colors.black.withOpacity(0.85))
              .make(),
          24.w.heightBox,
          BeeDivider.horizontal(),
          24.w.heightBox,
          GestureDetector(
            onTap: () {
              Get.to(() => TeamListPage(
                    workOderId: _model!.id,
                  ));
            },
            child: Material(
              color: Colors.transparent,
              child: Row(
                children: [
                  StackAvatar(
                      avatars: (_model!.servicePersonnelImgList ?? [])
                          .map((e) => e.url)
                          .toList()),
                  Spacer(),
                  '????????????'
                      .text
                      .size(28.sp)
                      .color(Colors.black.withOpacity(0.65))
                      .make(),
                  Icon(
                    CupertinoIcons.chevron_right,
                    size: 24.w,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _head() {
    return Container(
      padding: EdgeInsets.all(24.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFBE6),
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: '${_model!.workOrderTypeName}'
                    .text
                    .size(24.sp)
                    .color(Color(0xFFD48806))
                    .make(),
              ),
              Spacer(),
              Offstage(
                offstage: _model!.status < 6,
                child: '??${_model!.totalCost}'
                    .text
                    .size(24.sp)
                    .color(Color(0xFFF5222D))
                    .make(),
              )
            ],
          ),
          16.w.heightBox,
          Row(
            children: [
              Assets.icons.alarmClock.image(width: 40.w, height: 40.w),
              24.w.widthBox,
              '${DateUtil.formatDateStr(_model!.reserveDate)}'
                  .text
                  .size(24.sp)
                  .color(Colors.black.withOpacity(0.45))
                  .make(),
            ],
          ),
          16.w.heightBox,
          Row(
            children: [
              Assets.icons.taskLocation.image(width: 40.w, height: 40.w),
              24.w.widthBox,
              '${_model!.reserveAddress}'
                  .text
                  .size(24.sp)
                  .color(Colors.black.withOpacity(0.45))
                  .make(),
            ],
          ),
          24.w.heightBox,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.w),
              border: Border.all(
                color: Colors.black.withOpacity(0.25),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                '?????????'
                    .text
                    .size(28.sp)
                    .color(Colors.black.withOpacity(0.25))
                    .make(),
                24.w.heightBox,
                Row(
                  children: [
                    ClipOval(
                      child: BeeImageNetwork(
                        width: 108.w,
                        height: 108.w,
                        imgs: _model!.applicantImgList,
                      ),
                    ),
                    16.w.widthBox,
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _model!.applicantName.text
                            .size(28.sp)
                            .color(Colors.black.withOpacity(0.85))
                            .make(),
                        8.w.heightBox,
                        '${_model!.identity == 1 ? '??????' : '??????'}???${_model!.buildingName}${_model!.unitName}${_model!.estateName}'
                            .text
                            .size(28.sp)
                            .color(Colors.black.withOpacity(0.45))
                            .make(),
                      ],
                    )),
                    GestureDetector(
                        onTap: () {
                          launch('tel:${_model!.applicantTel}');
                        },
                        child: Assets.icons.phoneCircle
                            .image(width: 65.w, height: 65.w))
                  ],
                )
              ],
            ),
          ),
          24.w.heightBox,
        ],
      ),
    );
  }

  Widget _content() {
    return Container(
      padding: EdgeInsets.all(24.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          '${_model!.content}'
              .text
              .size(28.sp)
              .color(Colors.black.withOpacity(0.65))
              .make(),
          24.w.heightBox,
          BeeGridImageView(
            urls: (_model!.imgList ?? []).map((e) => e.url).toList(),
          ),
          24.w.heightBox,
        ],
      ),
    );
  }

  Widget _taskInfo() {
    return Container(
      width: 686.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
      child: Column(
        children: [
          Row(
            children: [
              '????????????'.text.size(28.sp).color(Colors.black).bold.make(),
              Spacer(),
            ],
          ),
          24.w.heightBox,
          BeeDivider.horizontal(),
          24.w.heightBox,
          Row(
            children: [
              '????????????'
                  .text
                  .size(24.sp)
                  .color(Colors.black.withOpacity(0.45))
                  .make(),
              Spacer(),
              '${DateUtil.formatDateStr(_model!.createDate)}'
                  .text
                  .size(24.sp)
                  .color(Colors.black.withOpacity(0.45))
                  .make(),
              64.w.widthBox,
            ],
          ),
          24.w.heightBox,
          Row(
            children: [
              '????????????'
                  .text
                  .size(24.sp)
                  .color(Colors.black.withOpacity(0.45))
                  .make(),
              Spacer(),
              '${_model!.code}'
                  .text
                  .size(24.sp)
                  .color(Colors.black.withOpacity(0.45))
                  .make(),
              24.w.widthBox,
              GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(text: _model!.code));
                    BotToast.showText(text: '?????????????????????');
                  },
                  child: Assets.icons.copy.image(width: 40.w, height: 40.w)),
            ],
          )
        ],
      ),
    );
  }
}
