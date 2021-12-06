// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bot_toast/bot_toast.dart';
import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/tools/widget_tool.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/pick_image.dart';
import 'package:aku_new_community_manager/utils/network/base_file_model.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';

class AddBorrowObjectPage extends StatefulWidget {
  AddBorrowObjectPage({Key? key}) : super(key: key);

  @override
  _AddBorrowObjectPageState createState() => _AddBorrowObjectPageState();
}

class _AddBorrowObjectPageState extends State<AddBorrowObjectPage> {
  TextEditingController _textEditingController = TextEditingController();
  File? file;

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '新增总类',
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
                          file!,
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
                              .upload(API.upload.uploadArtical, file!);
                          if (baseFileModel.status!) {
                            await NetUtil().post(
                              API.manage.insertArticle,
                              params: {
                                "name": _textEditingController.text,
                                "fileUrls": [baseFileModel.url]
                              },
                              showMessage: true,
                            );
                          } else {
                            BotToast.showText(text: baseFileModel.message!);
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
