// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:aku_ui/aku_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

class SystemMessage extends StatefulWidget {
  SystemMessage({Key key}) : super(key: key);

  @override
  _SystemMessageState createState() => _SystemMessageState();
}

class _SystemMessageState extends State<SystemMessage> {
  Widget _messageList(String date, String name, String phone, String area) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 24.w, bottom: 24.w),
          alignment: Alignment.center,
          width: double.infinity,
          child: Text(
            date,
            style: TextStyle(color: AppStyle.minorTextColor, fontSize: 24.sp),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 24.w, left: 24.w, right: 24.w),
          color: Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Container(
                  width: 16.w,
                  height: 16.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      color: Color(0xFFFF4501)),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Text(
                  '系统通知',
                  style: TextStyle(
                      color: AppStyle.primaryTextColor,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8.w),
              ]),
              Text(
                '你有一条新的报事报修，请立即处理',
                style: TextStyle(
                    color: AppStyle.primaryTextColor,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24.w),
              Row(
                children: [
                  Image.asset(
                    R.ASSETS_MESSAGE_IC_PEOPLE_PNG,
                    width: 40.w,
                    height: 40.w,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    '保修人',
                    style: TextStyle(
                        color: AppStyle.minorTextColor, fontSize: 28.sp),
                  ),
                  Spacer(),
                  Text(
                    name,
                    style: TextStyle(
                        color: AppStyle.primaryTextColor, fontSize: 28.sp),
                  ),
                ],
              ),
              SizedBox(height: 16.w),
              Row(
                children: [
                  Image.asset(
                    R.ASSETS_MESSAGE_IC_PHONE_PNG,
                    width: 40.w,
                    height: 40.w,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text('联系电话',
                      style: TextStyle(
                          color: AppStyle.minorTextColor, fontSize: 28.sp)),
                  Spacer(),
                  Text(phone,
                      style: TextStyle(
                          color: AppStyle.primaryTextColor, fontSize: 28.sp)),
                ],
              ),
              SizedBox(height: 16.w),
              Row(
                children: [
                  Image.asset(
                    R.ASSETS_MESSAGE_IC_AREA_PNG,
                    width: 40.w,
                    height: 40.w,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text('报修区域',
                      style: TextStyle(
                          color: AppStyle.minorTextColor, fontSize: 28.sp)),
                  Spacer(),
                  Text(area,
                      style: TextStyle(
                          color: AppStyle.primaryTextColor, fontSize: 28.sp)),
                ],
              ),
              SizedBox(height: 16.w),
              Divider(
                height: 1.w,
              ),
              AkuButton(
                onPressed: () {},
                child: Container(
                  height: 88.w,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 24.w),
                  child: Row(
                    children: [
                      Text(
                        '查看详情',
                        style: TextStyle(
                            color: AppStyle.primaryTextColor, fontSize: 28.sp),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios, size: 22.w),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        AkuBox.h(16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '系统消息',
      body: ListView(
        padding: EdgeInsets.only(left: 32.w, right: 32.w, bottom: 40.w),
        children: [
          _messageList('2020-10-23 10:00', '杨建', '17867665666', '共区'),
          _messageList('2020-10-22 10:00', '刘能', '17855823545', '共区'),
        ],
      ),
    );
  }
}
