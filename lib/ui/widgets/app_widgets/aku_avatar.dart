// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/const/resource.dart';
import 'package:aku_new_community_manager/provider/user_provider.dart';

class AkuAvatar extends StatelessWidget {
  final double? size;
  AkuAvatar({Key? key,  this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return userProvider.isLogin
        ? Material(
            color: Colors.grey,
            borderRadius: BorderRadius.circular((size ?? 72.w) / 2),
            clipBehavior: Clip.antiAlias,
            child: FadeInImage.assetNetwork(
              placeholder: R.ASSETS_PLACEHOLDER_WEBP,
              image: API.image(userProvider.profileModel!.firstImg?.url ?? ''),
              height: size ?? 72.w,
              width: size ?? 72.w,
              fit: BoxFit.cover,
            ),
          )
        : CircleAvatar(
            child: Icon(Icons.person),
          );
  }
}
