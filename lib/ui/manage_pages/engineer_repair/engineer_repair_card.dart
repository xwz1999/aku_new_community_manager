import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/json_models/manager/engineer_repair/engineer_repair_list_model.dart';
import 'package:aku_community_manager/models/user/user_info_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/user_tool.dart';
import 'package:aku_community_manager/ui/manage_pages/engineer_repair/engineer_repair_map.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_chip_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class EngineerRepairCard extends StatelessWidget {
  final EngineerRepairListModel model;
  final VoidCallback callRefresh;

  const EngineerRepairCard(
      {Key? key, required this.model, required this.callRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
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
                AkuChipBox(title: '公区维修'),
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
                  '${ERMap.statusString(model.status)}',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            24.w.heightBox,
            Text(
              model.reportDetail,
              overflow: TextOverflow.visible,
              style: TextStyle(
                color: AppStyle.primaryTextColor,
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            16.w.heightBox,
            _buildImgs(),
            _getBottomCard(),
          ],
        ),
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
          var imgObj = model.imgUrls[index].url;
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
        itemCount: model.imgUrls.length,
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
              callRefresh();
            },
            radius: 4,
            color: AppStyle.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              (UserTool.userProvider.infoModel!.engineeringRepairAuthority ==
                      ERAUTH.SENDTOCOMPANY
                  ? '分派单位'
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
              callRefresh();
            },
            radius: 4,
            color: AppStyle.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              (UserTool.userProvider.infoModel!.engineeringRepairAuthority ==
                      ERAUTH.SENDTOPERSON
                  ? '指派人员'
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
          UserTool.userProvider.infoModel!.engineeringRepairAuthority ==
                  ERAUTH.PICK
              ? AkuMaterialButton(
                  height: 64.w,
                  onPressed: () async {
                    callRefresh();
                  },
                  radius: 4,
                  color: AppStyle.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    ('立即接单'),
                    style: TextStyle(
                      color: AppStyle.primaryTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.sp,
                      height: 40 / 28,
                    ),
                  ),
                )
              : SizedBox(),
          12.w.widthBox,
          AkuMaterialButton(
            height: 64.w,
            onPressed: () async {
              callRefresh();
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
      case 4:
        return [
          AkuMaterialButton(
            height: 64.w,
            onPressed: () async {
              callRefresh();
            },
            radius: 4,
            color: AppStyle.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              ('汇报进度'),
              style: TextStyle(
                color: AppStyle.primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 28.sp,
                height: 40 / 28,
              ),
            ),
          ),
        ];case 5:
      case 6:
      return [
        AkuMaterialButton(
          height: 64.w,
          onPressed: () async {
            callRefresh();
          },
          radius: 4,
          color: AppStyle.primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            ('验收记录'),
            style: TextStyle(
              color: AppStyle.primaryTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 28.sp,
              height: 40 / 28,
            ),
          ),
        ),
      ];
      case 7:
        return [
          AkuMaterialButton(
            height: 64.w,
            onPressed: () async {
              callRefresh();
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
