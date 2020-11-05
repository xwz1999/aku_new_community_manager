import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/sub_pages/visitor_manager/visitor_manager_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class VisitorManagerCard extends StatefulWidget {
  final String adress;
  final String name;
  final String plate;
  final String time;
  final VisitorStatus status;
  VisitorManagerCard({Key key, @required this.adress,@required this.name, this.plate, this.time,@required this.status}) : super(key: key);

  @override
  _VisitorManagerCardState createState() => _VisitorManagerCardState();
}

class _VisitorManagerCardState extends State<VisitorManagerCard> {

TextStyle _textStyle=TextStyle(color:AppStyle.primaryTextColor,fontSize:28.sp,);
String _adress;
String _name;
String _plate;
String _time;
VisitorStatus _status;
  @override
  void initState() { 
    super.initState();
    _adress=widget.adress;
    _name=widget.name;
    _plate=widget.plate??'无信息';
    _time=widget.time??'无信息';
    _status=widget.status;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AkuBox.h(16),
        Container(
          color: Color(0xFFFFFFFF),
          width: double.infinity,
          height: 201.w,
          padding: EdgeInsets.only(top:24.w,left:24.w,bottom: 28.w),
           child: Stack(children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children:[
                 Text(_adress,style: TextStyle(color:AppStyle.primaryTextColor,fontSize:32.sp,fontWeight: FontWeight.bold),),
                 AkuBox.h(16),
                 Row(children: [
                   Image.asset(R.ASSETS_USER_IC_PERSON_PNG,width:40.w ,height: 40.w,),
                   AkuBox.w(8),
                   Text('$_name先生',style:_textStyle,),
                   AkuBox.w(137),
                  Image.asset(R.ASSETS_HOME_IC_BORROW_PNG,width: 40.w,height: 40.w,),
                  AkuBox.w(8),
                  Text(_plate,style: _textStyle,),
                  Spacer(),
                 ],),
                 Spacer(),
                 Row(children: [
                   Image.asset(R.ASSETS_HOME_IC_ARTICLE_PNG,width: 40.w,height: 40.w,),
                   AkuBox.w(8),
                   Text(_time,style:_textStyle),
                   Spacer(),
                 ],),
               ],
             ),
             Positioned(
               left: 582.w,
               bottom: 104.w,
               child:_statusImage(_status) ),
           ],),
        ),
      ],
    );
  }
  Widget _statusImage(VisitorStatus status){
    switch (status) {
      case VisitorStatus.NOT_VISIT:
      return  Placeholder();
        case VisitorStatus.VISIT_DONE:
       return  Placeholder();
        case VisitorStatus.OUTDATE:
       return Placeholder();
    }
  }
}