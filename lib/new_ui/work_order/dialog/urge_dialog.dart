import 'package:aku_new_community_manager/ui/widgets/common/bee_long_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class UrgeDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final String title;
  final String content;

  const UrgeDialog({
    Key? key,
    required this.onConfirm,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        children: [
          120.w.heightBox,
          title.text.size(36.sp).black.bold.isIntrinsic.make(),
          40.w.heightBox,
          content.text.size(28.sp).isIntrinsic.make(),
          150.w.heightBox,
          BeeLongButton(onPressed: onConfirm, text: '确认提醒')
        ],
      ),
    );
  }
}
