// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:aku_community_manager/mock_models/borrow/borrow_model.dart';
import 'package:aku_community_manager/mock_models/users/user_info_model.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/sub_pages/borrow_manager/borrow_manager_check_page.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_chip_box.dart';

class BorrowManagerCard extends StatefulWidget {
  final BorrowModel model;
  BorrowManagerCard({Key key, this.model}) : super(key: key);

  @override
  _BorrowManagerCardState createState() => _BorrowManagerCardState();
}

class _BorrowManagerCardState extends State<BorrowManagerCard> {
  USER_ROLE get role =>
      Provider.of<UserProvider>(context, listen: false).userInfoModel.role;
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
                DateUtil.formatDate(widget.model.date),
                style: TextStyle(),
              ),
              Spacer(),
              Text(
                widget.model.borrowGoods.borrowValue,
                style: TextStyle(
                  color: AppStyle.failColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                ),
              ),
            ],
          ),
          AkuBox.h(24),
          Text(
            widget.model.title,
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
              (widget.model.borrowGoods.assetpath is String)
                  ? Image.asset(
                      widget.model.borrowGoods.assetpath,
                      height: 184.w,
                      width: 183.w,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      widget.model.borrowGoods.assetpath,
                      height: 184.w,
                      width: 183.w,
                      fit: BoxFit.cover,
                    ),
              AkuBox.w(24),
              Expanded(
                child: Column(
                  children: [
                    _buildRow(R.ASSETS_MESSAGE_IC_PEOPLE_PNG, '借用人员',
                        widget.model.borrowPerson),
                    _buildRow(R.ASSETS_MESSAGE_IC_PHONE_PNG, '联系电话',
                        widget.model.phone),
                    _buildRow(R.ASSETS_MANAGE_IC_TIME_PNG, '借用时常',
                        '${widget.model.borrowTime}天'),
                    _buildRow(
                      R.ASSETS_MANAGE_INFO_PNG,
                      '物品状态',
                      widget.model.goodsStatus == GOODS_STATUS.BROKEN
                          ? '损坏'
                          : widget.model.goodsStatus == GOODS_STATUS.LOST
                              ? '丢失'
                              : '正常',
                      color: widget.model.goodsStatus == GOODS_STATUS.NORMAL
                          ? AppStyle.primaryTextColor
                          : AppStyle.failColor,
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
    if (role != USER_ROLE.MANAGER)
      return [];
    else if (widget.model.borrowGoods.status == BORROW_STATUS.DONE) {
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
                launch('tel:${widget.model.phone}');
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.w),
                side: BorderSide(color: AppStyle.primaryColor, width: 2.w),
              ),
            ),
            AkuBox.w(24),
            widget.model.borrowGoods.status == BORROW_STATUS.BORROWING
                ? AkuMaterialButton(
                    minWidth: 160.w,
                    height: 64.w,
                    color: AppStyle.primaryColor,
                    radius: 4.w,
                    onPressed: () {
                      BotToast.showText(text: '已提醒用户');
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
            widget.model.borrowGoods.status == BORROW_STATUS.WAIT_CHECK
                ? AkuMaterialButton(
                    minWidth: 160.w,
                    height: 64.w,
                    color: AppStyle.primaryColor,
                    radius: 4.w,
                    onPressed: () {
                      Get.to(BorrowManagerCheckPage(model: widget.model));
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
          '$title\:',
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
