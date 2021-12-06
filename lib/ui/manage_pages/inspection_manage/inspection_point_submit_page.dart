// Flutter imports:
import 'package:aku_new_community_manager/ui/widgets/common/aku_button.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

// Project imports:
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';

class InspectionPointSubmitPage extends StatefulWidget {
  InspectionPointSubmitPage({Key? key}) : super(key: key);

  @override
  _InspectionPointSubmitPageState createState() =>
      _InspectionPointSubmitPageState();
}

class _InspectionPointSubmitPageState extends State<InspectionPointSubmitPage> {
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '巡检点',
      body: Center(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Image.asset(R.ASSETS_MANAGE_SUBMIT_SUCCESS_PNG,
                  width: 587.w, height: 350.w),
              '提交成功'.text.black.size(40.sp).bold.make(),
              8.w.heightBox,
              '感谢您的努力工作，为小区安全做出贡献'
                  .text
                  .color(kTextSubColor)
                  .size(26.sp)
                  .bold
                  .make(),
              80.w.heightBox,
              AkuButton(
                color: kPrimaryColor,
                child: '继续巡更'
                    .text
                    .color(kTextPrimaryColor)
                    .size(32.sp)
                    .bold
                    .make(),
                radius: 8.w,
                padding: EdgeInsets.symmetric(vertical: 22.w, horizontal: 76.w),
                onPressed: () {
                  Get.back();
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
