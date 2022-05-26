import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../const/saas_api.dart';
import '../../gen/assets.gen.dart';
import '../../saas_models/household_audit/household_audit_list_model.dart';
import '../../ui/widgets/common/bee_divider.dart';
import '../../ui/widgets/common/car_bottom_button.dart';
import '../../utils/network/net_util.dart';

class HouseholdAuditCard extends StatelessWidget {
  final int index;
  final HouseholdAuditListModel model;
  final VoidCallback refresh;

  HouseholdAuditCard({Key? key, required this.model, required this.refresh, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.w), color: Colors.white),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
                height: 77.w,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        //     stops: [
                        //   0.4,
                        //   0.6,
                        //   0.8
                        // ],
                        colors: [
                          Color(0xFFFFEAC3).withOpacity(0.31),
                          Color(0xFFFEE1AE).withOpacity(0.24),
                          Color(0xFFFFFFFF),
                        ])),
                child: Row(
                  children: [
                    '${model.houseName}'
                        .text
                        .size(32.sp)
                        .color(Colors.black.withOpacity(0.85))
                        .make(),
                    Spacer(),
                    '类型:${model.estateTypeName}'
                        .text
                        .size(24.sp)
                        .color(Colors.black.withOpacity(0.45))
                        .make(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                            width: 160.w,
                            child: '申请人'
                                .text
                                .size(28.sp)
                                .color(Colors.black.withOpacity(0.45))
                                .make()),
                        model.name.text
                            .size(28.sp)
                            .color(Colors.black.withOpacity(0.85))
                            .make(),
                      ],
                    ),
                    24.w.heightBox,
                    Row(
                      children: [
                        SizedBox(
                            width: 160.w,
                            child: '联系方式'
                                .text
                                .size(28.sp)
                                .color(Colors.black.withOpacity(0.45))
                                .make()),
                        model.tel.text
                            .size(28.sp)
                            .color(Colors.black.withOpacity(0.85))
                            .make(),
                      ],
                    ),
                    24.w.heightBox,
                    Row(
                      children: [
                        SizedBox(
                            width: 160.w,
                            child: '申请身份'
                                .text
                                .size(28.sp)
                                .color(Colors.black.withOpacity(0.45))
                                .make()),
                        _identity[model.identity]!
                            .text
                            .size(28.sp)
                            .color(Colors.black.withOpacity(0.85))
                            .make(),
                      ],
                    ),
                  ],
                ),
              ),
              Offstage(
                offstage: model.status != 1,
                child: Column(
                  children: [
                    BeeDivider.horizontal(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.w, vertical: 24.w),
                      child: Row(
                        children: [
                          Spacer(),
                          CardBottomButton.yellow(
                              text: '通过',
                              onPressed: () async {
                                var base = await NetUtil().post(
                                    SAASAPI.householdAudit.review,
                                    params: {
                                      'operate': 1,
                                      'estateReviewId': model.estateReviewId
                                    });
                                if (base.success) {
                                  refresh();
                                }
                              }),
                          24.w.widthBox,
                          CardBottomButton.white(
                              text: '驳回',
                              onPressed: () async {
                                var base = await NetUtil().post(
                                    SAASAPI.householdAudit.review,
                                    params: {
                                      'operate': 2,
                                      'estateReviewId': model.estateReviewId
                                    });
                                if (base.success) {
                                  refresh();
                                }
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 24.w,
          bottom: 24.w,
          child: Offstage(
            offstage: model.status == 1,
            child: Image.asset(
              model.status == 2
                  ? Assets.manage.rejected.path
                  : Assets.manage.passed.path,
              width: 160.w,
              height: 160.w,
            ),
          ),
        ),
      ],
    );
  }
  Map<int, String> _identity = {1: '业主', 2: '业主亲属', 3: '租户', 4: '租户亲属'};
}
