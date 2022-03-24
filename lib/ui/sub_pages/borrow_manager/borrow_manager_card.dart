// Flutter imports:
// Project imports:
import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/models/manager/borrow/borrow_status_item_model.dart';
import 'package:aku_new_community_manager/provider/user_provider.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/tools/widget_tool.dart';
import 'package:aku_new_community_manager/ui/sub_pages/borrow_manager/borrow_manager_check_page.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/aku_chip_box.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
// Package imports:
import 'package:bot_toast/bot_toast.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'borrow_manager_examine_page.dart';

class BorrowManagerCard extends StatefulWidget {
  final BorrowStatusItemModel model;
  BorrowManagerCard({Key? key, required this.model}) : super(key: key);

  @override
  _BorrowManagerCardState createState() => _BorrowManagerCardState();
}

class _BorrowManagerCardState extends State<BorrowManagerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.w),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AkuChipBox(title: '借还管理'),
              AkuBox.w(24),
              Text(
                DateUtil.formatDate(widget.model.create),
                style: TextStyle(
                  color: AppStyle.minorTextColor,
                  fontSize: 22.sp,
                ),
              ),
              Spacer(),
              Text(
                widget.model.borrowStatusValue,
                style: TextStyle(
                  color: widget.model.borrowStatus == -1
                      ? Color(0xFFFB7302)
                      : widget.model.borrowStatus == 0
                          ? Color(0xD9E60E0E)
                          : widget.model.borrowStatus == 1
                              ? Color(0xD9000000)
                              : widget.model.borrowStatus == 2
                                  ? Color(0x73000000)
                                  : widget.model.borrowStatus == 3
                                      ? Color(0xD9FB7402)
                                      : widget.model.borrowStatus == 4
                                          ? Color(0xD9E60E0E)
                                          : AppStyle.failColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                ),
              ),
            ],
          ),
          AkuBox.h(24),
          Text(
            widget.model.articleName!,
            style: TextStyle(
              color: AppStyle.primaryTextColor,
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          AkuBox.h(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInImage.assetNetwork(
                placeholder: R.ASSETS_PLACEHOLDER_WEBP,
                image: API.image(widget.model.imgUrls!.isEmpty
                    ? ''
                    : widget.model.imgUrls![0].url ?? ''),
                height: 184.w,
                width: 184.w,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    R.ASSETS_PLACEHOLDER_WEBP,
                    height: 184.w,
                    width: 184.w,
                  );
                },
              ),
              AkuBox.w(24),
              Expanded(
                child: Column(
                  children: [
                    _buildRow(R.ASSETS_MESSAGE_IC_PEOPLE_PNG, '借用人员',
                        widget.model.borrowName!),
                    _buildRow(R.ASSETS_MESSAGE_IC_PHONE_PNG, '联系电话',
                        widget.model.borrowTel!),
                    _buildRow(R.ASSETS_MANAGE_IC_TIME_PNG, '借用时常',
                        '${(widget.model.borrowTime! / 24).toStringAsFixed(0)}天'),
                    _buildRow(
                      R.ASSETS_MANAGE_INFO_PNG,
                      '物品状态',
                      widget.model.statusValue,
                      color: widget.model.statusColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          ..._buildCard(),
        ],
      ),
    );
  }

  List<Widget> _buildCard() {
    final userProvider = Provider.of<UserProvider>(context);
    if (!(userProvider.userInfoModel!.type == 1))
      return [];
    else if (widget.model.borrowStatus == 2) {
      return [];
    } else
      return [
        Divider(height: 48.w),
        Row(
          children: [
            Spacer(),
            MaterialButton(
              minWidth: 160.w,
              height: 64.w,
              child: Text(
                '电话联系',
                style: TextStyle(
                  color: AppStyle.primaryTextColor,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                launch('tel:${widget.model.borrowTel}');
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.w),
                side: BorderSide(color: AppStyle.primaryColor, width: 2.w),
              ),
            ),
            AkuBox.w(24),
            widget.model.borrowStatus == 1
                ? AkuMaterialButton(
                    minWidth: 160.w,
                    height: 64.w,
                    color: AppStyle.primaryColor,
                    radius: 4.w,
                    onPressed: () async {
                      Function cancel = BotToast.showLoading();
                      await NetUtil().post(
                        API.manage.remindUserReturn,
                        params: {
                          'borrowId': widget.model.id,
                          'butlerMessage': {
                            'title': '',
                            'content': '',
                          },
                        },
                        showMessage: true,
                      );
                      cancel();
                    },
                    child: Text(
                      '提醒归还',
                      style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.w,
                      ),
                    ),
                  )
                : SizedBox(),
            widget.model.borrowStatus == 3
                ? AkuMaterialButton(
                    minWidth: 160.w,
                    height: 64.w,
                    color: AppStyle.primaryColor,
                    radius: 4.w,
                    onPressed: () async {
                      await Get.to(
                          BorrowManagerCheckPage(id: widget.model.id!));
                    },
                    child: Text(
                      '检查信息',
                      style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.w,
                      ),
                    ),
                  )
                : SizedBox(),
            widget.model.borrowStatus == -1
                ? AkuMaterialButton(
                    minWidth: 160.w,
                    height: 64.w,
                    color: AppStyle.primaryColor,
                    radius: 4.w,
                    onPressed: () async {
                      await Get.to(BorrowManagerExaminePage(
                        id: widget.model.id!,
                        model: widget.model,
                        type: 1,
                      ));
                    },
                    child: Text(
                      '点击审核',
                      style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.w,
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ];
  }

  _buildRow(
    String assetPath,
    String title,
    String subTitle, {
    Color color = AppStyle.primaryTextColor,
  }) {
    return Row(
      children: [
        Image.asset(
          assetPath,
          height: 40.w,
          width: 40.w,
        ),
        Text(
          '$title\：',
          style: TextStyle(
            color: AppStyle.minorTextColor,
            fontSize: 28.w,
          ),
        ),
        Text(
          subTitle,
          style: TextStyle(
            color: color,
            fontSize: 28.w,
          ),
        ),
      ],
    );
  }
}
