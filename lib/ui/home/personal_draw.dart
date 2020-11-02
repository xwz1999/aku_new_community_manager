import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/settings/settings_page.dart';
import 'package:aku_community_manager/ui/settings/user_info_page.dart';
import 'package:aku_ui/common_widgets/aku_button.dart';
import 'package:aku_ui/common_widgets/aku_round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PersonalDraw extends StatefulWidget {
  PersonalDraw({Key key}) : super(key: key);

  @override
  _PersonalDrawState createState() => _PersonalDrawState();
}

class _PersonalDrawState extends State<PersonalDraw> {
  Widget _myListTile(IconData iconData, String text, {VoidCallback onPressed}) {
    return AkuButton(
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        height: 96.w,
        padding: EdgeInsets.only(left: 32.w, top: 28.w, bottom: 28.w),
        child: Row(children: [
          Icon(
            iconData,
            size: 40.w,
          ),
          SizedBox(width: 16.w),
          Text(
            text,
            style: TextStyle(
              color: AppStyle.primaryTextColor,
              fontSize: 28.sp,
            ),
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 80.w - 40.w + ScreenUtil().statusBarHeight,
          ),
          //leading
          Container(
            margin: EdgeInsets.only(bottom: 80.w),
            width: double.infinity,
            child: Row(
              children: [
                SizedBox(width: 32.w),
                //头像按钮
                AkuRoundButton(
                  height: 72.w,
                  onPressed: () {},
                  child: CircleAvatar(
                    radius: 36.w,
                    backgroundColor: Colors.grey,
                    child: userProvider.isSigned ? null : null,
                  ),
                ),
                SizedBox(width: 24.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //登录按钮
                    InkWell(
                      onTap: () {},
                      child: userProvider.isSigned
                          ? Text(
                              '李大海',
                              style: TextStyle(
                                  color: AppStyle.primaryTextColor,
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.bold),
                            )
                          : Text('登录',
                              style: TextStyle(
                                  color: AppStyle.primaryTextColor,
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.bold)),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(Icons.location_on_outlined, size: 33.w),
                          Text(
                            '深圳华悦茂峰',
                            style: TextStyle(
                                color: AppStyle.primaryTextColor,
                                fontSize: 24.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _myListTile(
            Icons.contact_page,
            '个人信息',
            onPressed: () {
              Get.to(UserInfoPage());
            },
          ),
          _myListTile(Icons.supervised_user_circle, '联系客服'),
          _myListTile(Icons.settings, '设置', onPressed: () {
            Get.to(SettingsPage());
          }),
        ],
      ),
    );
  }
}
