// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/mock_models/decoration/decoration_model.dart';
import 'package:aku_community_manager/mock_models/users/user_info_model.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/sub_pages/decoration_manager/decoration_manager_detail_page.dart';
import 'package:aku_community_manager/ui/sub_pages/decoration_manager/decoration_util.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_chip_box.dart';

class DecorationManagerCard extends StatefulWidget {
  final DecorationModel model;
  DecorationManagerCard({Key key, @required this.model}) : super(key: key);

  @override
  _DecorationManagerCardState createState() => _DecorationManagerCardState();
}

class _DecorationManagerCardState extends State<DecorationManagerCard> {
  USER_ROLE get role =>
      Provider.of<UserProvider>(context, listen: false).userInfoModel.role;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.w),
      padding: EdgeInsets.all(24.w),
      child: Column(
        children: [
          Row(
            children: [
              AkuChipBox(title: '装修管理'),
              AkuBox.w(16),
              Text(
                DateUtil.formatDate(
                  widget.model.decorationDate,
                  format: 'yyyy-MM-dd HH:mm:ss',
                ),
                style: TextStyle(
                  color: AppStyle.minorTextColor,
                  fontSize: 22.w,
                ),
              ),
              Spacer(),
              Text(
                DecorationUIUtil(context).getTagName(
                  widget.model.type,
                  widget.model.statusType,
                ),
                style: TextStyle(
                  color: DecorationUIUtil(context).getTagColor(
                    widget.model.type,
                    widget.model.statusType,
                  ),
                  fontSize: 24.w,
                ),
              ),
            ],
          ),
          AkuBox.h(24),
          _buildTile(
            R.ASSETS_MANAGE_HOME_PNG,
            '小区名称',
            widget.model.userHomeModel.plot,
          ),
          AkuBox.h(12),
          _buildTile(
            R.ASSETS_MANAGE_ADDRESS_PNG,
            '详细地址',
            widget.model.userHomeModel.detailAddr,
          ),
          AkuBox.h(12),
          _buildTile(
            R.ASSETS_MANAGE_DECORATION_PNG,
            '装修公司',
            widget.model.decorationTeamModel.name,
          ),
          AkuBox.h(12),
          _buildTile(
            R.ASSETS_MANAGE_STATUS_PNG,
            '装修状态',
            widget.model.statusTypeValue,
          ),
          Divider(
            height: 48.w,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: AkuMaterialButton(
              onPressed: () {
                Get.to(DecorationManagerDetailPage(model: widget.model));
              },
              height: 64.w,
              minWidth: 160.w,
              color: AppStyle.primaryColor,
              child: Text(
                '查看详情',
                style: TextStyle(
                  color: AppStyle.primaryTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 28.w,
                ),
              ),
              radius: 4.w,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
    );
  }

  _buildTile(String path, String title, String subTitle) {
    return Row(
      children: [
        Image.asset(
          path,
          height: 40.w,
          width: 40.w,
        ),
        Text(
          title,
          style: TextStyle(
            color: AppStyle.minorTextColor,
            fontSize: 28.sp,
          ),
        ),
        Spacer(),
        Text(
          subTitle,
          style: TextStyle(
            color: AppStyle.primaryTextColor,
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
