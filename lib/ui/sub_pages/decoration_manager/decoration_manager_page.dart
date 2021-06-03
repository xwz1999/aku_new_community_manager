// // Flutter imports:
// import 'package:flutter/material.dart';

// // Package imports:
// import 'package:flutter_easyrefresh/easy_refresh.dart';
// import 'package:provider/provider.dart';

// // Project imports:
// import 'package:aku_community_manager/const/api.dart';
// import 'package:aku_community_manager/models/manager/decoration/decoration_list_model.dart';
// import 'package:aku_community_manager/provider/user_provider.dart';
// import 'package:aku_community_manager/tools/screen_tool.dart';
// import 'package:aku_community_manager/ui/sub_pages/decoration_manager/decoration_manager_card.dart';
// import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
// import 'package:aku_community_manager/ui/widgets/common/bee_list_view.dart';
// import 'package:aku_community_manager/ui/widgets/inner/aku_tab_bar.dart';

// class DecorationManagerPage extends StatefulWidget {
//   DecorationManagerPage({Key key}) : super(key: key);

//   @override
//   _DecorationManagerPageState createState() => _DecorationManagerPageState();
// }

// class _DecorationManagerPageState extends State<DecorationManagerPage>
//     with TickerProviderStateMixin {
//   TabController _tabController;
//   EasyRefreshController _refreshController;

//   List<String> get tabs {
//     final userProvider = Provider.of<UserProvider>(context, listen: false);
//     if (userProvider?.infoModel?.canSendTicket != null &&
//         userProvider.infoModel.canSendTicket) {
//       return ['待指派', '已指派', '已执行', '全部'];
//     } else {
//       return ['待执行', '已执行', '全部'];
//     }
//   }

//   @override
//   void initState() {
//     super.initState();

//     _tabController = TabController(length: tabs.length, vsync: this);
//     _refreshController = EasyRefreshController();
//   }

//   @override
//   void dispose() {
//     _refreshController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AkuScaffold(
//       title: '装修管理',
//       appBarBottom: PreferredSize(
//         child: AkuTabBar(
//           controller: _tabController,
//           tabs: tabs,
//         ),
//         preferredSize: Size.fromHeight(96.w),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: _getViews(),
//       ),
//     );
//   }

//   List<Widget> _getViews() {
//     final userProvider = Provider.of<UserProvider>(context);
//     if (userProvider?.infoModel?.canSendTicket != null &&
//         userProvider.infoModel.canSendTicket) {
//       return [...List.generate(4, (index) => _getSingleListView(index))];
//     } else {
//       return [...List.generate(3, (index) => _getSingleListView(index))];
//     }
//     // switch (role) {
//     //   case USER_ROLE.MANAGER:
//     //     return [
//     //       _getSingleListView(
//     //           DecorationData.getModels(DecorationType.WAIT_HAND_OUT)),
//     //       _getSingleListView(DecorationData.getModels(DecorationType.HAND_OUT)),
//     //       _getSingleListView(DecorationData.getModels(DecorationType.DONE)),
//     //       _getSingleListView(DecorationData.allModels),
//     //     ];
//     //     break;
//     //   case USER_ROLE.PROPERTY:
//     //     return [
//     //       _getSingleListView(DecorationData.getModels(DecorationType.HAND_OUT)),
//     //       _getSingleListView(DecorationData.getModels(DecorationType.DONE)),
//     //       _getSingleListView(DecorationData.allPropertyModels),
//     //     ];
//     //   default:
//     //     return [
//     //       _getSingleListView(
//     //           DecorationData.getTypeModels(DecorationStatusType.PROGRESS)),
//     //       _getSingleListView(
//     //           DecorationData.getTypeModels(DecorationStatusType.DONE)),
//     //       _getSingleListView(DecorationData.allPropertyModels),
//     //     ];
//     //     break;
//     // }
//   }

//   _getSingleListView(int index) {
//     return BeeListView(
//         extraParams: {'operationStatus': index},
//         path: API.manage.decorationList,
//         controller: _refreshController,
//         convert: (models) {
//           return models.tableList
//               .map((e) => DecorationListModel.fromJson(e))
//               .toList();
//         },
//         builder: (items) {
//           return ListView.builder(
//             itemBuilder: (context, index) {
//               return DecorationManagerCard(model: items[index]);
//             },
//             itemCount: items.length,
//             padding: EdgeInsets.symmetric(horizontal: 32.w),
//           );
//         });
//   }
// }
