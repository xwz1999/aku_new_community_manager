import 'package:aku_community_manager/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SystemMessage extends StatefulWidget {
  SystemMessage({Key key}) : super(key: key);

  @override
  _SystemMessageState createState() => _SystemMessageState();
}

class _SystemMessageState extends State<SystemMessage> {
  Widget _messageList(String date){
    Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 48.w+33.w,
          child: Text('date',style: TextStyle(color: AppStyle.minorTextColor,fontSize: 24.sp),),
        ),
        Container(
          padding: EdgeInsets.all(24.w),
          color: Color(0xFFFFFFFF),
          child: Column(
            children: [
              Row(
               children:[ Icon(Icons.point_of_sale,size: 16.w,),
               SizedBox(width: 16.w,),
               Text('系统通知',style: TextStyle(color:AppStyle.primaryTextColor,fontSize:32.sp,fontWeight: FontWeight.w600),),
               ]
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
        title:Text('消息',style:AppStyle().barTitleStyle),
      ),
      body:ListView(children: [
        _messageList('2020-10-23 10:00')
      ],) ,
    );
  }
}