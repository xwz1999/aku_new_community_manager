// Flutter imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/bussiness_and_fix/bussiness_and_fix_model.dart';
import 'package:aku_community_manager/models/user/user_info_model.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/tools/aku_map.dart';
import 'package:aku_community_manager/ui/sub_pages/business_and_fix/business_and_fix_detail_page.dart';
import 'package:aku_community_manager/ui/sub_pages/business_and_fix/fix_more_time_page.dart';
import 'package:aku_community_manager/ui/sub_pages/business_and_fix/fix_work_finish_page.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_chip_box.dart';

class BusinessFixCard extends StatefulWidget {
  final BussinessAndFixModel model;
  final bool homeDisplay;
  BusinessFixCard({Key key, @required this.model, this.homeDisplay = false})
      : super(key: key);

  @override
  _BusinessFixCardState createState() => _BusinessFixCardState();
}

class _BusinessFixCardState extends State<BusinessFixCard> {
  UserInfoModel get userInfoModel {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return userProvider.infoModel;
  }

  String get dateStart => DateUtil.formatDateStr(widget.model.repairDate,
      format: 'yyyy-MM-dd HH:mm:ss');

  // Widget get fixTypeWidget {
  //   if (userRole == USER_ROLE.MANAGER) {
  //     return Text(
  //       FixModel.managerRoleMap[widget.model.type],
  //       style: TextStyle(
  //         color: widget.model.status > 3
  //             ? Color(0XFFFF4501)
  //             : AppStyle.minorTextColor,
  //       ),
  //     );
  //   } else {
  //     return Text(
  //       FixModel.otherRoleMap[widget.model.type],
  //       style: TextStyle(
  //         color: widget.model.type > 3
  //             ? Color(0XFFFF4501)
  //             : AppStyle.minorTextColor,
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => BusinessAndFixDetailPage(model: widget.model));
      },
      child: Container(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                AkuChipBox(title: '报事报修'),
                AkuBox.w(16),
                Expanded(
                  child: Text(
                    dateStart,
                    style: TextStyle(
                      color: AppStyle.minorTextColor,
                      fontSize: 22.sp,
                    ),
                  ),
                ),
                Text(
                  AkuMap.fixStatus(userInfoModel.canOperation,
                      userInfoModel.canPickUpTicket, widget.model.status),
                  style: TextStyle(
                    color: widget.model.status < 4
                        ? Color(0XFFFF4501)
                        : AppStyle.minorTextColor,
                  ),
                ),
              ],
            ),
            widget.homeDisplay ? AkuBox.h(12) : AkuBox.h(24),
            Text(
              widget.model.reportDetail,
              maxLines: widget.homeDisplay ? 1 : null,
              overflow: !widget.homeDisplay
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis,
              style: TextStyle(
                color: AppStyle.primaryTextColor,
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            AkuBox.h(16),
            _buildImgs(),
            _buildBottomCard(),
          ],
        ),
        margin: EdgeInsets.only(top: 16.w),
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
          var imgObj = widget.model.imgUrls[index].url;
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            height: 168.w,
            width: 168.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.w),
            ),
            clipBehavior: Clip.antiAlias,
            child: FadeInImage.assetNetwork(
                placeholder: R.ASSETS_PLACEHOLDER_WEBP,
                image: API.image(imgObj ?? '')),
          );
        },
        itemCount: widget.model.imgUrls.length,
      ),
    );
  }

  _buildBottomCard() {
    if (userInfoModel.canPickUpTicket) {
      if (widget.model.status > 4) return SizedBox();
      return Column(
        children: [
          Divider(
            height: 48.w,
          ),
          Row(
            children: [
              Spacer(),
              widget.model.status == 3
                  ? MaterialButton(
                      padding: EdgeInsets.zero,
                      height: 64.w,
                      minWidth: 160.w,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.w),
                        side: BorderSide(
                          width: 2.w,
                          color: AppStyle.primaryColor,
                        ),
                      ),
                      child: Text(
                        '申请延时',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.sp,
                        ),
                      ),
                      onPressed: () {
                        Get.to(FixMoreTimePage(
                            dispatchId: widget.model.dispatchId));
                      },
                    )
                  : SizedBox(),
              widget.model.status == 3 ? AkuBox.w(24) : SizedBox(),
              widget.model.status == 3
                  ? AkuMaterialButton(
                      onPressed: () {
                        Get.to(() => BusinessAndFixDetailPage(
                              model: widget.model,
                            ));
                      },
                      radius: 4.w,
                      color: AppStyle.primaryColor,
                      minWidth: 160.w,
                      height: 64.w,
                      child: Text(
                        '处理完成',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.sp,
                        ),
                      ),
                    )
                  : SizedBox(),
              (widget.model.status == 2) && (!userInfoModel.canSendTicket)
                  ? AkuMaterialButton(
                      onPressed: () {
                        // final userProvider =
                        //     Provider.of<UserProvider>(context, listen: false);
                        // widget.model.detail.fixStatuses.add(FixStatus(
                        //   title: '${userProvider.userInfoModel.nickName}已接单',
                        //   date: DateTime.now(),
                        // ));
                        // widget.model.type = FIX_ENUM.PROCESSING;
                        // Get.back();
                      },
                      radius: 4.w,
                      color: AppStyle.primaryColor,
                      minWidth: 160.w,
                      height: 64.w,
                      child: Text(
                        '立即接单',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.sp,
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: [
          widget.homeDisplay ? Divider(height: 24.w) : Divider(height: 48.w),
          Align(
            alignment: Alignment.centerRight,
            child: AkuMaterialButton(
              height: 64.w,
              onPressed: () {
                Get.to(() => BusinessAndFixDetailPage(model: widget.model));
              },
              radius: 4,
              color: AppStyle.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                '查看详情',
                style: TextStyle(
                  color: AppStyle.primaryTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 28.sp,
                  height: 40 / 28,
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
