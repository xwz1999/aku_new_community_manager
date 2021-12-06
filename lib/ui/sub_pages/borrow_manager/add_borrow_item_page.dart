// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:aku_new_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

// Project imports:
import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/tools/widget_tool.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/pick_image.dart';
import 'package:aku_new_community_manager/utils/network/base_file_model.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';

class AddBorrowItemPage extends StatefulWidget {
  final int/*!*/ articleId;
  AddBorrowItemPage({
    Key? key,
    required this.articleId,
  }) : super(key: key);

  @override
  _AddBorrowItemPageState createState() => _AddBorrowItemPageState();
}

class _AddBorrowItemPageState extends State<AddBorrowItemPage> {
  TextEditingController? _textEditingController;
  TextEditingController? _codeEditingCOntroller;
  File? file;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _codeEditingCOntroller = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController?.dispose();
    _codeEditingCOntroller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '物品详情',
      actions: [
        AkuMaterialButton(
          minWidth: 120.w,
          onPressed: () async {
            BaseFileModel baseFileModel =
                await NetUtil().upload(API.upload.uploadArticleDetail, file!);
            if (baseFileModel.status!) {
              await NetUtil().post(
                API.manage.borrowinsertArticleDetail,
                params: {
                  "articleId": widget.articleId,
                  "name": _textEditingController!.text,
                  "code": _codeEditingCOntroller!.text,
                  "fileUrls": [baseFileModel.url]
                },
                showMessage: true,
              );

              Get.back();
            } else {
              BotToast.showText(text: baseFileModel.message!);
            }
          },
          child: Text(
            '完成',
            style: TextStyle(
              fontSize: 28.w,
              color: AppStyle.primaryTextColor,
            ),
          ),
        ),
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '请输入物品名称',
                      ),
                    )),
                Divider(height: 1.w),
                _buildRow(
                    '物品单号',
                    TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r"[0-9]*"))
                      ],
                      style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _codeEditingCOntroller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '请输入物品单号',
                      ),
                    )),
                Divider(height: 1.w),
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
