import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/json_models/manager/house_keeping/house_keeping_list_model.dart';
import 'package:aku_community_manager/json_models/manager/house_keeping/house_keeping_process_model.dart';
import 'package:aku_community_manager/models/user/user_info_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/aku_divider.dart';
import 'package:aku_community_manager/tools/user_tool.dart';
import 'package:aku_community_manager/ui/manage_pages/house_keeping/house_keeping_department_page.dart';
import 'package:aku_community_manager/ui/manage_pages/house_keeping/house_keeping_feed_back_page.dart';
import 'package:aku_community_manager/ui/manage_pages/house_keeping/house_keeping_func.dart';
import 'package:aku_community_manager/ui/widgets/app_widgets/bee_grid_image_view.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_title_box.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:aku_community_manager/utils/extension/list_extension.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HouseKeepingDetailPage extends StatefulWidget {
  final HouseKeepingListModel model;
  final List<HouseKeepingProcessModel> processModels;
  final VoidCallback callRefresh;
  HouseKeepingDetailPage(
      {Key? key,
      required this.model,
      required this.processModels,
      required this.callRefresh})
      : super(key: key);

  @override
  _HouseKeepingDetailPageState createState() => _HouseKeepingDetailPageState();
}

class _HouseKeepingDetailPageState extends State<HouseKeepingDetailPage> {
  @override
  Widget build(BuildContext context) {
    var payfeePrice = Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
      color: Colors.white,
      child: Row(
        children: [
          '服务费用'.text.size(28.sp).black.make(),
          Spacer(),
          '¥ ${widget.model.payFee}'.text.size(32.sp).color(Colors.red).make()
        ],
      ),
    );
    return AkuScaffold(
      title: '服务详情',
      body: ListView(
        children: <Widget>[
          _buildInfo(),
          _buildProcess(),
          if (widget.model.handlingTime != null) _serviceFeedBack(),
          if (widget.model.payFee != null) payfeePrice,
          if (widget.model.evaluationTime != null) _buildEvaluate(),
          16.w.heightBox,
        ].sepWidget(separate: 16.w.heightBox),
      ),
      bottom: _getBottomButtons(widget.model.status),
    );
  }

  Widget _getBottomButtons(int status) {
    switch (status) {
      case 1:
        return AkuBottomButton(
          title: '立即派单',
          onTap: () {
            Get.to(() => HouseKeepingDepartmentPage(
                id: widget.model.id, callRefresh: widget.callRefresh));
          },
        );
      case 2:
        return UserTool.userProvider.infoModel!.houseKeepingAuthority ==
                HKAUTH.PICK
            ? AkuBottomButton(
                title: '立即接单',
                onTap: () async {
                  bool reslut =
                      await await HouseKeepingFunc.newHouseKeepingOrderReceive(
                          widget.model.id);
                  if (reslut) {
                    Get.back();
                  }
                },
              )
            : SizedBox();
      case 3:
        return AkuBottomButton(
          title: '提交报告',
          onTap: () {
            Get.to(() => HouseKeepingFeedBackPage(
                model: widget.model, callRefresh: widget.callRefresh));
          },
        );
      case 4:
        return AkuBottomButton(
          title: '联系用户',
          onTap: () async {
            await launch('tel:${widget.model.proposerTel}');
          },
        );
      default:
        return SizedBox();
    }
  }

  Widget _serviceFeedBack() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          '服务反馈'.text.size(36.sp).bold.black.make(),
          40.w.heightBox,
          Row(
            children: [
              '完成情况'.text.size(28.sp).color(kTextSubColor).make(),
              Spacer(),
              widget.model.completionString.text.size(32.sp).black.make()
            ],
          ),
          40.w.heightBox,
          Row(
            children: [
              Image.asset(
                R.ASSETS_PLACEHOLDER_WEBP,
                width: 40.w,
                height: 40.w,
              ),
              8.w.widthBox,
              '维修人'.text.size(28.sp).color(kTextSubColor).make(),
              Spacer(),
              widget.model.handlerName!.text.size(28.sp).black.make(),
            ],
          ),
          16.w.heightBox,
          Row(
            children: [
              Image.asset(
                R.ASSETS_PLACEHOLDER_WEBP,
                width: 40.w,
                height: 40.w,
              ),
              8.w.widthBox,
              '联系电话'.text.size(28.sp).color(kTextSubColor).make(),
              Spacer(),
              widget.model.handlerTel!.text.size(28.sp).black.make(),
            ],
          ),
          16.w.heightBox,
          40.w.heightBox,
          '处理描述'.text.size(28.sp).color(kTextSubColor).make(),
          24.w.heightBox,
          widget.model.processDescription!.text
              .size(2)
              .black
              .softWrap(true)
              .make(),
          BeeGridImageView(
              urls:
                  widget.model.handlerImgList.map((e) => e.url ?? '').toList())
        ],
      ),
    );
  }

  Widget _buildEvaluate() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 24.w),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          '服务评价'.text.size(36.sp).bold.black.make(),
          40.w.heightBox,
          Row(
            children: [
              '综合评价'.text.size(28.sp).color(kTextSubColor).make(),
              40.w.widthBox,
              RatingBar(
                  ignoreGestures: true,
                  allowHalfRating: true,
                  itemPadding: EdgeInsets.symmetric(horizontal: 15.w),
                  itemSize: 32.w,
                  initialRating: (widget.model.evaluation!).toDouble(),
                  ratingWidget: RatingWidget(
                      empty: Icon(
                        CupertinoIcons.star,
                      ),
                      full: Icon(
                        CupertinoIcons.star_fill,
                        color: kPrimaryColor,
                      ),
                      half: Icon(
                        CupertinoIcons.star_lefthalf_fill,
                        color: kPrimaryColor,
                      )),
                  onRatingUpdate: (value) {})
            ],
          ),
          40.w.heightBox,
          AkuDivider.horizontal(),
          40.w.heightBox,
          widget.model.evaluationContent!.text
              .size(28.sp)
              .black
              .softWrap(true)
              .make(),
          BeeGridImageView(
              urls: widget.model.evaluationImgList
                  .map((e) => e.url ?? '')
                  .toList())
        ],
      ),
    );
  }

  _buildInfo() {
    return AkuTitleBox(
      title: '服务信息',
      suffix: widget.model.statusString.text
          .size(28.sp)
          .color(Color(0xFFFF4501))
          .make(),
      children: [
        16.w.heightBox,
        _buildTile(
            R.ASSETS_MESSAGE_IC_PEOPLE_PNG, '申请人', widget.model.proposerName),
        _buildTile(
            R.ASSETS_MESSAGE_IC_PHONE_PNG, '联系电话', widget.model.proposerTel),
        _buildTile(R.ASSETS_MESSAGE_IC_AREA_PNG, '地址',
            '${S.of(Get.context!)?.tempPlotName ?? ''}·${widget.model.roomName}'),
        8.w.heightBox,
        Text(
          widget.model.content,
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
          children: widget.model.submitImgList.map((e) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(4.w),
              child: FadeInImage.assetNetwork(
                  placeholder: R.ASSETS_PLACEHOLDER_WEBP,
                  image: API.image(e.url ?? '')),
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
        56.w.heightBox,
        Image.asset(
          asset,
          height: 40.w,
          width: 40.w,
        ),
        4.w.widthBox,
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

  _buildProcess() {
    return AkuTitleBox(
      title: '服务进程',
      children: widget.processModels.map((e) {
        return _buildProcessTile(
          e.operatorContent,
          DateUtil.formatDateStr(e.operationDate,
              format: 'yyyy-MM-dd HH:mm:ss'),
        );
      }).toList(),
    );
  }

  Widget _buildProcessTile(String title, String date) {
    return Row(
      children: [
        56.w.heightBox,
        Text(
          title,
          style: TextStyle(
            color: AppStyle.minorTextColor,
            fontSize: 28.w,
          ),
        ),
        Spacer(),
        Text(
          date,
          style: TextStyle(
            color: AppStyle.primaryTextColor,
            fontSize: 28.w,
          ),
        ),
      ],
    );
  }
}
