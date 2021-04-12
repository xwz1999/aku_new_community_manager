// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/utils/network/base_file_model.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:aku_community_manager/mock_models/borrow/borrow_data.dart';
import 'package:aku_community_manager/mock_models/borrow/borrow_model.dart';
import 'package:aku_community_manager/mock_models/users/user_info_model.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:aku_community_manager/ui/widgets/inner/pick_image.dart';

class AddBorrowObjectPage extends StatefulWidget {
  AddBorrowObjectPage({Key key}) : super(key: key);

  @override
  _AddBorrowObjectPageState createState() => _AddBorrowObjectPageState();
}

class _AddBorrowObjectPageState extends State<AddBorrowObjectPage> {
  TextEditingController _textEditingController = TextEditingController();
  // TextEditingController _numberController = TextEditingController();
  File file;
  // List<BorrowObject> get objects => BorrowData.borrowObjects;

  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context);
    return AkuScaffold(
      title: '新增总类',
      // actions: [
      //   userProvider.userInfoModel.role != USER_ROLE.MANAGER
      //       ? AkuMaterialButton(
      //           minWidth: 120.w,
      //           onPressed: () {
      //             if (TextUtil.isEmpty(_textEditingController.text)) {
      //               BotToast.showText(text: '名称不能为空');
      //             } else if (file == null) {
      //               BotToast.showText(text: '图片不能为空');
      //             } else if (int.tryParse(_numberController.text) == null) {
      //               BotToast.showText(text: '数量错误');
      //             } else {
      //               objects.insert(
      //                 0,
      //                 BorrowObject.init(
      //                   name: _textEditingController.text,
      //                   allNumber: int.parse(_numberController.text),
      //                   assetPath: file,
      //                 ),
      //               );
      //               Get.back();
      //             }
      //           },
      //           child: Text(
      //             '完成',
      //             style: TextStyle(
      //               fontSize: 28.w,
      //               color: AppStyle.primaryTextColor,
      //             ),
      //           ),
      //         )
      //       : SizedBox(),
      // ],
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.w),
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Column(
              children: [
                _buildRow(
                    '总类名称',
                    TextField(
                      onChanged: (_) {
                        setState(() {});
                      },
                      style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '请输入总类名称',
                      ),
                    )),
                Divider(height: 1.w),
                // _buildRow(
                //     '物品数量',
                //     TextField(
                //       onChanged: (_) {
                //         setState(() {});
                //       },
                //       style: TextStyle(
                //         color: AppStyle.primaryTextColor,
                //         fontSize: 28.sp,
                //         fontWeight: FontWeight.bold,
                //       ),
                //       controller: _numberController,
                //       decoration: InputDecoration(
                //         border: InputBorder.none,
                //         hintText: '请输入物品数量',
                //       ),
                //     )),
                // Divider(height: 1.w),
                AkuBox.h(24),
                _buildRow(
                  '物品图片',
                  file == null
                      ? InkWell(
                          onTap: () {
                            akuPickImage().then((value) {
                              if (value != null) file = value;
                              setState(() {});
                            });
                          },
                          child: Container(
                            height: 184.w,
                            width: 184.w,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.image,
                                  size: 60.w,
                                  color: AppStyle.minorTextColor,
                                ),
                                Text(
                                  '上传图片',
                                  style: TextStyle(
                                    color: AppStyle.minorTextColor,
                                    fontSize: 22.sp,
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.w),
                              border: Border.all(
                                width: 1.w,
                                color: AppStyle.minorTextColor,
                              ),
                            ),
                          ),
                        )
                      : Image.file(
                          file,
                          height: 184.w,
                          width: 184.w,
                          fit: BoxFit.cover,
                        ),
                ),
                AkuBox.h(28),
              ],
            ),
          ),
          AkuBox.h(470),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 64.w),
            child: AkuBottomButton(
              title: '确定',
              onTap:
                  TextUtil.isEmpty(_textEditingController.text) || file == null
                      // TextUtil.isEmpty(_numberController.text) ||
                      // file == null ||
                      // int.tryParse(_numberController.text) == null
                      ? null
                      : () async {
                          BaseFileModel baseFileModel = await NetUtil()
                              .upload(API.upload.uploadArtical, file);
                          if (baseFileModel.status) {
                            await NetUtil().post(
                              API.manage.insertArticle,
                              params: {
                                "name": _textEditingController.text,
                                "fileUrls": [baseFileModel.url]
                              },
                              showMessage: true,
                            );
                          } else {
                            BotToast.showText(text: baseFileModel.message);
                          }
                          Get.back();
                        },
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
