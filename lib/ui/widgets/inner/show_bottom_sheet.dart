import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_back_button.dart';
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';

///show bottom sheet
Future showAkuSheet({
  Widget child,
}) async {
  await Get.bottomSheet(
    Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.w)),
      ),
      child: child,
    ),
  );
}

Future showNormalSheet(String title, List<Widget> children) async {
  await showAkuSheet(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: AkuBackButton.text(),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: AppStyle.primaryTextColor,
                fontSize: 32.w,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
          ],
        ),
        ...children,
      ],
    ),
  );
}

Future showItemSheet({
  String title,
  List<String> items,
  String selectItem,
  Function(String result) onTap,
}) async {
  await showNormalSheet(
      title,
      items.map((e) {
        return AkuMaterialButton(
          height: 96.w,
          minWidth: double.infinity,
          onPressed: () {
            Get.back();
            onTap(e);
          },
          child: Text(
            e,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32.sp,
              color: e == selectItem
                  ? AppStyle.secondaryColor
                  : AppStyle.primaryTextColor,
            ),
          ),
        );
      }).toList());
}
