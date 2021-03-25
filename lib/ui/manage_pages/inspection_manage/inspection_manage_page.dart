// Flutter imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/inspection/inspection_list_model.dart';
import 'package:aku_community_manager/ui/manage_pages/inspection_manage/inspection_manage_card.dart';
import 'package:aku_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

// Package imports:

// Project imports:
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

class InspectionManagePage extends StatefulWidget {
  InspectionManagePage({Key key}) : super(key: key);

  @override
  _InspectionManagePageState createState() => _InspectionManagePageState();
}

class _InspectionManagePageState extends State<InspectionManagePage> {
  EasyRefreshController _easyRefreshController;
  @override
  void initState() {
    _easyRefreshController = EasyRefreshController();
    super.initState();
  }

  @override
  void dispose() {
    _easyRefreshController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '巡检管理',
      body: BeeListView(
        path: API.manage.inspectionList,
        controller: _easyRefreshController,
        convert: (models) {
          return models.tableList
              .map((e) => InspectionListModel.fromJson(e))
              .toList();
        },
        builder: (items) {
          return ListView.separated(
              itemBuilder: (context, index) {
                return InspectionManageCard(cardModel: items[index]);
              },
              separatorBuilder: (_, __) {
                return 8.w.heightBox;
              },
              itemCount: items.length);
        },
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
