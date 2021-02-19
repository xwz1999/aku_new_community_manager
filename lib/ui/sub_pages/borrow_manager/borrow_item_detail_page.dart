// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:aku_community_manager/mock_models/borrow/borrow_model.dart';
import 'package:aku_community_manager/mock_models/users/user_info_model.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

class BorrowItemDetailPage extends StatefulWidget {
  final SingleBorrowGoods item;
  BorrowItemDetailPage({Key key, this.item}) : super(key: key);

  @override
  _BorrowItemDetailPageState createState() => _BorrowItemDetailPageState();
}

class _BorrowItemDetailPageState extends State<BorrowItemDetailPage> {
  bool _isEditing = false;
  TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.item.name);
  }

  @override
  void dispose() {
    _textEditingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return AkuScaffold(
      title: '物品详情',
      actions: [
        userProvider.userInfoModel.role == USER_ROLE.MANAGER
            ? AkuMaterialButton(
                minWidth: 120.w,
                onPressed: () {
                  setState(() {
                    _isEditing = !_isEditing;
                  });
                },
                child: Text(
                  _isEditing ? '完成' : '编辑',
                  style: TextStyle(
                    fontSize: 28.w,
                    color: AppStyle.primaryTextColor,
                  ),
                ),
              )
            : SizedBox(),
      ],
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
                    TextField(
                      style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _textEditingController,
                      enabled: _isEditing,
                      onChanged: (text) {
                        widget.item.name = text;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    )),
                Divider(height: 1.w),
                _buildRow(
                    '物品单号',
                    Text(
                      widget.item.code,
                      style: TextStyle(
                        color: _isEditing
                            ? AppStyle.minorTextColor
                            : AppStyle.primaryTextColor,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                _buildRow(
                    '出借状态',
                    Text(
                      '未出借',
                      style: TextStyle(
                        color: _isEditing
                            ? AppStyle.minorTextColor
                            : AppStyle.primaryTextColor,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                _buildRow(
                  '物品图片',
                  (widget.item.assetpath is String)
                      ? Image.asset(
                          widget.item.assetpath,
                          height: 184.w,
                          width: 184.w,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          widget.item.assetpath,
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
}
