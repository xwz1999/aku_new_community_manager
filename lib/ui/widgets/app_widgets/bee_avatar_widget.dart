import 'package:aku_new_community_manager/const/saas_api.dart';
import 'package:aku_new_community_manager/gen/assets.gen.dart';
import 'package:aku_new_community_manager/models/common/img_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BeeAvatarWidget extends StatelessWidget {
  final List<ImgModel>? imgs;
  final List<String>? urls;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const BeeAvatarWidget(
      {Key? key,
      this.imgs,
      this.width,
      this.height,
      this.urls,
      this.fit = BoxFit.cover})
      : assert(imgs != null || urls != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: FadeInImage.assetNetwork(
        placeholder: Assets.newIcon.avatarPlaceholder.path,
        image: imgs == null
            ? SAASAPI.image(urls!.isEmpty ? '' : urls!.first)
            : SAASAPI.image(ImgModel.first(imgs)),
        imageErrorBuilder: (context, obj, stackTrace) {
          return Image.asset(
            Assets.newIcon.avatarPlaceholder.path,
            width: width ?? 128.w,
            height: height ?? 128.w,
            fit: fit,
          );
        },
        height: height ?? 128.w,
        width: width ?? 128.w,
        fit: fit,
      ),
    );
  }
}
