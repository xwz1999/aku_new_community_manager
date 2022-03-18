// // Dart imports:
// import 'dart:math';

// // Flutter imports:
// import 'package:aku_new_community_manager/const/api.dart';
// import 'package:aku_new_community_manager/models/manager/decoration/decoration_detail_model.dart';
// import 'package:aku_new_community_manager/ui/widgets/common/aku_material_button.dart';
// import 'package:aku_new_community_manager/saas_models/net_model/base_model.dart';
// import 'package:aku_new_community_manager/utils/network/net_util.dart';
// import 'package:bot_toast/bot_toast.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// // Package imports:
// import 'package:common_utils/common_utils.dart';
// import 'package:expandable/expandable.dart';
// import 'package:flutter_easyrefresh/easy_refresh.dart';
// import 'package:get/get.dart';

// // Project imports:
// import 'package:aku_new_community_manager/const/resource.dart';
// import 'package:aku_new_community_manager/mock_models/decoration/decoration_model.dart';
// import 'package:aku_new_community_manager/style/app_style.dart';
// import 'package:aku_new_community_manager/tools/screen_tool.dart';
// import 'package:aku_new_community_manager/tools/user_tool.dart';
// import 'package:aku_new_community_manager/tools/widget_tool.dart';
// import 'package:aku_new_community_manager/ui/sub_pages/decoration_manager/decoration_check_row.dart';
// import 'package:aku_new_community_manager/ui/sub_pages/decoration_manager/decoration_checkbox.dart';
// import 'package:aku_new_community_manager/ui/sub_pages/decoration_manager/decoration_util.dart';
// import 'package:aku_new_community_manager/ui/widgets/common/aku_back_button.dart';
// import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
// import 'package:aku_new_community_manager/ui/widgets/inner/aku_bottom_button.dart';
// import 'package:aku_new_community_manager/ui/widgets/inner/aku_title_box.dart';
// import 'package:aku_new_community_manager/ui/widgets/inner/show_bottom_sheet.dart';

// class DecorationManagerDetailPage extends StatefulWidget {
//   final int id;
//   final int status;
//   final int operationStatus;
//   DecorationManagerDetailPage({
//     Key key,
//     this.id,
//     this.status, this.operationStatus,
//   }) : super(key: key);

//   @override
//   _DecorationManagerDetailStatePage createState() =>
//       _DecorationManagerDetailStatePage();
// }

// class _DecorationManagerDetailStatePage
//     extends State<DecorationManagerDetailPage> {
//   EasyRefreshController _refreshController;
//   DecorationDetailModel _model;
//   bool _onload = true;
//   @override
//   void initState() {
//     super.initState();
//     _refreshController = EasyRefreshController();
//   }

//   @override
//   void dispose() {
//     _refreshController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AkuScaffold(
//       title: '装修详情',
//       body: EasyRefresh(
//         firstRefresh: true,
//         header: MaterialHeader(),
//         onRefresh: () async {
//           BaseModel baseModel =
//               await NetUtil().get(API.manage.decorationFindByld, params: {
//             "decorationId	": widget.id,
//           });
//           if (baseModel.success) {
//             _model = DecorationDetailModel.fromJson(baseModel.data);
//             _onload = false;
//           } else {
//             BotToast.showText(text: baseModel.message);
//           }
//         },
//         child: _onload
//             ? Container()
//             : ListView(
//                 padding: EdgeInsets.symmetric(vertical: 16.w),
//                 children: [
//                   _buildInfo(),
//                   widget.status > 3 ? SizedBox() : _buildFinishWorkCheck(),
//                   _buildCycleCheck(),
//                   UserTool.userProvider.infoModel.canDecorationTrack
//                       ? SizedBox()
//                       : _buildCheckDetail(),
//                 ],
//               ),
//       ),
//       bottom: Builder(builder: (context) {
//         if (UserTool.userProvider.infoModel.canDecorationDispatch) {
//           switch (widget.status) {
//             case 1:
//               return AkuBottomButton(title: '立即安排', onTap: () {});
//               break;
//             default:
//               return SizedBox();
//               break;
//           }
//         } else if (UserTool.userProvider.infoModel.canDecorationTrack) {
//           switch (widget.status) {
//             case 2:
//               return AkuBottomButton(
//                 title: '立即执行',
//                 onTap: () {
//                   // Get.to(DecorationFollowCheck(model: widget.model));
//                 },
//               );
//               break;
//             default:
//               return SizedBox();
//               break;
//           }
//         } else
//           return SizedBox();
//       }),
//     );
//   }

