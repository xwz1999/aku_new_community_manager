import 'package:aku_community_manager/provider/manage_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/manage_pages/inspection_manage/inspection_manage_card.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class InspectionManagePage extends StatefulWidget {
  InspectionManagePage({Key key}) : super(key: key);

  @override
  _InspectionManagePageState createState() => _InspectionManagePageState();
}

class _InspectionManagePageState extends State<InspectionManagePage> {
  @override
  Widget build(BuildContext context) {
    final _inspectionManageModel =
        Provider.of<InspectionManageProvider>(context);
    return AkuScaffold(
      title: '巡检管理',
      body: ListView(
        padding: EdgeInsets.only(left: 32.w, right: 32.w, bottom: 40.w),
        children: _inspectionManageModel.inspectionManageModels
            .map((e) => InspectionManageCard(e).inspectionManageCard())
            .toList(),
      ),
    );
  }

//   Widget _inspectionManageCard(InspectionManageCardModel cardModel) {
//     TextStyle _textstyle =
//         TextStyle(color: AppStyle.minorTextColor, fontSize: 28.sp);
//     return Column(
//       children: [
//         AkuBox.h(16),
//         AkuButton(
//           onPressed: () {},
//           child: Container(
//             alignment: Alignment.centerLeft,
//             padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 48.w),
//             width: 686.w,
//             height: 362.w,
//             color: Color(0xFFFFFFFF),
//             child: Column(children: [
//               Container(
//                   height: 93.w,
//                   width: double.infinity,
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     cardModel.title,
//                     style: TextStyle(
//                         color: AppStyle.primaryTextColor,
//                         fontSize: 32.sp,
//                         fontWeight: FontWeight.bold),
//                   )),
//               Divider(
//                 height: 1.w,
//               ),
//               AkuBox.h(24),
//               Row(
//                 children: [
//                   Image.asset(
//                     R.ASSETS_MANAGE_IC_RENWU_PNG,
//                     width: 40.w,
//                     height: 40.w,
//                   ),
//                   AkuBox.w(4),
//                   Text(
//                     '巡检日期',
//                     style: _textstyle,
//                   ),
//                   Spacer(),
//                   Text(
//                     cardModel.date,
//                     style: AppStyle().primaryStyle,
//                   )
//                 ],
//               ),
//               Spacer(),
//               Row(
//                 children: [
//                   Image.asset(
//                     R.ASSETS_HOME_IC_NEWS_PNG,
//                     width: 40.w,
//                     height: 40.w,
//                   ),
//                   AkuBox.w(4),
//                   Text('巡检周期', style: _textstyle),
//                   Spacer(),
//                   Text(
//                     cardModel.cycle,
//                     style: AppStyle().primaryStyle,
//                   ),
//                 ],
//               ),
//               Spacer(),
//               Row(
//                 children: [
//                   Image.asset(
//                     R.ASSETS_MANAGE_IC_TIME_PNG,
//                     width: 40.w,
//                     height: 40.w,
//                   ),
//                   AkuBox.w(4),
//                   Text(
//                     '巡检时间',
//                     style: _textstyle,
//                   ),
//                   Spacer(),
//                   Text(
//                     cardModel.time,
//                     style: AppStyle().primaryStyle,
//                   ),
//                 ],
//               ),
//               Spacer(),
//               Row(
//                 children: [
//                   Image.asset(
//                     R.ASSETS_MESSAGE_IC_PEOPLE_PNG,
//                     width: 40.w,
//                     height: 40.w,
//                   ),
//                   AkuBox.w(4),
//                   Text(
//                     '巡检人员',
//                     style: _textstyle,
//                   ),
//                   Spacer(),
//                   Text(
//                     cardModel.persons.length > 2
//                         ? '${cardModel.persons[0]}、${cardModel.persons[1]}等'
//                         : cardModel.persons[0],
//                     style: AppStyle().primaryStyle,
//                   ),
//                 ],
//               ),
//             ]),
//           ),
//         ),
//       ],
//     );
//   }
}
