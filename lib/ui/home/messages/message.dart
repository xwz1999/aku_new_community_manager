import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Message extends StatefulWidget {
  Message({Key key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {

  Widget _messageType(String type){
    switch (type) {
            case'系统消息' :
              return Container(
            width: 88.w,height: 88.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(44.w),
              gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [
                Color(0xFFFFDE9A),
                Color(0xFFFFB00A),
              ]),
            ),
            child: Icon(Icons.message,size:66.w),);
              break;
              case '评论消息':
             return  Container(
            width: 88.w,height: 88.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(44.w),
              gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [
                Color(0xFF81D1FF),
                Color(0xFF1792FF),
              ]),
            ),
            child: Icon(Icons.message_sharp,size:66.w),);
            default:
          }
  }

  Widget _messageList(String date,String type){
    return Container(
      padding: EdgeInsets.only(top:24.w,left:32.w,),
      child: Row(
        children:[
          
            SizedBox(width: 24.w,),
            Column(
              children: [
                Row(
                  children: [
                    Text('系统通知',style: AppStyle().primaryStyle,),
                    Spacer(),
                    Text(date,style:AppStyle().minorStyle),

                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '消息',
      titleStyle: AppStyle().barTitleStyle,
      body: ListView(
        padding: EdgeInsets.only(top:16.w),
        children: [

      ],),
    );
  }
}