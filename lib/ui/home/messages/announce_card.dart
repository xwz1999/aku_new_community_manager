import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:common_utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../models/message/notice_model.dart';
import 'announce_view.dart';

class AnnounceCard extends StatelessWidget {
  final ListDateModel modelList;
  final int index;
  final bool visible;

  const AnnounceCard({
    Key? key,
    required this.modelList,
    required this.index,
    required this.visible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        !visible
            ? SizedBox()
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 98.w,
                child: '${modelList.year}年${modelList.month}月'
                    .text
                    .size(36.sp)
                    .black
                    .make(),
              ),
        ...modelList.models
            .map((e) => _card(e))
            .toList()

      ],
    );
  }

  Widget _card(NoticeModel model) {
    return InkWell(
      onTap: () {
        //Get.to(() => NoticeDetailPage(id: model.id));
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.w),
        margin: EdgeInsets.only(bottom: 16 .w),
        child: Column(



          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            '${DateUtil.formatDateStr(model.sendDate, format: 'dd日 HH:mm')}'
                .text
                .size(28.sp)
                .color(Colors.black.withOpacity(0.25))
                .make(),
            32.w.heightBox,
            // Container(
            //   width: double.infinity,
            //   height: 258.w,
            //   clipBehavior: Clip.antiAliasWithSaveLayer,
            //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.w)),
            //   child: BeeImageNetwork(
            //     imgs: model.imgList,
            //   ),
            // ),
            // 32.w.heightBox,

            '${model.title}'.text.size(36.sp).black.bold.make(),
            32.w.heightBox,
            '${model.content}'.text.maxLines(2).ellipsis.size(28.sp).color(Colors.black.withOpacity(0.25)).make(),
            40.w.heightBox,
            Container(
              height: 72.w,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xFF000000).withOpacity(0.06),
                  ),
                ),
              ),
              child: Row(
                children: [
                  '查看详情'.text.size(24.w).color(Colors.black.withOpacity(0.25)).make(),
                  Spacer(),
                  Icon(
                    CupertinoIcons.chevron_right,
                    size: 20.w,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
