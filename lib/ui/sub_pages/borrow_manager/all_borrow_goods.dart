import 'package:aku_community_manager/mock_models/borrow/borrow_data.dart';
import 'package:aku_community_manager/mock_models/borrow/borrow_model.dart';
import 'package:aku_community_manager/mock_models/users/user_info_model.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/sub_pages/borrow_manager/add_borrow_object_page.dart';
import 'package:aku_community_manager/ui/sub_pages/borrow_manager/borrow_items_page.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:aku_community_manager/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AllBorrowGoods extends StatefulWidget {
  AllBorrowGoods({Key key}) : super(key: key);

  @override
  _AllBorrowGoodsState createState() => _AllBorrowGoodsState();
}

class _AllBorrowGoodsState extends State<AllBorrowGoods> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return AkuScaffold(
      title: '全部物品',
      actions: [
        userProvider.userInfoModel.role == USER_ROLE.MANAGER
            ? AkuMaterialButton(
                minWidth: 120.w,
                onPressed: () {
                  Get.to(AddBorrowObjectPage());
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
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: 32.w,
        ),
        itemBuilder: (context, index) {
          return _buildCard(BorrowData.borrowObjects[index]);
        },
        itemCount: BorrowData.borrowObjects.length,
      ),
    );
  }

  _buildCard(BorrowObject object) {
    return GestureDetector(
      onTap: () => Get.to(BorrowItemPage(object: object)),
      child: Container(
        padding: EdgeInsets.all(24.w),
        margin: EdgeInsets.only(top: 16.w),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.w),
              child: (object.assetPath is String)
                  ? Image.asset(
                      object.assetPath,
                      width: 184.w,
                      height: 184.w,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      object.assetPath,
                      width: 184.w,
                      height: 184.w,
                      fit: BoxFit.cover,
                    ),
            ),
            AkuBox.w(24),
            Expanded(
                child: Column(
              children: [
                _buildRow(R.ASSETS_MANAGE_ARTICLE_PNG, '物品名称', object.name),
                AkuBox.h(12),
                _buildRow(R.ASSETS_MANAGE_BORROW_PNG, '借出数量',
                    object.borrowNumber.toString()),
                AkuBox.h(12),
                _buildRow(R.ASSETS_MANAGE_REMAINING_PNG, '剩余数量',
                    object.items.length.toString()),
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
