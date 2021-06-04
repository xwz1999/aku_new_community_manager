// Flutter imports:
import 'package:aku_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/borrow/borrow_detail_item_model.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/sub_pages/borrow_manager/add_borrow_item_page.dart';
import 'package:aku_community_manager/ui/sub_pages/borrow_manager/borrow_item_detail_page.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';

class BorrowItemPage extends StatefulWidget {
  final int id;
  BorrowItemPage({Key? key, /*required*/ required this.id}) : super(key: key);

  @override
  _BorrowItemPageState createState() => _BorrowItemPageState();
}

class _BorrowItemPageState extends State<BorrowItemPage> {
  EasyRefreshController _refreshController = EasyRefreshController();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return AkuScaffold(
      title: '物品查看',
      actions: [
        userProvider.infoModel!.canOperation
            ? AkuMaterialButton(
                minWidth: 120.w,
                onPressed: () {
                  Get.to(
                    AddBorrowItemPage(
                      articleId: widget.id,
                    ),
                  );
                },
                child: Text(
                  '新增',
                  style: TextStyle(
                    fontSize: 28.w,
                    color: AppStyle.primaryTextColor,
                  ),
                ),
              )
            : SizedBox(),
      ],
      body: BeeListView(
        path: API.manage.borrowDetailList,
        controller: _refreshController,
        extraParams: {'articleId': widget.id},
        convert: (model) => model.tableList!
            .map((e) => BorrowDetailItemModel.fromJson(e))
            .toList(),
        builder: (items) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            itemBuilder: (context, index) {
              return _buildCard(items[index]);
            },
            itemCount: items.length,
          );
        },
      ),
    );
  }

  _buildCard(BorrowDetailItemModel item) {
    final userProvider = Provider.of<UserProvider>(context);
    return GestureDetector(
      onTap: () {
        Get.to(BorrowItemDetailPage(id: item.id!));
      },
      child: Container(
        margin: EdgeInsets.only(top: 16.w),
        child: Column(
          children: [
            Row(
              children: [
                AkuBox.h(93),
                AkuBox.w(24),
                Text(
                  item.name!,
                  style: TextStyle(
                    color: AppStyle.primaryTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 32.sp,
                  ),
                ),
                Spacer(),
                userProvider.infoModel!.canOperation
                    ? AkuMaterialButton(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        onPressed: () {
                          showCupertinoDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: Text('删除物品'),
                                content: Text('确定要删除${item.name}该物品吗？'),
                                actions: [
                                  CupertinoDialogAction(
                                    child: Text('取消'),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                  CupertinoDialogAction(
                                    child: Text('删除'),
                                    onPressed: () async {
                                      await NetUtil().post(
                                        API.manage.borrowDelete,
                                        params: {
                                          "ids": [item.id]
                                        },
                                        showMessage: true,
                                      );
                                      _refreshController.callRefresh();
                                      Get.back();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: AppStyle.minorTextColor,
                              size: 40.w,
                            ),
                            Text(
                              '删除',
                              style: TextStyle(
                                color: AppStyle.minorTextColor,
                                fontSize: 28.sp,
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
              ],
            ),
            Divider(
              height: 1.w,
            ),
            AkuBox.h(28),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AkuBox.w(24),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.w),
                  child: FadeInImage.assetNetwork(
                    placeholder: R.ASSETS_PLACEHOLDER_WEBP,
                    image: API.image(item.firstImg?.url ?? ''),
                    height: 184.w,
                    width: 184.w,
                  ),
                ),
                AkuBox.w(24),
                Expanded(
                  child: Column(
                    children: [
                      _buildRow(
                          R.ASSETS_MANAGE_IC_RENWU_PNG, '物品单号', item.code!),
                      _buildRow(
                        R.ASSETS_MANAGE_BORROW_PNG,
                        '出借状态',
                        item.borrowed ? '已出借' : '未借出',
                        color: AppStyle.secondaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AkuBox.h(32),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.w),
        ),
      ),
    );
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
