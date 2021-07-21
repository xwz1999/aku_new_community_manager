import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/json_models/manager/house_keeping/house_keeping_list_model.dart';
import 'package:aku_community_manager/json_models/manager/house_keeping/house_keeping_process_model.dart';
import 'package:aku_community_manager/models/user/user_info_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/user_tool.dart';
import 'package:aku_community_manager/ui/manage_pages/house_keeping/house_keeping_department_page.dart';
import 'package:aku_community_manager/ui/manage_pages/house_keeping/house_keeping_detail_page.dart';
import 'package:aku_community_manager/ui/manage_pages/house_keeping/house_keeping_func.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_chip_box.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class HouseKeepingCard extends StatelessWidget {
  final VoidCallback callRefresh;
  final HouseKeepingListModel model;
  const HouseKeepingCard(
      {Key? key, required this.callRefresh, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        List<HouseKeepingProcessModel> processModels =
            await HouseKeepingFunc.getHouseKeepingProcess(
          model.id,
        );
        await Get.to(() => HouseKeepingDetailPage(
              model: model,
              processModels: processModels,
              callRefresh: callRefresh,
            ));
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
                    model.createDate,
                    style: TextStyle(
                      color: AppStyle.minorTextColor,
                      fontSize: 22.sp,
                    ),
                  ),
                ),
                Text(
                  model.statusString,
                  style: TextStyle(color: Color(0xFFFF4501)),
                ),
              ],
            ),
            24.w.heightBox,
            Text(
              model.content,
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
          var imgObj = model.submitImgList[index].url;
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
                image: API.image(imgObj!)),
          );
        },
        itemCount: model.submitImgList.length,
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
    switch (model.status) {
      case 1:
        return [
          AkuMaterialButton(
            height: 64.w,
            onPressed: () async {
              (UserTool.userProvider.infoModel!.houseKeepingAuthority ==
                      HKAUTH.SEND)
                  ? Get.to(() => HouseKeepingDepartmentPage(
                        id: model.id,
                        callRefresh: callRefresh,
                      ))
                  : null;
            },
            radius: 4,
            color: AppStyle.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              (UserTool.userProvider.infoModel!.houseKeepingAuthority ==
                      HKAUTH.SEND
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
              Function cancel = BotToast.showLoading();
              (UserTool.userProvider.infoModel!.houseKeepingAuthority ==
                      HKAUTH.SEND)
                  ? await HouseKeepingFunc.newHouseKeepingUrgeWork(model.id)
                  : await HouseKeepingFunc.newHouseKeepingOrderReceive(
                      model.id);
              cancel();
            },
            radius: 4,
            color: AppStyle.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              (UserTool.userProvider.infoModel!.houseKeepingAuthority ==
                      HKAUTH.PICK
                  ? '立即接单'
                  : '催单'),
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
                  onPressed: () async {},
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
                )
              : SizedBox(),
          AkuMaterialButton(
            height: 64.w,
            onPressed: () async {
              await launch(model.proposerTel);
            },
            radius: 4,
            color: AppStyle.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              ('联系住户'),
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
            onPressed: () async {},
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
      case 5:
        return [
          AkuMaterialButton(
            height: 64.w,
            onPressed: () async {},
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
      case 6:
        return [
          AkuMaterialButton(
            height: 64.w,
            onPressed: () async {},
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
      case 9:
        return [
          AkuMaterialButton(
            height: 64.w,
            onPressed: () async {},
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
      case 10:
        return [
          AkuMaterialButton(
            height: 64.w,
            onPressed: () async {},
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
