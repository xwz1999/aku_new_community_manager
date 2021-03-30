import 'dart:io';

import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/widgets/inner/pick_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aku_community_manager/const/resource.dart';
import 'package:velocity_x/velocity_x.dart';

class AkuPickImageWidget extends StatefulWidget {
  final double size;
  final Function(File file) onChanged;
  AkuPickImageWidget({Key key, this.size, this.onChanged}) : super(key: key);

  @override
  _AkuPickImageWidgetState createState() => _AkuPickImageWidgetState();
}

class _AkuPickImageWidgetState extends State<AkuPickImageWidget> {
  File _file;
  @override
  Widget build(BuildContext context) {
    return _file != null
        ? Stack(children: [
            Container(
              width: widget.size ?? 160.w,
              height: widget.size ?? 160.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  color: kBackgroundColor),
              child: Image.file(_file),
            ),
            Positioned(
              top: 8.w,
              right: 8.w,
              child: Container(
                width: 40.w,
                height: 40.w,
                child: Icon(
                  CupertinoIcons.xmark,
                  size: 20.w,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                  color: Color(0xFF000000),
                ),
              ).onTap(() {
                _file = null;
                setState(() {});
              }),
            )
          ])
        : GestureDetector(
            onTap: () async {
              await akuPickImage().then((value) => _file = File(value.path));
              widget.onChanged(_file);
              setState(() {});
            },
            child: DottedBorder(
              color: Color(0xFF999999),
              borderType: BorderType.RRect,
              strokeWidth: 2.w,
              dashPattern: [6, 3],
              radius: Radius.circular(8.w),
              child: Container(
                width: widget.size ?? 160.w,
                height: widget.size ?? 160.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      R.ASSETS_MANAGE_IC_IMAGE_PNG,
                      width: 60.w,
                      height: 60.w,
                      color: Color(0xFF999999),
                    ),
                    4.w.heightBox,
                    '上传图片'.text.color(kTextSubColor).size(22.sp).bold.make(),
                  ],
                ),
              ),
            ).material(color: Colors.transparent),
          );
  }
}
