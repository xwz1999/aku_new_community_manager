// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/mock_models/borrow/borrow_model.dart';
import 'package:aku_community_manager/models/manager/borrow/borrow_check_item_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';

class BorrowManagerCheckPage extends StatefulWidget {
  final int id;
  BorrowManagerCheckPage({Key key, @required this.id}) : super(key: key);

  @override
  _BorrowManagerCheckPageState createState() => _BorrowManagerCheckPageState();
}

class _BorrowManagerCheckPageState extends State<BorrowManagerCheckPage> {
  int borrowStatus = 1;
  BorrowCheckItemModel _model;
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '检查物品',
      bottom: AkuBottomButton(
        title: '确认归还',
        onTap: () async {
          Function cancel = BotToast.showLoading();
          await NetUtil().post(
            API.manage.borrowCheck,
            params: {
              'articleBorrowId': widget.id,
              'articleStatus': borrowStatus,
            },
            showMessage: true,
          );
          cancel();
          Get.back(result: true);
        },
      ),
      body: EasyRefresh(
        firstRefresh: true,
        onRefresh: () async {
          BaseModel model = await NetUtil().get(
            API.manage.borrowCheckInfo,
            params: {'articleBorrowId': widget.id},
            showMessage: true,
          );
          if (model.data == null) {
            // Get.back();
            return;
          }
          _model = BorrowCheckItemModel.fromJson(model.data);
          setState(() {});
        },
        header: MaterialHeader(),
        child: _model == null
            ? SizedBox()
            : ListView(
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
                            _model.articleName,
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
                            _model.code,
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
                              _buildCard(1),
                              AkuBox.w(24),
                              _buildCard(2),
                              AkuBox.w(24),
                              _buildCard(3),
                            ],
                          ),
                        ),
                        Divider(height: 1.w),
                        AkuBox.h(16),
                        _buildRow(
                          '物品图片',
                          FadeInImage.assetNetwork(
                            placeholder: R.ASSETS_PLACEHOLDER_WEBP,
                            image: API.image(_model.firstImg?.url ?? ''),
                            height: 184.w,
                            width: 184.w,
                          ),
                        ),
                        AkuBox.h(28),
                      ],
                    ),
                  ),
                ],
              ),
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

  _buildCard(int status) {
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
            1: '完好',
            2: '损坏',
            3: '丢失',
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
