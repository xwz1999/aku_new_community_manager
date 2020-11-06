import 'package:aku_community_manager/mock_models/borrow/borrow_data.dart';
import 'package:aku_community_manager/mock_models/borrow/borrow_model.dart';
import 'package:aku_community_manager/mock_models/users/user_info_model.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/sub_pages/borrow_manager/all_borrow_goods.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class BorrowManagerPage extends StatefulWidget {
  BorrowManagerPage({Key key}) : super(key: key);

  @override
  _BorrowManagerPageState createState() => _BorrowManagerPageState();
}

class _BorrowManagerPageState extends State<BorrowManagerPage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return AkuScaffold(
      title: '物品清单',
      actions: [
        userProvider.userInfoModel.role != USER_ROLE.MANAGER
            ? AkuMaterialButton(
                minWidth: 178.w,
                onPressed: () {
                  Get.to(AllBorrowGoods());
                },
                child: Text(
                  '全部物品',
                  style: TextStyle(
                    fontSize: 28.w,
                    color: AppStyle.primaryTextColor,
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
