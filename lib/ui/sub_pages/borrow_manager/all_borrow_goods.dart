// Flutter imports:
import 'package:aku_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/models/manager/borrow/borrow_item_model.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/sub_pages/borrow_manager/add_borrow_object_page.dart';
import 'package:aku_community_manager/ui/sub_pages/borrow_manager/borrow_items_page.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/common/bee_list_view.dart';

class AllBorrowGoods extends StatefulWidget {
  AllBorrowGoods({Key key}) : super(key: key);

  @override
  _AllBorrowGoodsState createState() => _AllBorrowGoodsState();
}

class _AllBorrowGoodsState extends State<AllBorrowGoods> {
  EasyRefreshController _refreshController = EasyRefreshController();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return AkuScaffold(
      title: '全部物品',
      actions: [
        userProvider.infoModel.canOperation
            ? AkuMaterialButton(
                minWidth: 120.w,
                onPressed: () {
                  Get.to(() => AddBorrowObjectPage());
                },
                child: Text(
                  '新增',
                  style: TextStyle(
                    fontSize: 28.w,
                    color: AppStyle.primaryTextColor,
                  ),
                ),
              )
            : SizedBox()
      ],
      body: BeeListView(
        path: API.manage.borrowList,
        controller: _refreshController,
        convert: (model) =>
            model.tableList.map((e) => BorrowItemModel.fromJson(e)).toList(),
        builder: (items) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: 32.w,
            ),
            itemBuilder: (context, index) {
              return _buildCard(items[index]);
            },
            itemCount: items.length,
          );
        },
      ),
    );
  }

  _buildCard(BorrowItemModel object) {
    return GestureDetector(
      onTap: () => Get.to(BorrowItemPage(id: object.id)),
      child: Container(
        padding: EdgeInsets.all(24.w),
        margin: EdgeInsets.only(top: 16.w),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.w),
              child: FadeInImage.assetNetwork(
                placeholder: R.ASSETS_PLACEHOLDER_WEBP,
                image: API.image(object.firstImg?.url ?? ''),
                height: 184.w,
                width: 184.w,
              ),
            ),
            AkuBox.w(24),
            Expanded(
                child: Column(
              children: [
                _buildRow(R.ASSETS_MANAGE_ARTICLE_PNG, '物品名称', object.name),
                AkuBox.h(12),
                _buildRow(R.ASSETS_MANAGE_BORROW_PNG, '借出数量',
                    object.borrowNum.toString()),
                AkuBox.h(12),
                _buildRow(R.ASSETS_MANAGE_REMAINING_PNG, '剩余数量',
                    object.remainingNum.toString()),
              ],
            )),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: Colors.white,
        ),
      ),
    );
  }

  _buildRow(String assetPath, String title, String subTitle) {
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
            color: AppStyle.primaryTextColor,
            fontSize: 28.w,
          ),
        ),
      ],
    );
  }
}
