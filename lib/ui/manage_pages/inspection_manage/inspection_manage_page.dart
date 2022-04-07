// Flutter imports:
// Project imports:
import 'package:aku_new_community_manager/provider/user_provider.dart';
import 'package:aku_new_community_manager/ui/manage_pages/inspection_manage/inspection_manage_view.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/aku_tab_bar.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

// Package imports:

class InspectionManagePage extends StatefulWidget {
  InspectionManagePage({Key? key}) : super(key: key);

  @override
  _InspectionManagePageState createState() => _InspectionManagePageState();
}

class _InspectionManagePageState extends State<InspectionManagePage>
    with TickerProviderStateMixin {
  List<String> get _tabs {
    UserProvider _userProvider =
        Provider.of<UserProvider>(context, listen: false);
    if (_userProvider.userInfoModel!.type == 1) {
      return ['待巡检', '已巡检', '巡检中', '未巡检', '全部'];
    } else {
      return ['待巡检', '已巡检', '巡检中', '未巡检', '全部'];
    }
  }

  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '巡检管理',
      appBarBottom: PreferredSize(
        child: AkuTabBar(controller: _tabController!, tabs: _tabs,isScrollable: true,),
        preferredSize: Size.fromHeight(96.w),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(
          _tabs.length,
          (index) => InspectionMangeView(
            inspectionStatus: (index + 1 < 5) ? (index + 1) : 0,
          ),
        ),
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
