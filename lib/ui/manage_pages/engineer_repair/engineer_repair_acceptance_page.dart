import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/json_models/manager/engineer_repair/engineer_repair_detail_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_title_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'engineer_repair_map.dart';

class EngineerRepairAcceptancePage extends StatefulWidget {
  final EngineerRepairDetailModel detailModel;
  const EngineerRepairAcceptancePage({Key? key, required this.detailModel})
      : super(key: key);

  @override
  _EngineerRepairAcceptancePageState createState() =>
      _EngineerRepairAcceptancePageState();
}

class _EngineerRepairAcceptancePageState
    extends State<EngineerRepairAcceptancePage> {
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '验收审核',
      body: ListView(
        children: [],
      ),
    );
  }

  _buildInfo() {
    return AkuTitleBox(
      title: '报修信息',
      suffix: Text(
        ERMap.statusString(widget.detailModel.status),
        style: TextStyle(color: Color(0xFFFF4501)),
      ),
      children: [
        AkuBox.h(16),
        _buildTile(
          R.ASSETS_MESSAGE_IC_PEOPLE_PNG,
          '报修人',
          widget.detailModel.createName,
        ),
        _buildTile(
          R.ASSETS_MESSAGE_IC_PHONE_PNG,
          '联系电话',
          widget.detailModel.createTel,
        ),
        _buildTile(R.ASSETS_MESSAGE_IC_AREA_PNG, '报修区域',
            '${S.of(context)!.tempPlotName}'),
        AkuBox.h(8),
        Text(
          widget.detailModel.reportDetail,
          style: TextStyle(
            color: AppStyle.primaryTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 28.w,
          ),
        ),
        GridView(
          padding: EdgeInsets.only(top: 16.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.w,
          ),
          children: widget.detailModel.imgUrls.map((e) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(4.w),
              child: FadeInImage.assetNetwork(
                  placeholder: R.ASSETS_PLACEHOLDER_WEBP,
                  image: API.image(e.url!)),
            );
          }).toList(),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }

  Widget _buildTile(String asset, String title, String subTitle) {
    return Row(
      children: [
        AkuBox.h(56),
        Image.asset(
          asset,
          height: 40.w,
          width: 40.w,
        ),
        AkuBox.w(4),
        Text(
          title,
          style: TextStyle(
            fontSize: 28.sp,
            color: AppStyle.minorTextColor,
          ),
        ),
        Spacer(),
        Text(
          subTitle,
          style: TextStyle(
            fontSize: 28.sp,
            color: AppStyle.primaryTextColor,
          ),
        ),
      ],
    );
  }
}
