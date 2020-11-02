import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_ui/aku_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          alignment: Alignment.center,
          width: double.infinity,
          height: 48.w + 33.w,
          child: Text(
            'date',
            style: TextStyle(color: AppStyle.minorTextColor, fontSize: 24.sp),
          ),
        ),
        Container(
          padding: EdgeInsets.all(24.w),
          color: Color(0xFFFFFFFF),
          child: Column(
            children: [
              Row(children: [
                Icon(
                  Icons.point_of_sale,
                  size: 16.w,
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
                Spacer(),
              ]),
              Text(
                '你有一条新的报事报修，请立即处理',
                style: TextStyle(
                    color: AppStyle.primaryTextColor,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(Icons.contact_page, size: 40.w),
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
              Row(
                children: [
                  Icon(
                    Icons.phone,
                    size: 40.w,
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
              Row(
                children: [
                  Icon(
                    Icons.airplanemode_active,
                    size: 40.w,
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
              Divider(),
              AkuButton(
                child: Container(
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('消息', style: AppStyle().barTitleStyle),
      ),
      body: ListView(
        padding: EdgeInsets.all(32.w),
        children: [
          _messageList('2020-10-23 10:00', '杨建', '17867665666', '共区'),
          _messageList('2020-10-22 10:00', '刘能', '17855823545', '共区'),
        ],
      ),
    );
  }
}
