import 'package:aku_community_manager/models/manager/facilities/facilities_inspect_report_page.dart';
import 'package:aku_community_manager/models/manager/facilities/facilities_map.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/aku_divider.dart';
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class FacilitiesCard extends StatefulWidget {
  final int index;
  FacilitiesCard({Key key, this.index}) : super(key: key);

  @override
  _FacilitiesCardState createState() => _FacilitiesCardState();
}

class _FacilitiesCardState extends State<FacilitiesCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            '户外2号篮球场'.text.color(kTextPrimaryColor).size(32.sp).bold.make(),
            Spacer(),
            FacilitiesMap.inspectStatus[widget.index + 1].text
                .color(FacilitiesMap.insepectColor[widget.index + 1])
                .size(28.sp)
                .bold
                .make(),
          ],
        ),
        16.w.heightBox,
        AkuDivider.horizontal(),
        24.w.heightBox,
        _buildTile(R.ASSETS_MANAGE_ADDRESS_PNG, '场地地址', '1号楼4单元门口'),
        ..._midTile(),
        ...widget.index != 0
            ? []
            : [
                40.w.heightBox,
                Row(
                  children: [
                    Spacer(),
                    AkuMaterialButton(
                        radius: 74.w,
                        height: 52.w,
                        padding: EdgeInsets.symmetric(
                            vertical: 8.w, horizontal: 24.w),
                        color: Color(0xFFFFC40C),
                        onPressed: () {
                          Get.to(() => FacilitiesInspectReportPage());
                        },
                        child: '扫码报告'
                            .text
                            .size(26.sp)
                            .color(kTextPrimaryColor)
                            .bold
                            .make())
                  ],
                ),
              ],
      ],
    )
        .box
        .width(double.infinity)
        .withRounded(value: 8.w)
        .color(Colors.white)
        .padding(EdgeInsets.all(24.w))
        .make()
        .onInkTap(() {
      Get.to(() => FacilitiesInspectReportPage());
    });
  }

  _midTile() {
    switch (widget.index) {
      case 0:
        return [
          15.w.heightBox,
          _buildTile(
              R.ASSETS_MANAGE_CLOCK_PNG, '任务时间', '2020-10-1 19:00-20:300'),
        ];
      case 1:
        return [
          15.w.heightBox,
          _buildTile(R.ASSETS_MANAGE_CLOCK_PNG, '未完成原因', '超时',
              color: Colors.red),
          15.w.heightBox,
          _buildTile(
              R.ASSETS_MANAGE_CLOCK_PNG, '规定任务时间', '2020-10-1 19:00-20:300'),
        ];
      case 2:
        return [
          15.w.heightBox,
          _buildTile(R.ASSETS_MANAGE_CLOCK_PNG, '场地情况', '正常',
              color: Color(0xFF3F8FFE)),
          15.w.heightBox,
          _buildTile(
              R.ASSETS_MANAGE_CLOCK_PNG, '规定任务时间', '2020-10-1 19:00-20:300'),
          15.w.heightBox,
          _buildTile(R.ASSETS_MANAGE_CLOCK_PNG, '检查提交时间', '2020-10-1 19:00'),
        ];
      default:
        return [];
    }
  }

  Widget _buildTile(String icon, String title, String text,
      {Color color = kTextSubColor}) {
    return Row(
      children: [
        Image.asset(
          icon,
          width: 40.w,
          height: 40.w,
        ),
        20.w.widthBox,
        title.text.size(24.sp).color(kTextSubColor).make(),
        Spacer(),
        text.text.size(24.sp).color(color).make(),
      ],
    );
  }
}
