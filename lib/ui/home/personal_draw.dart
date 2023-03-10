// Flutter imports:
// Project imports:
import 'package:aku_new_community_manager/const/resource.dart';
import 'package:aku_new_community_manager/new_ui/auth/other_login_page.dart';
import 'package:aku_new_community_manager/provider/user_provider.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/tools/user_tool.dart';
import 'package:aku_new_community_manager/ui/settings/settings_page.dart';
import 'package:aku_new_community_manager/ui/settings/user_info_page.dart';
import 'package:aku_new_community_manager/ui/widgets/app_widgets/bee_avatar_widget.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PersonalDraw extends StatefulWidget {
  PersonalDraw({Key? key}) : super(key: key);

  @override
  _PersonalDrawState createState() => _PersonalDrawState();
}

class _PersonalDrawState extends State<PersonalDraw> {
  Widget _myListTile(String path, String text, {VoidCallback? onPressed}) {
    return AkuButton(
      onPressed: onPressed,
      child: Container(
        height: 96.w,
        padding: EdgeInsets.only(left: 32.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              path,
              width: 40.w,
              height: 40.w,
            ),
            SizedBox(width: 16.w),
            Text(
              text,
              style: TextStyle(
                color: AppStyle.primaryTextColor,
                fontSize: 28.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return SizedBox(
      width: 465.w,
      child: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: ScreenUtil().statusBarHeight,
            ),
            //leading
            InkWell(
              onTap: () {
                userProvider.isLogin
                    ? Get.to(() => UserInfoPage())
                    : Get.to(() => OtherLoginPage());
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 80.w, top: 40.w),
                width: double.infinity,
                child: Row(
                  children: [
                    SizedBox(width: 32.w),
                    //????????????
                    BeeAvatarWidget(
                      width: 96.w,
                      height: 96.w,
                      imgs: UserTool.userProvider.userInfoModel!.imgList,
                    ),
                    SizedBox(width: 24.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //????????????
                        userProvider.isLogin
                            ? Text(
                                userProvider.userInfoModel!.nickName!,
                                style: TextStyle(
                                  color: AppStyle.primaryTextColor,
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : Text(
                                '??????',
                                style: TextStyle(
                                  color: AppStyle.primaryTextColor,
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined, size: 33.w),
                            Text(
                              '${UserTool.userProvider.userInfoModel!.communityName}',
                              style: TextStyle(
                                  color: AppStyle.primaryTextColor,
                                  fontSize: 24.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            _myListTile(
              R.ASSETS_USER_IC_PERSON_PNG,
              '????????????',
              onPressed: () {
                userProvider.isLogin
                    ? Get.to(() => UserInfoPage())
                    : Get.to(() => OtherLoginPage());
              },
            ),
            // _myListTile(R.ASSETS_USER_IC_KEFU_PNG, '????????????'),
            _myListTile(R.ASSETS_USER_IC_SETUP_PNG, '??????', onPressed: () {
              Get.to(() => SettingsPage());
            }),
          ],
        ),
      ),
    );
  }
}
