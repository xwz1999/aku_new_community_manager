// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:aku_community_manager/models/manager/bussiness_and_fix/bussiness_and_fix_model.dart';
import 'package:aku_community_manager/models/manager/bussiness_and_fix/fixed_detail_model.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/manage_func.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:common_utils/common_utils.dart';

// Project imports:
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_title_box.dart';
import 'package:aku_community_manager/ui/widgets/inner/pick_image.dart';
import 'package:get/get.dart';

class FixWorkFinishPage extends StatefulWidget {
  final FixedDetailModel model;
  final String reportDetail;
  final bool dispatchType;
  FixWorkFinishPage(
      {Key key,
      @required this.model,
      @required this.dispatchType,
      @required this.reportDetail})
      : super(key: key);

  @override
  _FixWorkFinishPageState createState() => _FixWorkFinishPageState();
}

class _FixWorkFinishPageState extends State<FixWorkFinishPage> {
  List<File> _imgs = [];
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _materialController = TextEditingController();

  TextEditingController _humanController = TextEditingController();
  TextEditingController _materialPriceController = TextEditingController();

  double humanPrice;
  double materialPrice;
  @override
  void dispose() {
    _descriptionController?.dispose();
    _materialController?.dispose();
    _materialPriceController?.dispose();
    _humanController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '处理完成',
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 16.w,
        ),
        children: [
          AkuTitleBox(
            title: '报修信息',
            spacing: 24,
            children: [
              Text(
                widget.reportDetail,
                style: TextStyle(
                  color: AppStyle.primaryTextColor,
                  fontSize: 28.w,
                ),
              ),
              AkuBox.h(16),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.w,
                ),
                itemBuilder: (context, index) {
                  // final img = widget.model.imgs[index];
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(4.w),
                      child: FadeInImage.assetNetwork(
                        placeholder: R.ASSETS_PLACEHOLDER_WEBP,
                        image: widget.model.repairDetail.imgUrls[index].url,
                      ));
                },
                itemCount: widget.model.repairDetail.imgUrls.length,
              ),
            ],
          ),
          AkuTitleBox(
            title: '处理情况',
            spacing: 24.w,
            children: [
              Text(
                '处理描述',
                style: TextStyle(
                  color: AppStyle.primaryTextColor,
                  fontSize: 28.w,
                ),
              ),
              AkuBox.h(24),
              TextField(
                controller: _descriptionController,
                minLines: 4,
                maxLines: 99,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.w,
                    horizontal: 24.w,
                  ),
                  hintText: '请输入处理描述…',
                  hintStyle: TextStyle(
                    color: AppStyle.minorTextColor,
                    fontSize: 28.w,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE8E8E8),
                      width: 2.w,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE8E8E8),
                      width: 2.w,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE8E8E8),
                      width: 2.w,
                    ),
                  ),
                ),
              ),
              AkuBox.h(32),
              Text(
                '更换材料（含辅料）',
                style: TextStyle(
                  color: AppStyle.primaryTextColor,
                  fontSize: 28.w,
                ),
              ),
              AkuBox.h(24),
              TextField(
                controller: _materialController,
                minLines: 3,
                maxLines: 99,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.w,
                    horizontal: 24.w,
                  ),
                  hintText: '请输入材料描述…',
                  hintStyle: TextStyle(
                    color: AppStyle.minorTextColor,
                    fontSize: 28.w,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE8E8E8),
                      width: 2.w,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE8E8E8),
                      width: 2.w,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFE8E8E8),
                      width: 2.w,
                    ),
                  ),
                ),
              ),
              AkuBox.h(32),
              Text(
                '上传维修完成照片',
                style: TextStyle(
                  color: AppStyle.primaryTextColor,
                  fontSize: 28.w,
                ),
              ),
              AkuBox.h(24),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.w,
                ),
                itemBuilder: (context, index) {
                  if (index == 0)
                    return AkuMaterialButton(
                      radius: 8.w,
                      onPressed: () {
                        akuPickImage().then((file) {
                          setState(() {
                            if (file != null) _imgs.insert(0, file);
                          });
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            color: AppStyle.minorTextColor,
                            width: 2.w,
                          ),
                        ),
                      ),
                    );
                  else
                    return Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4.w),
                            child: Image.file(
                              _imgs[index - 1],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: GestureDetector(
                            onTap: () {
                              _imgs.removeAt(index - 1);
                              setState(() {});
                            },
                            child: Icon(CupertinoIcons.clear_circled_solid),
                          ),
                        ),
                      ],
                    );
                },
                itemCount: _imgs.length + 1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              )
            ],
          ),
          widget.dispatchType
              ? SizedBox()
              : AkuTitleBox(
                  title: '费用明细',
                  spacing: 16,
                  children: [
                    Row(
                      children: [
                        AkuBox.h(96),
                        Text('人工费'),
                        Expanded(
                          child: TextField(
                            controller: _humanController,
                            onChanged: (_) => setState(() {}),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.end,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '请输入',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28.sp,
                                color: AppStyle.minorTextColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 1.w),
                    Row(
                      children: [
                        AkuBox.h(96),
                        Text('材料费'),
                        Expanded(
                          child: TextField(
                            onChanged: (_) => setState(() {}),
                            controller: _materialPriceController,
                            textAlign: TextAlign.end,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '请输入',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28.sp,
                                color: AppStyle.minorTextColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 1.w),
                    Row(
                      children: [
                        AkuBox.h(96),
                        Text('总计费用'),
                        Spacer(),
                        Builder(
                          builder: (context) {
                            humanPrice = double.tryParse(_humanController.text);
                            materialPrice =
                                double.tryParse(_materialPriceController.text);

                            if (TextUtil.isEmpty(_humanController.text) ||
                                TextUtil.isEmpty(
                                    _materialPriceController.text)) {
                              return Text('人工费或材料费不能为空');
                            } else if (humanPrice == null ||
                                materialPrice == null)
                              return Text('输入有误');
                            else
                              return Text(
                                  '¥${(humanPrice + materialPrice).toStringAsFixed(2)}');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
        ],
      ),
      bottom: AkuMaterialButton(
        child: Text(
          '立即提交',
          style: TextStyle(
            color: AppStyle.primaryTextColor,
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        height: 96.w,
        color: AppStyle.primaryColor,
        onPressed: () async {
          // widget.model.detail.result = FixResult(
          //   detail: _descriptionController.text,
          //   material: _materialController.text,
          //   imgs: _imgs,
          // );
          // widget.model.type = FIX_ENUM.DONE;
          // if (widget.model.detail.type == FIX_PAYMENT_TYPE.PAY)
          //   widget.model.detail.priceDetail = FixPriceDetail(
          //     humanPrice: double.parse(_humanController.text),
          //     materialPrice: double.parse(_materialController.text),
          //   );
          // Get.back();

          BaseModel baseModel = await ManageFunc.handleResult(
              widget.model.repairDetail.dispatchId,
              _descriptionController.text,
              _materialController.text,
              humanPrice,
              materialPrice,
              humanPrice + materialPrice,
              1, []);
          if (baseModel.status) {
            Get.back(); //TODO 处理完成
          } else {
            BotToast.showText(text: baseModel.message);
          }
        },
      ),
    );
  }
}
