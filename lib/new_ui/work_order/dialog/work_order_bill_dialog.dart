import 'package:aku_new_community_manager/saas_models/work_order/work_order_bill_model.dart';
import 'package:aku_new_community_manager/ui/widgets/common/bee_divider.dart';
import 'package:aku_new_community_manager/ui/widgets/common/bee_long_button.dart';
import 'package:aku_new_community_manager/utils/extension/list_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/src/extensions/num_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';

class WorkOrderBillDialog extends StatelessWidget {
  final List<WorkOrderBillModel> models;
  final VoidCallback onConfirm;

  const WorkOrderBillDialog(
      {Key? key, required this.models, required this.onConfirm})
      : super(key: key);

  double get total {
    double sum = 0;
    for (var item in models) {
      sum = sum + item.price;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.all(30.w),
        padding: EdgeInsets.only(left: 40.w,right: 40.w,),
        height: 430.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: Column(
          children: [
            40.w.heightBox,
            '确认账单'
                .text
                .size(32.sp)
                .isIntrinsic
                .color(Colors.black.withOpacity(0.65))
                .make(),
            80.w.heightBox,
            ...models
                .map((e) => Row(
              children: [
                '${e.costType == 1 ? '人工费' : '耗材费'}${e.name}${e.costType == 1 ? '' : '*${e.number}'}'
                    .text
                    .size(28.sp)
                    .color(Colors.black.withOpacity(0.65))
                    .isIntrinsic
                    .make(),
                Spacer(),
                '¥${e.price}'
                    .text
                    .size(28.sp)
                    .color(Colors.black.withOpacity(0.65))
                    .isIntrinsic
                    .make(),
              ],
            ))
                .toList()
                .sepWidget(
              separate: 16.w.heightBox,
            ),
            10.heightBox,
            BeeDivider.horizontal(),
            10.heightBox,
            Row(
              children: [
                '工单总费用'
                    .text
                    .size(28.sp)
                    .color(Colors.black.withOpacity(0.65))
                    .isIntrinsic
                    .make(),
                Spacer(),
                '¥${total}'
                    .text
                    .size(28.sp)
                    .color(Color(0xFFF5222D))
                    .isIntrinsic
                    .make(),
              ],
            ),
            80.w.heightBox,
            BeeLongButton(onPressed: onConfirm, text: '提醒用户支付'),
          ],
        ),
      ),
    );
  }
}
