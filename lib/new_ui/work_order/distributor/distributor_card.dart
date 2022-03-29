import 'package:aku_new_community_manager/gen/assets.gen.dart';
import 'package:aku_new_community_manager/new_ui/work_order/distributor/distributor_detail_page.dart';
import 'package:aku_new_community_manager/saas_models/work_order/work_order_list_model.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/ui/widgets/common/bee_hor_image_view.dart';
import 'package:aku_new_community_manager/ui/widgets/common/car_bottom_button.dart';
import 'package:aku_new_community_manager/utils/bee_date_util.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/velocity_x.dart';

import '../work_order_func.dart';
import '../work_order_map.dart';

class DistributorCard extends StatelessWidget {
  final WorkOrderListModel model;
  final VoidCallback refresh;

  const DistributorCard({Key? key, required this.model, required this.refresh})
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
            Get.to(() => DistributorDetailPage(
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
        return SizedBox.shrink();
      case 2:
        return SizedBox.shrink();
      case 3:
        return CardBottomButton.yellow(
            text: '提醒处理',
            onPressed: () async {
              var re = await WorkOrderFuc.reminderProcessing(model.id);
              if (re) {
                refresh();
              }
            });
      case 4:
        return CardBottomButton.yellow(
            text: '提醒完成',
            onPressed: () async {
              var re = await WorkOrderFuc.reminderDone(model.id);
              if (re) {
                refresh();
              }
            });
      case 5:
        return CardBottomButton.yellow(
            text: '提醒确认',
            onPressed: () async {
              var re = await WorkOrderFuc.reminderConfirm(model.id);
              if (re) {
                refresh();
              }
            });
      case 6:
        return CardBottomButton.yellow(
            text: '提醒支付',
            onPressed: () async {
              var re = await WorkOrderFuc.reminderPay(model.id);
              if (re) {
                refresh();
              }
            });
      case 7:
        return CardBottomButton.yellow(text: '去评价', onPressed: () {});
      case 8:
        return CardBottomButton.yellow(text: '查看评价', onPressed: () {});
      case 9:
      case 10:
      default:
        return SizedBox.shrink();
    }
  }
}

class WorkOrderCardClip extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }

  @override
  Path getClip(Size size) {
    Path path = Path();
    //第一段圆弧起始位置的横坐标
    double asx = 531.w;
    //第一段圆弧终点位置横坐标
    double aex = 542.46.w;
    //第一段圆弧终点位置纵坐标
    double aey = 9.34.w;

    //第一段圆弧控制点位置横坐标
    double acx = 540.w;

    //第二段圆弧起始点位置横坐标
    double bsx = 558.45.w;
    //第二段圆弧起始点位置纵坐标
    double bsy = 58.88.w;
    //第二段圆弧终点点位置横坐标
    double bex = 569.91.w;
    //第二段圆弧终点位纵横坐标
    double bey = 67.35.w;
    //第二段圆弧控制点位置横坐标
    double bcx = 561.06.w;
    //第二段圆弧控制点位置纵坐标
    double bcy = 67.35.w;
    path.lineTo(asx, 0);
    path.quadraticBezierTo(acx, 0, aex, aey);
    path.lineTo(bsx, bsy);
    path.quadraticBezierTo(bcx, bcy, bex, bey);
    path.lineTo(size.width, bey);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }
}
