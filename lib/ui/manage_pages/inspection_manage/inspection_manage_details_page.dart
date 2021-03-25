// Flutter imports:
import 'package:aku_community_manager/models/manager/inspection/inspection_list_model.dart';
import 'package:aku_community_manager/ui/manage_pages/inspection_manage/inspection_manage_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:aku_community_manager/utils/extension/list_extension.dart';
import 'package:aku_community_manager/style/app_style.dart';
// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

class InspectionManageDetailsPage extends StatefulWidget {
  final InspectionListModel cardModel;
  InspectionManageDetailsPage({Key key, this.cardModel}) : super(key: key);

  @override
  _InspectionManageDetailsPageState createState() =>
      _InspectionManageDetailsPageState();
}

class _InspectionManageDetailsPageState
    extends State<InspectionManageDetailsPage> {
  bool get _isFinishInspection => widget.cardModel.status == 2;
  Map<int, String> _inspectionStatus = {
    1: '待巡检',
    2: '已巡检',
  };
  Color _inspectionColor(int status) {
    switch (status) {
      case 1:
        return Color(0xFF4501);
        break;
      case 2:
        return Color(0x999999);
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '巡检详情',
      body: Column(
        children: [
          InspectionManageCard(cardModel: widget.cardModel, extra: false),
          16.w.heightBox,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.w),
            decoration: BoxDecoration(color: Color(0xFFFFFF)),
            child: Column(
              children: <Widget>[
                '巡检站点'.text.black.size(32.sp).bold.make(),
                _buildInspectionTile(
                  '',
                  1,
                  1,
                ),
              ].sepWidget(separate: 16.w.heightBox),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInspectionTile(
    String inspectionStation,
    int inspectionCount,
    int index,
  ) {
    return Row(
      children: [
        CircleAvatar(
          child: '巡$index'.text.color(Color(0x3F8FFE)).size(28.sp).bold.make(),
          radius: 48.w,
          backgroundColor: Color(0xE9F2FF),
        ),
        24.w.widthBox,
        Column(
          children: [
            inspectionStation.text.black.size(28.sp).bold.make(),
            '$inspectionCount项检查'.text.color(kTextSubColor).size(24.sp).make()
          ],
        ),
        Spacer(),
        _inspectionStatus[widget.cardModel.status]
            .text
            .size(24.sp)
            .bold
            .color(_inspectionColor(widget.cardModel.status))
            .make(),
        14.w.widthBox,
        Icon(
          CupertinoIcons.chevron_right_circle,
          size: 14.w,
        ),
      ],
    )
        .box
        .color(Color(0xF9F9F9))
        .withRounded(value: 4.w)
        .padding(EdgeInsets.all(24.w))
        .make()
        .onInkTap(() {});
  }
}
// Widget _inspectionPersons(){
//   return Container(
//         width: double.infinity,
//         color: Color(0xFFFFFFFF),
//         margin: EdgeInsets.only(top: 16.w),
//         padding: EdgeInsets.only(
//             top: 24.w, left: 32.w, right: 86.w, bottom: 40.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               '巡检人员',
//               style: TextStyle(
//                   color: AppStyle.primaryTextColor,
//                   fontSize: 32.sp,
//                   fontWeight: FontWeight.bold),
//             ),
//             AkuBox.h(16),
//             GridView(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   childAspectRatio: 250 / 40,
//                   mainAxisSpacing: 16.w),
//               children: widget.cardModel.persons
//                   .map((e) => _person(widget.cardModel.persons.indexOf(e)))
//                   .toList(),
//             ),
//           ],
//         ),
//       ),
//       AkuBox.h(16),
//       Container(
//         color: Color(0xFFFFFFFF),
//         padding: EdgeInsets.only(top: 24.w, left: 32.w, right: 32.w),
//         width: double.infinity,
//         child:
//             Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Text('巡检站点',
//               style: TextStyle(
//                   color: AppStyle.primaryTextColor,
//                   fontSize: 32.sp,
//                   fontWeight: FontWeight.bold)),
//           AkuBox.h(16),
//           Wrap(
//             runSpacing: 16.w,
//             children: widget.cardModel.stations
//                 .map((e) => _station(widget.cardModel.stations.indexOf(e)))
//                 .toList(),
//           ),
//           AkuBox.h(24),
//           Image.asset(
//             R.ASSETS_INSPECTION_INSPECTION_STATION_PNG,
//             width: 686.w,
//             height: 343.w,
//           ),
//         ]),
//       );

// Widget _station(index) {
//   return Row(
//     mainAxisSize: MainAxisSize.min,
//     children: [
//       Container(
//         padding:
//             EdgeInsets.only(top: 16.w, left: 24.w, bottom: 15.w, right: 24.w),
//         color: Color(0xFFF9F9F9),
//         height: 64.w,
//         alignment: Alignment.center,
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               widget.cardModel.stations[index],
//               style: TextStyle(
//                   color: AppStyle.primaryTextColor, fontSize: 24.sp),
//             ),
//           ],
//         ),
//       ),
//       AkuBox.w(8),
//       (widget.cardModel.stations.length - 1) != index
//           ? Container(
//               width: 56.w,
//               height: 3.w,
//               color: Color(0xFFE8E8E8),
//             )
//           : SizedBox(),
//     ],
//   );
// }

// Widget _person(index) {
//   return Container(
//     height: 40.w,
//     child: Row(mainAxisSize: MainAxisSize.min, children: [
//       Image.asset(
//         R.ASSETS_MESSAGE_IC_PEOPLE_PNG,
//         width: 40.w,
//         height: 40.w,
//       ),
//       AkuBox.w(8),
//       Text(
//         widget.cardModel.persons[index],
//         style: TextStyle(
//           color: AppStyle.primaryTextColor,
//           fontSize: 28.sp,
//         ),
//       ),
//     ]),
//   );
// }
