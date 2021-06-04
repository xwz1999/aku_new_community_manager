// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

// Project imports:
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/extensions/list_extension_tool.dart';
import 'package:aku_community_manager/ui/manage_pages/key_manage/key_aplly_input_page.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

class SelectPlacePage extends StatefulWidget {
  SelectPlacePage({Key? key}) : super(key: key);

  @override
  _SelectPlacePageState createState() => _SelectPlacePageState();
}

class _SelectPlacePageState extends State<SelectPlacePage> {
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '选择设备',
      // actions: [
      // IconButton(icon: Icon(CupertinoIcons.search,size: 40.w,), onPressed: (){

      // }),
      // ],
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
        children: [_selectCard()],
      ),
    );
  }

  Widget _selectCard() {
    return MaterialButton(
      elevation: 0,
      minWidth: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 24.w),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.w)),
      onPressed: () {
        Get.to(() => KeyApplyInputPage());
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 189.w,
            height: 184.w,
            child: FadeInImage.assetNetwork(
              placeholder: R.ASSETS_PLACEHOLDER_WEBP,
              image: '',
              fit: BoxFit.cover,
            ),
          ),
          24.w.widthBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  '3-1-102会议室'
                      .text
                      .size(32.sp)
                      .bold
                      .color(kTextPrimaryColor)
                      .make(),
                  Spacer(),
                  Icon(
                    CupertinoIcons.chevron_right,
                    size: 40.w,
                  ),
                ],
              ),
              12.w.heightBox,
              ...<Widget>[
                '剩余钥匙：2个'.text.size(24.sp).color(kTextSubColor).make(),
                '钥匙总数：5个'.text.size(24.sp).color(kTextSubColor).make(),
                '设备位置：1号楼楼下'.text.size(24.sp).color(kTextSubColor).make(),
              ].sepWidget(separate: 12.w.heightBox)
            ],
          ).expand(),
        ],
      ),
    );
  }
}
