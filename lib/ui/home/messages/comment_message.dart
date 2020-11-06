import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_ui/common_widgets/aku_common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aku_community_manager/const/resource.dart';
class CommentMessage extends StatefulWidget {
  CommentMessage({Key key}) : super(key: key);

  @override
  _CommentMessageState createState() => _CommentMessageState();
}

class _CommentMessageState extends State<CommentMessage> {
  Widget _messageList(String date, String name, String comment,) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top:24.w,bottom:24.w),
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
                  '评论消息',
                  style: TextStyle(
                      color: AppStyle.primaryTextColor,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8.w),
              ]),
              Text(
                '你有一条新的评论消息，请立即查看',
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
                    '评论人',
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
                    R.ASSETS_MESSAGE_IC_STAR_PNG,
                    width: 40.w,
                    height: 40.w,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text('综合评分',
                      style: TextStyle(
                          color: AppStyle.minorTextColor, fontSize: 28.sp)),
                  Spacer(),
                  Text(comment,
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
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '评论消息',
       body: ListView(
        padding: EdgeInsets.only(left:32.w,right: 32.w,bottom: 40.w),
        children: [
          _messageList('2020-10-23 10:00', '杨建', '四星'),
          _messageList('2020-10-24 11:00', '刘能', '四星'),
        ],
      ),
    );
  }
}