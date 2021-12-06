
import 'package:aku_new_community_manager/ui/manage_pages/facilities/facilities_page.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:aku_new_community_manager/const/resource.dart';
import 'package:aku_new_community_manager/tools/extensions/list_extension_tool.dart';
class FacilitiesSelectPage extends StatefulWidget {
  FacilitiesSelectPage({Key? key}) : super(key: key);

  @override
  _FacilitiesSelectPageState createState() => _FacilitiesSelectPageState();
}

class _FacilitiesSelectPageState extends State<FacilitiesSelectPage> {
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '设施检查',
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 40.w, horizontal: 36.w),
        children: [
          _buidTile(R.ASSETS_MANAGE_IC_RENWU_PNG, '设施检查', 1),
          _buidTile(R.ASSETS_MANAGE_IC_RENWU_PNG, '设备检查', 2),
        ].sepWidget(separate: 20.w.heightBox),
      ),
    );
  }

  Widget _buidTile(String iconPath, String text, int type) {
    return Row(
      children: [
        SizedBox(
          width: 32.w,
          height: 32.w,
          child: Image.asset(iconPath),
        ),
        28.w.widthBox,
        text.text.black.size(30.sp).make(),
        Spacer(),
        Icon(
          CupertinoIcons.chevron_forward,
          size: 32.w,
        ),
      ],
    )
        .box
        .padding(EdgeInsets.symmetric(vertical: 40.w, horizontal: 32.w))
        .make()
        .onInkTap(() {
      Get.to(
        () => FacilitiesPage(
          facilitiesType: type,
        ),
      );
    }).material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.w),
      clipBehavior: Clip.antiAlias,
    );
  }
}