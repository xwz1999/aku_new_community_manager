import 'package:aku_new_community_manager/ui/widgets/common/bee_long_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/src/extensions/num_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';

class CancelDialog extends StatelessWidget {
  final VoidCallback onCancel;

  const CancelDialog({
    Key? key,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        children: [
          120.w.heightBox,
          '确认要取消工单？'.text.size(36.sp).black.bold.isIntrinsic.make(),
          40.w.heightBox,
          '确认后，工单会马上取消，\n且服务人员的工作会立即结束'
              .text
              .align(TextAlign.center)
              .size(28.sp)
              .isIntrinsic
              .make(),
          150.w.heightBox,
          BeeLongButton(onPressed: onCancel, text: '确认提醒')
        ],
      ),
    );
  }
}
