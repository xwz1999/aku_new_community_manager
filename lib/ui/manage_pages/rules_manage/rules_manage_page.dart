// Flutter imports:
// Project imports:
import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/models/manager/rules_manage/rules_manage_list_model.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/ui/manage_pages/rules_manage/rules_manage_detail_page.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/common/bee_list_view.dart';
// Package imports:
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class RulesManagePage extends StatefulWidget {
  RulesManagePage({Key? key}) : super(key: key);

  @override
  _RulesManagePageState createState() => _RulesManagePageState();
}

class _RulesManagePageState extends State<RulesManagePage> {
  EasyRefreshController? _refreshController;
  @override
  void initState() {
    super.initState();
    _refreshController = EasyRefreshController();
  }

  @override
  void dispose() {
    _refreshController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '规程管理',
      body: BeeListView(
          path: API.manage.rulesManageList,
          controller: _refreshController,
          convert: (models) {
            return models.tableList!
                .map((e) => RulesManageListModel.fromJson(e))
                .toList();
          },
          builder: (items) {
            return ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 24.w),
                itemBuilder: (context, index) {
                  return _buildCard(items[index]);
                },
                separatorBuilder: (_, __) {
                  return 24.w.heightBox;
                },
                itemCount: items.length);
          }),
    );
  }

  Widget _buildCard(RulesManageListModel model) {
    return GestureDetector(
      onTap: () {
        Get.to(() => RulesManageDetailPage(
              model: model,
            ));
      },
      child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              model.title!.text
                  .size(32.sp)
                  .color(kTextPrimaryColor)
                  .maxLines(1)
                  .overflow(TextOverflow.ellipsis)
                  .bold
                  .make(),
              32.w.heightBox,
              model.content!.text
                  .size(24.sp)
                  .color(kTextSubColor)
                  .maxLines(3)
                  .overflow(TextOverflow.ellipsis)
                  .make(),
              32.w.heightBox,
              Row(
                children: [
                  '${S.of(context)!.tempPlotName}'
                      .text
                      .size(20.sp)
                      .color(kTextSubColor)
                      .make(),
                  Spacer(),
                  '发布于 ${DateUtil.formatDateStr(model.releaseDate!, format: 'MM-dd HH:mm')}'
                      .text
                      .size(20.sp)
                      .color(kTextSubColor)
                      .make(),
                ],
              ),
            ],
          )),
    );
  }
}
