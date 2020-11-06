import 'package:aku_community_manager/mock_models/borrow/borrow_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BorrowManagerCheckPage extends StatefulWidget {
  final BorrowModel model;
  BorrowManagerCheckPage({Key key, @required this.model}) : super(key: key);

  @override
  _BorrowManagerCheckPageState createState() => _BorrowManagerCheckPageState();
}

class _BorrowManagerCheckPageState extends State<BorrowManagerCheckPage> {
  GOODS_STATUS borrowStatus = GOODS_STATUS.NORMAL;
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '检查物品',
      bottom: AkuBottomButton(
        title: '确认归还',
        onTap: () {
          widget.model.goodsStatus = borrowStatus;
          widget.model.borrowGoods.status = BORROW_STATUS.DONE;
          Get.back();
        },
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.w),
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              children: [
                _buildRow(
                  '物品名称',
                  Text(
                    widget.model.borrowGoods.name,
                    style: TextStyle(
                      color: AppStyle.primaryTextColor,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(height: 1.w),
                _buildRow(
                  '物品单号',
                  Text(
                    widget.model.borrowGoods.code,
                    style: TextStyle(
                      color: AppStyle.primaryTextColor,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(height: 1.w),
                _buildRow(
                    '归还数量',
                    Text(
                      '1',
                      style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Divider(height: 1.w),
                _buildRow(
                  '物品情况',
                  Row(
                    children: [
                      _buildCard(GOODS_STATUS.NORMAL),
                      AkuBox.w(24),
                      _buildCard(GOODS_STATUS.BROKEN),
                      AkuBox.w(24),
                      _buildCard(GOODS_STATUS.LOST),
                    ],
                  ),
                ),
                Divider(height: 1.w),
                AkuBox.h(16),
                _buildRow(
                  '物品图片',
                  (widget.model.borrowGoods.assetpath is String)
                      ? Image.asset(
                          widget.model.borrowGoods.assetpath,
                          height: 184.w,
                          width: 184.w,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          widget.model.borrowGoods.assetpath,
                          height: 184.w,
                          width: 184.w,
                          fit: BoxFit.cover,
                        ),
                ),
                AkuBox.h(28),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildRow(String title, Widget child) {
    return Row(
      children: [
        AkuBox.h(96),
        Text(
          title,
          style: TextStyle(
            color: AppStyle.minorTextColor,
            fontSize: 28.w,
          ),
        ),
        AkuBox.w(80),
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: child,
          ),
        ),
      ],
    );
  }

  _buildCard(GOODS_STATUS status) {
    return GestureDetector(
      onTap: () {
        borrowStatus = status;
        setState(() {});
      },
      child: Container(
        height: 56.w,
        width: 112.w,
        child: Text(
          {
            GOODS_STATUS.NORMAL: '完好',
            GOODS_STATUS.BROKEN: '损坏',
            GOODS_STATUS.LOST: '丢失',
          }[status],
          style: TextStyle(
            color: borrowStatus == status
                ? AppStyle.secondaryColor
                : AppStyle.minorTextColor,
            fontSize: 28.sp,
          ),
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: borrowStatus == status
                ? AppStyle.secondaryColor
                : AppStyle.minorTextColor,
            width: 2.w,
          ),
        ),
      ),
    );
  }
}
