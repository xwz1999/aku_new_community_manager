import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/user_tool.dart';
import 'package:aku_community_manager/ui/manage_pages/house_keeping/house_keeping_detail_page.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_chip_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

// class HouseKeepingCard extends StatefulWidget {
//   final HouseKeepingListModel model;
//   HouseKeepingCard({Key? key, required this.model}) : super(key: key);

//   @override
//   _HouseKeepingCardState createState() => _HouseKeepingCardState();
// }

// class _HouseKeepingCardState extends State<HouseKeepingCard> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       minWidth: double.infinity,
//       color: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.w)),
//       elevation: 0,
//       padding: EdgeInsets.all(24.w),
//       onPressed: () {
//         Get.to(() => HouseKeepingDetailPage(model:widget.model));
//       },
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               '家政服务'.text.size(32.sp).color(kTextPrimaryColor).bold.make(),
//               Spacer(),
//             ],
//           ),
//           16.w.heightBox,
//           AkuDivider.horizontal(),
//           24.w.heightBox,
//           ...<Widget>[
//             _rowTile(
//                 R.ASSETS_MANAGE_IC_RENWU_PNG,
//                 '房产名称',
//                 widget.model.roomName!.text
//                     .size(24.sp)
//                     .color(kTextSubColor)
//                     .make()),
//             _rowTile(
//                 R.ASSETS_MANAGE_IC_RENWU_PNG,
//                 '人数',
//                 widget.model.num
//                     .toString()
//                     .text
//                     .size(24.sp)
//                     .color(kTextSubColor)
//                     .make()),
//             _rowTile(
//                 R.ASSETS_MANAGE_IC_RENWU_PNG,
//                 '负责人姓名',
//                 widget.model.leaderName!.text
//                     .size(24.sp)
//                     .color(kTextSubColor)
//                     .make()),
//             _rowTile(
//                 R.ASSETS_MESSAGE_IC_PHONE_PNG,
//                 '负责人手机',
//                 widget.model.leaderTel!.text
//                     .size(24.sp)
//                     .color(kTextSubColor)
//                     .make()),
//           ].sepWidget(separate: 12.w.heightBox),
//         ],
//       ),
//     );
//   }

