// Flutter imports:
import 'package:aku_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/bussiness_and_fix/bussiness_and_fix_model.dart';
import 'package:aku_community_manager/models/user/user_info_model.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/aku_divider.dart';
import 'package:aku_community_manager/tools/aku_map.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/sub_pages/business_and_fix/business_and_fix_detail_page.dart';
import 'package:aku_community_manager/ui/sub_pages/business_and_fix/fix_more_time_page.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_chip_box.dart';

class BusinessFixCard extends StatefulWidget {
  final BussinessAndFixModel model;
  final bool homeDisplay;
  final bool canSeeBottomButton;
  final VoidCallback callRefresh;
  //是否是报事保修处理完成页面调用
  final bool hasFinished;
  BusinessFixCard(
      {Key key,
      @required this.model,
      this.homeDisplay = false,
      this.canSeeBottomButton = true,
      this.callRefresh,
      this.hasFinished = false})
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
      onTap: () async {
        await Get.to(() => BusinessAndFixDetailPage(model: widget.model));
        if (widget.callRefresh != null) {
          widget.callRefresh();
        }
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
                  widget.hasFinished
                      ? '已处理'
                      : AkuMap.fixStatus(userInfoModel.canSendTicket,
                          userInfoModel.canPickUpTicket, widget.model.status),
                  style: widget.hasFinished
                      ? TextStyle(color: AppStyle.minorTextColor)
                      : TextStyle(
                          color: widget.model.status < 4
                              ? Color(0XFFFF4501)
                              : AppStyle.minorTextColor,
                        ),
                ),
              ],
            ),
            AkuBox.h(24),
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
            !widget.canSeeBottomButton ? SizedBox() : _buildBottomCard(),
          ],
        ),
        margin:
            widget.homeDisplay ? EdgeInsets.zero : EdgeInsets.only(top: 16.w),
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
    if (widget.model.status > 4) {
      return Column(
        children: [
          Divider(height: 48.w),
          Align(
            alignment: Alignment.centerRight,
            child: AkuMaterialButton(
              height: 64.w,
              onPressed: () async {
                Get.to(() => BusinessAndFixDetailPage(model: widget.model));
                if (widget.callRefresh != null) {
                  widget.callRefresh();
                }
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
    } else {
      return Column(
        children: [
          AkuBox.h(24),
          AkuDivider.horizontal(),
          AkuBox.h(24),
          Row(
            children: [
              Spacer(),
              (widget.model.status == 3) && (userInfoModel.canPickUpTicket)
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
              ...widget.model.status == 3 && (userInfoModel.canPickUpTicket)
                  ? [
                      AkuBox.w(24),
                      AkuMaterialButton(
                        onPressed: () async {
                          await Get.to(() => BusinessAndFixDetailPage(
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
                    ]
                  : [SizedBox()],
              (widget.model.status == 2) && (userInfoModel.canPickUpTicket)
                  ? AkuMaterialButton(
                      onPressed: () async {
                        await Get.to(() => BusinessAndFixDetailPage(
                              model: widget.model,
                            ));
                        if (widget.callRefresh != null) {
                          widget.callRefresh();
                        }
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
              (widget.model.status == 1)
                  ? AkuMaterialButton(
                      onPressed: () async {
                        await Get.to(() => BusinessAndFixDetailPage(
                              model: widget.model,
                            ));
                        if (widget.callRefresh != null) {
                          widget.callRefresh();
                        }
                      },
                      radius: 4.w,
                      color: AppStyle.primaryColor,
                      minWidth: 160.w,
                      height: 64.w,
                      child: Text(
                        '${(userInfoModel.canSendTicket) ? '立即派单' : '查看详情'}',
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
    }
  }
}
