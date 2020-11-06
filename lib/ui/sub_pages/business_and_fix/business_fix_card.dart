import 'package:aku_community_manager/mock_models/fix/fix_model.dart';
import 'package:aku_community_manager/mock_models/users/user_info_model.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/sub_pages/business_and_fix/business_and_fix_detail_page.dart';
import 'package:aku_community_manager/ui/sub_pages/business_and_fix/fix_more_time_page.dart';
import 'package:aku_community_manager/ui/sub_pages/business_and_fix/fix_work_finish_page.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_chip_box.dart';
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:common_utils/common_utils.dart';
import 'package:extended_text/extended_text.dart';
import 'package:flutter/material.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class BusinessFixCard extends StatefulWidget {
  final FixModel model;
  final bool homeDisplay;
  BusinessFixCard({Key key, @required this.model, this.homeDisplay = false})
      : super(key: key);

  @override
  _BusinessFixCardState createState() => _BusinessFixCardState();
}

class _BusinessFixCardState extends State<BusinessFixCard> {
  USER_ROLE get userRole {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return userProvider.userInfoModel.role;
  }

  String get dateStart => DateUtil.formatDate(widget.model.dateStart,
      format: 'yyyy-MM-dd HH:mm:ss');

  Widget get fixTypeWidget {
    if (userRole == USER_ROLE.MANAGER) {
      return Text(
        FixModel.managerRoleMap[widget.model.type],
        style: TextStyle(
          color: widget.model.type != FIX_ENUM.DONE
              ? Color(0XFFFF4501)
              : AppStyle.minorTextColor,
        ),
      );
    } else {
      return Text(
        FixModel.otherRoleMap[widget.model.type],
        style: TextStyle(
          color: widget.model.type != FIX_ENUM.DONE
              ? Color(0XFFFF4501)
              : AppStyle.minorTextColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(BusinessAndFixDetailPage(model: widget.model));
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
                fixTypeWidget,
              ],
            ),
            widget.homeDisplay ? AkuBox.h(12) : AkuBox.h(24),
            Text(
              widget.model.title,
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
          var imgObj = widget.model.imgs[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            height: 168.w,
            width: 168.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.w),
              image: DecorationImage(
                  image: (imgObj is String)
                      ? AssetImage(imgObj)
                      : FileImage(imgObj)),
            ),
          );
        },
        itemCount: widget.model.imgs.length,
      ),
    );
  }

  _buildBottomCard() {
    switch (userRole) {
      case USER_ROLE.FIXER:
        if (widget.model.type == FIX_ENUM.DONE) return SizedBox();
        return Column(
          children: [
            Divider(
              height: 48.w,
            ),
            Row(
              children: [
                Spacer(),
                widget.model.type == FIX_ENUM.PROCESSING
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
                          Get.to(FixMoreTimePage(model: widget.model));
                        },
                      )
                    : SizedBox(),
                widget.model.type == FIX_ENUM.PROCESSING
                    ? AkuBox.w(24)
                    : SizedBox(),
                widget.model.type == FIX_ENUM.PROCESSING
                    ? AkuMaterialButton(
                        onPressed: () {
                          Get.to(FixWorkFinishPage(model: widget.model));
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
                widget.model.type == FIX_ENUM.WAIT_PICKUP
                    ? AkuMaterialButton(
                        onPressed: () {
                          final userProvider =
                              Provider.of<UserProvider>(context, listen: false);
                          widget.model.detail.fixStatuses.add(FixStatus(
                            title: '${userProvider.userInfoModel.nickName}已接单',
                            date: DateTime.now(),
                          ));
                          widget.model.type = FIX_ENUM.PROCESSING;
                          Get.back();
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
        break;
      default:
        return Column(
          children: [
            widget.homeDisplay ? Divider(height: 24.w) : Divider(height: 48.w),
            Align(
              alignment: Alignment.centerRight,
              child: AkuMaterialButton(
                height: 64.w,
                onPressed: () {
                  Get.to(BusinessAndFixDetailPage(model: widget.model));
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
        break;
    }
  }
}
