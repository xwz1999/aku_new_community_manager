import 'dart:io';

import 'package:aku_new_community_manager/const/saas_api.dart';
import 'package:aku_new_community_manager/new_ui/work_order/work_order_func.dart';
import 'package:aku_new_community_manager/new_ui/work_order/work_order_map.dart';
import 'package:aku_new_community_manager/saas_models/work_order/work_order_submit_model.dart';
import 'package:aku_new_community_manager/tools/extensions/int_ext.dart';
import 'package:aku_new_community_manager/tools/extensions/list_extension_tool.dart';
import 'package:aku_new_community_manager/ui/widgets/app_widgets/bee_pick_image_widget.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/common/bee_divider.dart';
import 'package:aku_new_community_manager/ui/widgets/common/bee_long_button.dart';
import 'package:aku_new_community_manager/ui/widgets/common/bee_picker_box.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/src/extensions/iterable_ext.dart';
import 'package:velocity_x/src/extensions/num_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';

class FinishReportPage extends StatefulWidget {
  final int id;
  const FinishReportPage({Key? key, required this.id}) : super(key: key);

  @override
  _FinishReportPageState createState() => _FinishReportPageState();
}

class _FinishReportPageState extends State<FinishReportPage> {
  WorkOrderSubmitModel _submitModel = WorkOrderSubmitModel.init;
  List<File> _photos = [];

  double get totalCost {
    var sum = 0.0;
    for (var item in _submitModel.workOrderFinishCostDTOList) {
      if (item.costType == 1) {
        sum += item.price;
      } else {
        sum += (item.price * item.num);
      }
    }
    return sum;
  }