//   _buildInfo() {
//     return AkuTitleBox(
//       title: '装修信息',
//       spacing: 24,
//       suffix: Text(
//         DecorationUIUtil(context).getTagName(1, 2),
//         style: TextStyle(
//           color: DecorationUIUtil(context).getTagColor(1),
//           fontSize: 24.w,
//         ),
//       ),
//       children: [
//         _buildInfoCard(
//           tag: '家',
//           midTop: '人才公寓',
//           midBottom: _model.decorationFBIVo.roomName,
//           name: '业主：' + UserTool.userProvider.infoModel.nickName,
//           phone: UserTool.userProvider.profileModel.tel,
//           rightTopWidget: Transform.rotate(
//             angle: pi / 4,
//             child: widget.status == 3
//                 ? Image.asset(R.ASSETS_MANAGE_IC_WANCHENG_PNG)
//                 : Image.asset(R.ASSETS_MANAGE_IC_ZHUANGXIU_PNG),
//           ),
//         ),
//         AkuBox.h(16),
//         _buildInfoCard(
//           tag: '装',
//           midTop: _model.decorationFBIVo.constructionUnit,
//           name: '负责人：${_model.decorationFBIVo.director}',
//           phone: '${_model.decorationFBIVo.directorTel}',
//         ),
//       ],
//     );
//   }

//   _buildInfoCard({
//     String tag,
//     String midTop,
//     String midBottom,
//     String name,
//     String phone,
//     Widget rightTopWidget = const SizedBox(),
//   }) {
//     return Stack(
//       children: [
//         Container(
//           child: Column(
//             children: [
//               Expanded(
//                   child: Row(
//                 children: [
//                   AkuBox.w(32),
//                   Container(
//                     height: 96.w,
//                     width: 96.w,
//                     alignment: Alignment.center,
//                     child: Text(
//                       tag,
//                       style: TextStyle(
//                         color: AppStyle.secondaryColor,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 32.sp,
//                       ),
//                     ),
//                     decoration: BoxDecoration(
//                       color: Color(0xFFE9F2FF),
//                       borderRadius: BorderRadius.circular(48.w),
//                     ),
//                   ),
//                   AkuBox.w(24),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           midTop,
//                           style: TextStyle(
//                             color: AppStyle.primaryTextColor,
//                             fontSize: 32.sp,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         midBottom == null
//                             ? SizedBox()
//                             : Text(
//                                 midBottom,
//                                 style: TextStyle(
//                                   color: AppStyle.primaryTextColor,
//                                   fontSize: 32.sp,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                       ],
//                     ),
//                   ),
//                 ],
//               )),
//               Divider(
//                 height: 1.w,
//                 thickness: 1.w,
//               ),
//               Row(
//                 children: [
//                   AkuBox.h(88),
//                   AkuBox.w(32),
//                   Image.asset(
//                     R.ASSETS_MESSAGE_IC_PEOPLE_PNG,
//                     height: 40.w,
//                     width: 40.w,
//                   ),
//                   Text(
//                     name,
//                     style: TextStyle(
//                       color: AppStyle.minorTextColor,
//                       fontSize: 24.sp,
//                     ),
//                   ),
//                   Spacer(),
//                   Image.asset(
//                     R.ASSETS_MESSAGE_IC_PHONE_PNG,
//                     height: 40.w,
//                     width: 40.w,
//                   ),
//                   Text(
//                     '电话：$phone',
//                     style: TextStyle(
//                       color: AppStyle.minorTextColor,
//                       fontSize: 24.sp,
//                     ),
//                   ),
//                   AkuBox.w(42),
//                 ],
//               ),
//             ],
//           ),
//           height: 248.w,
//           decoration: BoxDecoration(
//             color: Color(0xFFF9F9F9),
//             borderRadius: BorderRadius.circular(8.w),
//           ),
//         ),
//         Positioned(
//           top: -30.w,
//           right: -30.w,
//           width: 140.w,
//           height: 140.w,
//           child: rightTopWidget,
//         ),
//       ],
//     );
//   }

