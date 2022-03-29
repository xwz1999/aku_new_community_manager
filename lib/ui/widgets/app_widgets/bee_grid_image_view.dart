import 'package:aku_new_community_manager/const/saas_api.dart';
import 'package:aku_new_community_manager/gen/assets.gen.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/bee_image_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BeeGridImageView extends StatelessWidget {
  final List<String?> urls;
  final EdgeInsetsGeometry padding;
  final int? crossCount;
  const BeeGridImageView({
    Key? key,
    required this.urls,
    this.padding = EdgeInsets.zero,
    this.crossCount = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (urls.isEmpty) return SizedBox();
    return GridView.builder(
      padding: padding,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossCount!,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.w,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            BeeImagePreview.toPath(path: urls[index], tag: urls[index]);
          },
          child: Hero(
            tag: urls[index]!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.w),
              child: FadeInImage.assetNetwork(
                height: 184.w,
                width: 184.w,
                placeholder: Assets.placeholder.path,
                image: SAASAPI.image(urls[index]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
      itemCount: urls.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