  @override
  void initState() {
    super.initState();
    _submitModel.workOrderId=widget.id;
  }


  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '完成报告',
      body: ListView(
        children: [
          24.w.heightBox,
          _orderCost(),
          Container(
            padding: EdgeInsets.all(32.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16.w)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    '进度汇报'
                        .text
                        .size(28.sp)
                        .color(Colors.black.withOpacity(0.45))
                        .make(),
                  ],
                ),
                32.w.heightBox,
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(16.w)),
                  child: TextField(
                    autofocus: false,
                    onChanged: (text) {
                      _submitModel.content = text;
                    },
                    minLines: 5,
                    maxLength: 200,
                    maxLines: 20,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          32.w.heightBox,
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16.w)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                10.heightBox,
                Row(
                  children: [
                    '上传图片'
                        .text
                        .size(28.sp)
                        .color(Colors.black.withOpacity(0.45))
                        .make(),
                    Spacer(),
                    '建议上传图片不超过6张'
                        .text
                        .size(24.sp)
                        .color(Colors.black.withOpacity(0.25))
                        .make(),
                  ],
                ),
                24.w.heightBox,
                BeePickImageWidget(
                    maxCount: 9,
                    onChanged: (value) {
                      _photos = value;
                    }),
                20.h.heightBox,
              ],
            ),
          )
        ],
      ),
      bottom: BeeLongButton(
          onPressed: () async {
            var cancel = BotToast.showLoading();
            var imgUrls = <String>[];
            try {
              imgUrls = await NetUtil()
                  .uploadFiles(_photos, SAASAPI.other.file.uploadImg);
            } catch (e) {
              print(e.toString());
            }
            try {
              var re = await WorkOrderFuc.finish(_submitModel);
              if (re) {
                Get.back();
              }
            } catch (e) {
              print(e.toString());
            }
            cancel();
          },
          text: '提交'),
    );
  }

  Widget _orderCost() {
    return Container(
      width: 686.w,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16.w)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.w),
            child: Row(
              children: [
                '工单费用'.text.size(32.sp).black.bold.make(),
                Spacer(),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(minWidth: 20.w, minHeight: 20.w),
                  onPressed: () {
                    _submitModel.workOrderFinishCostDTOList
                        .add(WorkOrderFinishCostDTOList.init);
                    setState(() {});
                  },
                  icon: Icon(
                    CupertinoIcons.plus,
                    size: 30.w,
                  ),
                ),
              ],
            ),
          ),
          BeeDivider.horizontal(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 32.w,
            ),
            child: Row(
              children: [
                '费用总计'
                    .text
                    .size(28.sp)
                    .color(Colors.black.withOpacity(0.65))
                    .make(),
                56.w.widthBox,
                totalCost.text.size(32.sp).color(Color(0xFFF5222D)).make(),
                '元'
                    .text
                    .size(28.sp)
                    .color(Colors.black.withOpacity(0.65))
                    .make(),
              ],
            ),
          ),
          BeeDivider.horizontal(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 32.w,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _submitModel.workOrderFinishCostDTOList
                  .mapIndexed((e, index) => _costTile(e, index))
                  .toList()
                  .sepWidget(separate: BeeDivider.horizontal()),
            ),
          )
        ],
      ),
    );
  }

  Widget _costTile(WorkOrderFinishCostDTOList model, int index) {
    int _type = 1;
    return Column(
      children: [
        32.w.heightBox,
        Container(
          width: double.infinity,
          height: 60.w,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 32.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.w),
              color: Colors.black.withOpacity(0.06)),
          child: '收费${(index + 1).toChinese}'
              .text
              .size(26.sp)
              .color(Colors.black.withOpacity(0.45))
              .make(),
        ),
        GestureDetector(
          onTap: () async {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return BeePickerBox(
                    onPressed: () {
                      Get.back();
                      model.costType = _type;
                      setState(() {});
                    },
                    child: CupertinoPicker.builder(
                        itemExtent: 60.w,
                        childCount: WorkOrderMap.costType.keys.length,
                        onSelectedItemChanged: (index) {
                          var typeStr =
                              WorkOrderMap.costType.values.toList()[index];
                          WorkOrderMap.costType.forEach((key, value) {
                            if (value == typeStr) {
                              _type = key;
                            }
                          });
                        },
                        itemBuilder: (context, index) {
                          var str =
                              WorkOrderMap.costType.values.toList()[index];
                          return Center(
                            child: str.text.size(32.sp).isIntrinsic.make(),
                          );
                        }));
              },
            );
          },
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: double.infinity,
              height: 105.w,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 32.w),
              child: Row(
                children: [
                  '费用类型'
                      .text
                      .size(28.sp)
                      .color(Colors.black.withOpacity(0.65))
                      .make(),
                  56.w.widthBox,
                  Expanded(
                    child: '${model.costType == 1 ? '人工费' : '耗材费'}'
                        .text
                        .size(28.sp)
                        .color(Colors.black.withOpacity(0.25))
                        .make(),
                  ),
                  Icon(
                    CupertinoIcons.chevron_right,
                    size: 25.w,
                    color: Colors.black.withOpacity(0.25),
                  )
                ],
              ),
            ),
          ),
        ),
        model.costType == 1 ? _laborCostItem(model) : _consumablesFee(model)
      ],
    );
  }

  Widget _laborCostItem(WorkOrderFinishCostDTOList model) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 32.w,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 170.w,
                child: '金额'
                    .text
                    .size(28.sp)
                    .color(Colors.black.withOpacity(0.45))
                    .make(),
              ),
              Expanded(
                child: TextField(
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                  ],
                  onChanged: (text) {
                    if (text.isNotEmpty)
                      model.price = double.parse(text);
                    else
                      model.price = 0;
                    setState(() {});
                  },
                  autofocus: false,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                      border: InputBorder.none,
                      hintText: '请输入金额',
                      hintStyle: TextStyle(
                        fontSize: 28.sp,
                        color: Colors.black.withOpacity(0.25),
                      )),
                ),
              ),
              '元'.text.size(28.sp).color(Colors.black.withOpacity(0.85)).make(),
            ],
          ),
        )
      ],
    );
  }

  Widget _consumablesFee(WorkOrderFinishCostDTOList model) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 32.w,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 170.w,
                child: '数量'
                    .text
                    .size(28.sp)
                    .color(Colors.black.withOpacity(0.45))
                    .make(),
              ),
              Expanded(
                child: TextField(
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (text) {
                    if (text.isNotEmpty)
                      model.num = int.parse(text);
                    else
                      model.num = 0;
                    setState(() {});
                  },
                  autofocus: false,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                      border: InputBorder.none,
                      hintText: '请输入数量',
                      hintStyle: TextStyle(
                        fontSize: 28.sp,
                        color: Colors.black.withOpacity(0.25),
                      )),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 32.w,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 170.w,
                child: '单价'
                    .text
                    .size(28.sp)
                    .color(Colors.black.withOpacity(0.45))
                    .make(),
              ),
              Expanded(
                child: TextField(
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                  ],
                  onChanged: (text) {
                    if (text.isNotEmpty)
                      model.price = double.parse(text);
                    else
                      model.price = 0;
                    setState(() {});
                  },
                  autofocus: false,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                      border: InputBorder.none,
                      hintText: '请输入金额',
                      hintStyle: TextStyle(
                        fontSize: 28.sp,
                        color: Colors.black.withOpacity(0.25),
                      )),
                ),
              ),
              '元'.text.size(28.sp).color(Colors.black.withOpacity(0.85)).make(),
            ],
          ),
        )
      ],
    );
  }
}