//   ///完工检查
//   _buildFinishWorkCheck() {
//     return AkuTitleBox(
//       title: '完工检查',
//       spacing: 24,
//       children: [
//         _buildRow(
//           title: '开始装修时间',
//           subTitle: DateUtil.formatDateStr(
//             _model.decorationFBIVo.actualBegin,
//             format: 'yyyy-MM-dd',
//           ),
//         ),
//         _buildRow(
//           title: '接受人',
//           subTitle: _model.decorationFBIVo.director,
//         ),
//         _buildRow(title: '所属项目', subTitle: '装修管理'),
//         _buildRow(
//           title: '开始日期',
//           subTitle: DateUtil.formatDateStr(
//             _model.trackInspectionFBIVo.startDate,
//             format: 'yyyy-MM-dd',
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(
//             vertical: 28.w,
//           ),
//           child: Text(
//             '检查内容',
//             style: TextStyle(
//               color: AppStyle.primaryTextColor,
//               fontSize: 28.w,
//             ),
//           ),
//         ),
//         DecorationCheckRow(
//           details: [
//             CHECK_TYPE.ELECTRIC,
//             CHECK_TYPE.WATER,
//             CHECK_TYPE.WALL,
//             CHECK_TYPE.DOOR_AND_WINDOWS,
//             CHECK_TYPE.SECURITY,
//           ],
//           onChange: (details) {},
//         ),
//       ],
//     );
//   }

//   ///周期检查
//   _buildCycleCheck() {
//     return AkuTitleBox(
//       title: '周期检查',
//       spacing: 24,
//       children: [
//         _buildRow(
//           title: '开始装修时间',
//           subTitle: DateUtil.formatDateStr(
//             _model.decorationFBIVo.actualBegin,
//             format: 'yyyy-MM-dd',
//           ),
//         ),
//         _buildRow(
//           title: '接受人',
//           subTitle: '黄鑫',
//           onTap: UserTool.userProvider.infoModel.canDecorationTrack
//               ? () {
//                   // Get.to(DecorationDepartmentPage(
//                   //   model: widget.model,
//                   // )).then((value) => setState(() {}));
//                 }
//               : null,
//         ),
//         _buildRow(title: '所属项目', subTitle: '装修管理'),
//         _buildRow(
//           title: '开始日期',
//           subTitle: DateUtil.formatDateStr(
//             '2021-05-20 13:14:00',
//             format: 'yyyy-MM-dd',
//           ),
//           onTap: UserTool.userProvider.infoModel.canDecorationTrack
//               ? () {
//                   showAkuSheet(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Row(
//                           children: [
//                             AkuBox.h(96),
//                             AkuBackButton.text(),
//                             Spacer(),
//                             Text(
//                               '开始日期',
//                               style: TextStyle(
//                                 color: AppStyle.primaryTextColor,
//                                 fontSize: 32.sp,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Spacer(),
//                             AkuMaterialButton(
//                               minWidth: (64 + 56).w,
//                               onPressed: () {
//                                 Get.back();
//                               },
//                               child: Text(
//                                 '确定',
//                                 style: TextStyle(
//                                   color: AppStyle.secondaryColor,
//                                   fontSize: 28.sp,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Container(
//                           height: 500.w,
//                           child: CupertinoDatePicker(
//                             onDateTimeChanged: (dateTime) {},
//                           ),
//                         ),
//                       ],
//                     ),
//                   ).then((value) {
//                     setState(() {});
//                   });
//                 }
//               : null,
//         ),
//         _buildRow(
//           title: '检查周期',
//           subTitle: '${_model.trackInspectionFBIVo.inspectionCycle}天',
//           onTap: UserTool.userProvider.infoModel.canDecorationTrack
//               ? () {
//                   showAkuSheet(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Row(
//                           children: [
//                             AkuBox.h(96),
//                             AkuBackButton.text(),
//                             Spacer(),
//                             Text(
//                               '检查周期',
//                               style: TextStyle(
//                                 color: AppStyle.primaryTextColor,
//                                 fontSize: 32.sp,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Spacer(),
//                             AkuMaterialButton(
//                               minWidth: (64 + 56).w,
//                               onPressed: () {
//                                 Get.back();
//                               },
//                               child: Text(
//                                 '确定',
//                                 style: TextStyle(
//                                   color: AppStyle.secondaryColor,
//                                   fontSize: 28.sp,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Container(
//                           height: 500.w,
//                           child: CupertinoPicker(
//                             children: [
//                               Center(
//                                 child: Text('1天'),
//                               ),
//                               Center(
//                                 child: Text('3天'),
//                               ),
//                               Center(
//                                 child: Text('7天'),
//                               ),
//                               Center(
//                                 child: Text('14天'),
//                               ),
//                               Center(
//                                 child: Text('30天'),
//                               ),
//                             ],
//                             itemExtent: 88.w,
//                             onSelectedItemChanged: (int value) {
//                               int realValue = 0;
//                               switch (value) {
//                                 case 0:
//                                   realValue = 1;
//                                   break;
//                                 case 1:
//                                   realValue = 3;
//                                   break;
//                                 case 2:
//                                   realValue = 7;
//                                   break;
//                                 case 3:
//                                   realValue = 14;
//                                   break;
//                                 case 4:
//                                   realValue = 30;
//                                   break;
//                               }
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ).then((value) {
//                     setState(() {});
//                   });
//                 }
//               : null,
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(
//             vertical: 28.w,
//           ),
//           child: Text(
//             '检查内容',
//             style: TextStyle(
//               color: AppStyle.primaryTextColor,
//               fontSize: 28.w,
//             ),
//           ),
//         ),
//         DecorationCheckRow(
//           details: [
//             CHECK_TYPE.ELECTRIC,
//             CHECK_TYPE.WATER,
//             CHECK_TYPE.WALL,
//             CHECK_TYPE.DOOR_AND_WINDOWS,
//             CHECK_TYPE.SECURITY,
//           ],
//           onChange: (details) {},
//           canTap: UserTool.userProvider.infoModel.canDecorationTrack,
//         )
//       ],
//     );
//   }

//   ///执行信息
//   _buildCheckDetail() {
//     return AkuTitleBox(
//       title: '执行信息',
//       spacing: 24,
//       children: _model.trackRecordVos.map((e) {
//         return Container(
//           decoration: BoxDecoration(
//             border: Border(
//               bottom: BorderSide(
//                 color: Color(0xFFE8E8E8),
//                 width: 1.w,
//               ),
//             ),
//           ),
//           child: ExpandablePanel(
//             theme: ExpandableThemeData(
//               tapHeaderToExpand: true,
//               iconPlacement: ExpandablePanelIconPlacement.right,
//               iconPadding: EdgeInsets.only(top: 32.w),
//               iconSize: 32.w,
//               iconColor: AppStyle.minorTextColor,
//             ),
//             header: Row(
//               children: [
//                 AkuBox.h(96),
//                 Text(
//                   '${DateUtil.formatDateStr('2021-5-20 13:14', format: 'yyyy-MM-dd')} ' +
//                       e.typeString,
//                   style: TextStyle(
//                     color: AppStyle.primaryTextColor,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 28.sp,
//                   ),
//                 ),
//                 Spacer(),
//                 Text(
//                   3 > 2 ? '正常' : '异常',
//                   style: TextStyle(
//                     color: e.result==1
//                         ? Color(0xFF32B814)
//                         : Color(0xFFFF4501),
//                     fontSize: 28.sp,
//                   ),
//                 ),
//               ],
//             ),
//             expanded: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ...e.recordDetailVoList.map((e) {
//                   return Container(
//                     height: 96.w,
//                     decoration: BoxDecoration(
//                       border: Border(
//                         top: BorderSide(
//                           color: Color(0xFFE8E8E8),
//                           width: 1.w,
//                         ),
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         AkuBox.w(48),
//                         Image.asset(
//                           R.ASSETS_PLACEHOLDER_WEBP,
//                           height: 40.w,
//                         ),
//                         Text(
//                           e.qualifiedString,
//                           style: TextStyle(
//                             fontSize: 28.sp,
//                             color: AppStyle.primaryTextColor,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Spacer(),
//                         DecorationCheckBox(
//                           initValue: true,
//                         ),
//                         Spacer(),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border(
//                       top: BorderSide(
//                         width: 1.w,
//                         color: Color(0xFFE8E8E8),
//                       ),
//                     ),
//                   ),
//                   height: 96.w,
//                   padding: EdgeInsets.symmetric(horizontal: 32.w),
//                   alignment: Alignment.centerLeft,
//                   child: Text.rich(
//                     TextSpan(
//                       children: [
//                         TextSpan(
//                           text: '检查描述:',
//                           style: TextStyle(
//                             color: AppStyle.minorTextColor,
//                           ),
//                         ),
//                         TextSpan(
//                           text: e.description,
//                         ),
//                       ],
//                       style: TextStyle(
//                         color: AppStyle.primaryTextColor,
//                         fontSize: 28.sp,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             collapsed: null,
//           ),
//         );
//       }).toList(),
//     );
//   }

//   _buildRow({
//     String title,
//     String subTitle,
//     VoidCallback onTap,
//   }) {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         onTap: onTap,
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border(
//                 bottom: BorderSide(color: Color(0xFFE8E8E8), width: 1.w)),
//           ),
//           child: InkWell(
//             child: Row(
//               children: [
//                 AkuBox.h(96),
//                 Text(
//                   title,
//                   style: TextStyle(
//                     color: AppStyle.primaryTextColor,
//                     fontSize: 28.w,
//                   ),
//                 ),
//                 Spacer(),
//                 Text(
//                   TextUtil.isEmpty(subTitle) ? '请选择' : subTitle,
//                   style: TextStyle(
//                     color: TextUtil.isEmpty(subTitle)
//                         ? AppStyle.minorTextColor
//                         : AppStyle.primaryTextColor,
//                     fontSize: 28.w,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 onTap == null ? SizedBox() : AkuBox.w(24),
//                 onTap == null
//                     ? SizedBox()
//                     : Icon(
//                         Icons.arrow_forward_ios,
//                         size: 32.w,
//                         color: AppStyle.minorTextColor,
//                       ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