//   Widget _rowTile(String iconPath, String title, Widget content) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 40.w,
//           height: 40.w,
//           child: Image.asset(iconPath),
//         ),
//         12.w.widthBox,
//         title.text.size(24.sp).color(kTextSubColor).make(),
//         Spacer(),
//         content,
//       ],
//     );
//   }
// }
class HouseKeepingCard extends StatelessWidget {
  final VoidCallback callRefresh;
  const HouseKeepingCard({Key? key, required this.callRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Get.to(() => HouseKeepingDetailPage());
        callRefresh();
      },
      child: Container(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                AkuChipBox(title: '家政服务'),
                16.w.widthBox,
                Expanded(
                  child: Text(
                    'dateStart',
                    style: TextStyle(
                      color: AppStyle.minorTextColor,
                      fontSize: 22.sp,
                    ),
                  ),
                ),
                Text(
                  // widget.hasFinished
                  //     ? '已处理'
                  //     : AkuMap.fixStatus(userInfoModel!.canSendTicket,

                  // userInfoModel!.canPickUpTicket, widget.model.status!),
                  '',
                  style:
                      //  widget.hasFinished
                      true
                          ? TextStyle(color: AppStyle.minorTextColor)
                          : TextStyle(
                              // color: widget.model.status! < 4
                              //     ? Color(0XFFFF4501)
                              //     : AppStyle.minorTextColor,
                              ),
                ),
              ],
            ),
            24.w.heightBox,
            Text(
              // widget.model.reportDetail!
              '',
              // maxLines: widget.homeDisplay ? 1 : null,
              // overflow: !widget.homeDisplay
              //     ? TextOverflow.visible
              //     : TextOverflow.ellipsis,
              style: TextStyle(
                color: AppStyle.primaryTextColor,
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            16.w.heightBox,
            _buildImgs(),
            // !widget.canSeeBottomButton ? SizedBox() : _getBottomCard(),
            _getBottomCard()
          ],
        ),
        // margin:
        //     widget.homeDisplay ? EdgeInsets.zero : EdgeInsets.only(top: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.w),
        ),
      ),
    );
  }

  _buildImgs() {
    return Container(
      height: 168.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // var imgObj = widget.model.imgUrls![index].url;
          var imgObj = '';
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            height: 168.w,
            width: 168.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.w),
            ),
            clipBehavior: Clip.antiAlias,
            child: FadeInImage.assetNetwork(
                placeholder: R.ASSETS_PLACEHOLDER_WEBP, image: API.image('')),
          );
        },
        // itemCount: widget.model.imgUrls!.length,
        itemCount: 1,
      ),
    );
  }

  _getBottomCard() {
    return Column(
      children: [
        Divider(height: 48.w),
        Align(
            alignment: Alignment.centerRight,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: _getButtons())),
      ],
    );
  }

  _getButtons() {
    switch (1) {
      case 1:
        return [
          AkuMaterialButton(
            height: 64.w,
            onPressed: () async {
              // Get.to(() => BusinessAndFixDetailPage(model: widget.model));
              // if (widget.callRefresh != null) {
              //   widget.callRefresh!();
              // }
            },
            radius: 4,
            color: AppStyle.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              (UserTool.userProvider.infoModel!.canSendTicket
                  ? '立即派单'
                  : '查看详情'),
              style: TextStyle(
                color: AppStyle.primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 28.sp,
                height: 40 / 28,
              ),
            ),
          ),
        ];
      case 2:
        return [
          AkuMaterialButton(
            height: 64.w,
            onPressed: () async {
              // Get.to(() => BusinessAndFixDetailPage(model: widget.model));
              // if (widget.callRefresh != null) {
              //   widget.callRefresh!();
              // }
            },
            radius: 4,
            color: AppStyle.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              (UserTool.userProvider.infoModel!.canSendTicket
                  ? '改派'
                  : UserTool.userProvider.infoModel!.canPickUpTicket
                      ? '立即接单'
                      : '查看详情'),
              style: TextStyle(
                color: AppStyle.primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 28.sp,
                height: 40 / 28,
              ),
            ),
          ),
        ];
      case 3:
        return [
          UserTool.userProvider.infoModel!.canPickUpTicket
              ? AkuMaterialButton(
                  height: 64.w,
                  onPressed: () async {
                    // Get.to(() => Get.to(() =>
                    //     FixMoreTimePage(dispatchId: widget.model.dispatchId!)));
                    // if (widget.callRefresh != null) {
                    //   widget.callRefresh!();
                    // }
                  },
                  radius: 4,
                  color: AppStyle.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    ('申请延时'),
                    style: TextStyle(
                      color: AppStyle.primaryTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.sp,
                      height: 40 / 28,
                    ),
                  ),
                )
              : SizedBox(),
          AkuMaterialButton(
            height: 64.w,
            onPressed: () async {
              // Get.to(() => BusinessAndFixDetailPage(model: widget.model));
              // if (widget.callRefresh != null) {
              //   widget.callRefresh!();
              // }
            },
            radius: 4,
            color: AppStyle.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              (UserTool.userProvider.infoModel!.canPickUpTicket
                  ? '处理完成'
                  : '查看详情'),
              style: TextStyle(
                color: AppStyle.primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 28.sp,
                height: 40 / 28,
              ),
            ),
          ),
        ];
      case 4:
        return [
          AkuMaterialButton(
            height: 64.w,
            onPressed: () async {
              // Get.to(() => BusinessAndFixDetailPage(model: widget.model));
              // if (widget.callRefresh != null) {
              //   widget.callRefresh!();
              // }
            },
            radius: 4,
            color: AppStyle.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              ('查看详情'),
              style: TextStyle(
                color: AppStyle.primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 28.sp,
                height: 40 / 28,
              ),
            ),
          ),
        ];
      default:
        return [];
    }
  }
}
