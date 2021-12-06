// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

// Project imports:
import 'package:aku_new_community_manager/const/resource.dart';
import 'package:aku_new_community_manager/models/manager/bussiness_and_fix/bussiness_and_fix_model.dart';
import 'package:aku_new_community_manager/ui/sub_pages/business_and_fix/business_fix_card.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';

class FixSubmitFinishPage extends StatelessWidget {
  final BussinessAndFixModel model;
  const FixSubmitFinishPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '处理完成',
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Image.asset(R.ASSETS_MANAGE_SUBMIT_SUCCESS_PNG,
                width: 587.w, height: 350.w),
            '您已处理完成该报修'.text.black.size(40.sp).bold.make(),
            120.w.heightBox,
            BusinessFixCard(
              hasFinished: true,
              model: this.model,
              canSeeBottomButton: false,
            ),
          ],
        ),
      ),
    );
  }
}
