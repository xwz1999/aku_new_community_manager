import 'package:aku_new_community_manager/models/common/img_model.dart';
import 'package:aku_new_community_manager/ui/widgets/app_widgets/bee_image_network.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/bee_image_preview.dart';
import 'package:aku_new_community_manager/utils/extension/list_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class BeeHorImageView extends StatefulWidget {
  final EdgeInsets? padding;
  final int maxCount;
  final List<ImgModel> imgs;
  final double imgWidth;
  final double imgHeight;
  final BorderRadiusGeometry? borderRadius;
  final int? spacing;
  final VoidCallback? onPressed;

  const BeeHorImageView(
      {Key? key,
      this.padding = EdgeInsets.zero,
      required this.maxCount,
      required this.imgs,
      required this.imgWidth,
      required this.imgHeight,
      this.borderRadius,
      this.spacing,
      this.onPressed})
      : super(key: key);

  @override
  _BeeHorImageViewState createState() => _BeeHorImageViewState();
}

class _BeeHorImageViewState extends State<BeeHorImageView> {
  bool get overFlow => widget.imgs.length > widget.maxCount;

  int get overCount => overFlow ? (widget.imgs.length - widget.maxCount) : 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      child: Row(
        children: List.generate(widget.imgs.length - overCount, (index) {
          if (overFlow && (index == widget.maxCount - 1)) {
            return _overFlowWidget(widget.imgs[index]);
          } else {
            return _imageView(widget.imgs[index]);
          }
        }).sepWidget(separate: (widget.spacing ?? 10).w.widthBox),
      ),
    );
  }

  Widget _overFlowWidget(ImgModel img) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: widget.borderRadius ?? BorderRadius.circular(16.w)),
          child: BeeImageNetwork(
            width: widget.imgWidth,
            height: widget.imgHeight,
            imgs: [img],
          ),
        ),
        GestureDetector(
          onTap: widget.onPressed,
          child: Container(
            width: widget.imgWidth,
            height: widget.imgHeight,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: widget.borderRadius ?? BorderRadius.circular(16.w),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.image,
                  size: 24.w,
                  color: Colors.white,
                ),
                8.w.widthBox,
                '${overCount + 1}'.text.size(28.sp).color(Colors.white).make(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _imageView(ImgModel img) {
    return GestureDetector(
      onTap: () {
        BeeImagePreview.toPath(path: img.url);
      },
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: widget.borderRadius ?? BorderRadius.circular(16.w)),
        child: BeeImageNetwork(
          width: widget.imgWidth,
          height: widget.imgHeight,
          imgs: [img],
        ),
      ),
    );
  }
}
