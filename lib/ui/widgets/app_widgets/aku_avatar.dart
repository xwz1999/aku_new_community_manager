import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AkuAvatar extends StatelessWidget {
  final double size;
  AkuAvatar({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return userProvider.isLogin
        ? Material(
            color: Colors.grey,
            child: FadeInImage.assetNetwork(
              placeholder: R.ASSETS_PLACEHOLDER_WEBP,
              image: API.image(userProvider.profileModel.firstImg?.url ?? ''),
              height: size ?? 72.w,
              width: size ?? 72.w,
            ),
          )
        : CircleAvatar(
            child: Icon(Icons.person),
          );
  }
}
