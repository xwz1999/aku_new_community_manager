import 'package:aku_new_community_manager/gen/assets.gen.dart';
import 'package:aku_new_community_manager/new_ui/work_order/distributor/distributor_card.dart';
import 'package:aku_new_community_manager/new_ui/work_order/distributor/distributor_detail_page.dart';
import 'package:aku_new_community_manager/new_ui/work_order/receiver/receiver_detail_page.dart';
import 'package:aku_new_community_manager/saas_models/work_order/work_order_list_model.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/ui/widgets/common/bee_hor_image_view.dart';
import 'package:aku_new_community_manager/ui/widgets/common/car_bottom_button.dart';
import 'package:aku_new_community_manager/utils/bee_date_util.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../work_order_func.dart';
import '../work_order_map.dart';

class ReceiverCard extends StatelessWidget {
  final WorkOrderListModel model;
  final VoidCallback refresh;

  const ReceiverCard({Key? key, required this.model, required this.refresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 9.35.w,
            right: 0,
            child: Container(
              width: 160.w,
              height: 60.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFFFAC058),
                      Color(0xFFFFD589),
                    ]),
                color: kPrimaryColor,
                borderRadius:
                    BorderRadius.only(topRight: Radius.circular(12.w)),
              ),
              alignment: Alignment.center,
              child: Text(
                '${WorkOrderMap.orderStatus[model.status]}',
                style: TextStyle(
                  fontSize: 26.sp,
                  color: Colors.black,
                ),
              ),
            )),
        GestureDetector(
          onTap: () {
            Get.to(() => ReceiverDetailPage(
                  id: model.id,
                ));
          },
          child: ClipPath(
            clipper: WorkOrderCardClip(),
            child: Container(
              padding: EdgeInsets.all(24.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.w),
                    bottomLeft: Radius.circular(12.w),
                    bottomRight: Radius.circular(12.w)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.w, horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFBE6),
                          borderRadius: BorderRadius.circular(8.w),
                        ),
                        child: '${model.workOrderTypeName}'
                            .text
                            .size(24.sp)
                            .color(Color(0xFFD48806))
                            .make(),
                      ),
                    ],
                  ),
                  16.w.heightBox,
                  Row(
                    children: [
                      Assets.icons.alarmClock.image(width: 40.w, height: 40.w),
                      24.w.widthBox,
                      '${model.updateDate}'
                          .text
                          .size(24.sp)
                          .color(Colors.black.withOpacity(0.45))
                          .make(),
                    ],
                  ),
                  16.w.heightBox,
                  Row(
                    children: [
                      Assets.icons.taskLocation
                          .image(width: 40.w, height: 40.w),
                      24.w.widthBox,
                      '${model.reserveAddress}'
                          .text
                          .size(24.sp)
                          .color(Colors.black.withOpacity(0.45))
                          .make(),
                    ],
                  ),
                  60.w.heightBox,
                  '${model.content}'
                      .text
                      .size(28.sp)
                      .color(Colors.black.withOpacity(0.65))
                      .make(),
                  24.w.heightBox,
                  BeeHorImageView(
                      maxCount: 4,
                      imgs: model.imgList ?? [],
                      imgWidth: 146.w,
                      imgHeight: 146.w),
                  24.w.heightBox,
                  Row(
                    children: [
                      BeeDateUtil(DateUtil.getDateTime(model.createDate))
                          .timeAgo
                          .text
                          .size(24.sp)
                          .color(Colors.black.withOpacity(0.45))
                          .make(),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getCardBottomButton() {
    switch (model.status) {
      case 1:
        return CardBottomButton.yellow(
            text: '领取任务',
            onPressed: () async {
              var re = await WorkOrderFuc.receiveTask(model.id);
              if (re) {
                refresh();
              }
            });
      case 2:
        return CardBottomButton.yellow(
            text: '开始服务',
            onPressed: () async {
              var re = await WorkOrderFuc.startService(model.id);
              if (re) {
                refresh();
              }
            });
      case 3:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CardBottomButton.yellow(text: '提交报告', onPressed: () async {}),
            CardBottomButton.yellow(
                text: '完成工单',
                onPressed: () async {
                  var re = await WorkOrderFuc.reminderProcessing(model.id);
                  if (re) {
                    refresh();
                  }
                }),
          ],
        );
      case 4:
        return CardBottomButton.yellow(
            text: '提醒确认',
            onPressed: () async {
              var re = await WorkOrderFuc.reminderConfirm(model.id);
              if (re) {
                refresh();
              }
            });
      case 5:
        return CardBottomButton.yellow(
            text: '提醒支付',
            onPressed: () async {
              var re = await WorkOrderFuc.reminderPay(model.id);
              if (re) {
                refresh();
              }
            });
      case 6:
      case 7:
      case 8:
        return CardBottomButton.yellow(text: '查看评价', onPressed: () {});
      case 9:
      case 10:
      default:
        return SizedBox.shrink();
    }
  }
}
