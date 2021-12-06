import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/json_models/manager/engineer_repair/engineer_repair_new_acceptance_record_model.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class EngineerRepairAcceptanceRecordListPage extends StatefulWidget {
  final List<EngineerRepairNewAcceptanceRecordModel> models;

  const EngineerRepairAcceptanceRecordListPage({Key? key, required this.models})
      : super(key: key);

  @override
  _EngineerRepairAcceptanceRecordListPageState createState() =>
      _EngineerRepairAcceptanceRecordListPageState();
}

class _EngineerRepairAcceptanceRecordListPageState
    extends State<EngineerRepairAcceptanceRecordListPage> {
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '验收记录',
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
        children: widget.models
            .mapIndexed(
                (currentValue, index) => _buildCard(currentValue, index))
            .toList(),
      ),
    );
  }

  Widget _buildCard(EngineerRepairNewAcceptanceRecordModel model, index) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              '${S.of(context)!.tempPlotName}'
                  .text
                  .size(32.sp)
                  .color(kTextPrimaryColor)
                  .make(),
              Spacer(),
              '${model.results == 1 ? '通过' : '驳回'}'
                  .text
                  .size(32.sp)
                  .color(Colors.red)
                  .make(),
            ],
          ),
          40.w.heightBox,
          Row(
            children: [
              '验收人'.text.size(28.sp).color(kTextSubColor).make(),
              Spacer(),
              model.acceptancePeopleName.text
                  .size(28.sp)
                  .color(kTextPrimaryColor)
                  .make(),
            ],
          ),
          40.w.heightBox,
          '现场情况'.text.size(28.sp).color(kTextSubColor).make(),
          24.w.heightBox,
          model.advice.text.size(28.sp).color(kTextPrimaryColor).make(),
          40.w.heightBox,
          '现场照片'.text.size(28.sp).color(kTextSubColor).make(),
          24.w.heightBox,
          if (model.acceptanceImgLists != null)
            GridView(
              padding: EdgeInsets.only(top: 16.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.w,
              ),
              children: model.acceptanceImgLists!.map((e) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(4.w),
                  child: FadeInImage.assetNetwork(
                      placeholder: R.ASSETS_PLACEHOLDER_WEBP,
                      image: API.image(e.url!),imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(R.ASSETS_PLACEHOLDER_WEBP,);
                  },),
                );
              }).toList(),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            ),
          40.w.heightBox,
          Row(
            children: [
              '反馈时间'.text.size(28.sp).color(kTextSubColor).make(),
              Spacer(),
              model.acceptanceDate.text
                  .size(28.sp)
                  .color(kTextPrimaryColor)
                  .make(),
            ],
          ),
        ],
      ),
    );
  }
}
