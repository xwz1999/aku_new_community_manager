// Flutter imports:
// Project imports:
import 'package:aku_new_community_manager/const/resource.dart';
import 'package:aku_new_community_manager/saas_models/net_model/base_model.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/tools/screen_tool.dart';
import 'package:aku_new_community_manager/tools/widget_tool.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/utils/network/manage_func.dart';
// Package imports:
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FixMoreTimePage extends StatefulWidget {
  final int dispatchId;
  FixMoreTimePage({Key? key, /*required*/ required this.dispatchId})
      : super(key: key);

  @override
  _FixMoreTimePageState createState() => _FixMoreTimePageState();
}

class _FixMoreTimePageState extends State<FixMoreTimePage> {
  String _nowSelect = '24h';
  List<String> _delayList = ['24h', '48h', '72h', '未知'];
  TextEditingController? _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '申请延时',
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            height: 16.w,
            color: Color(0xFFF9F9F9),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 24.w,
              horizontal: 32.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '延长时间',
                  style: TextStyle(
                    color: AppStyle.primaryTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 32.sp,
                  ),
                ),
                AkuBox.h(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _delayList.map((e) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _nowSelect = e;
                        });
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 160.w,
                            height: 80.w,
                            alignment: Alignment.center,
                            child: Text(
                              e,
                              style: TextStyle(
                                color: AppStyle.primaryTextColor,
                                fontSize: 28.sp,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFF9F9F9),
                              borderRadius: BorderRadius.circular(4.w),
                              border: _nowSelect == e
                                  ? Border.all(
                                      width: 3.w,
                                      color: AppStyle.primaryTextColor,
                                    )
                                  : null,
                            ),
                          ),
                          Positioned(
                            left: 3.w,
                            top: 3.w,
                            child: _nowSelect == e
                                ? Image.asset(
                                    R.ASSETS_MANAGE_CHECK_PNG,
                                    height: 30.w,
                                    width: 30.w,
                                  )
                                : SizedBox(),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                AkuBox.h(40),
                Text(
                  '备注',
                  style: TextStyle(
                    color: AppStyle.primaryTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 32.sp,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    border: Border.all(
                      width: 2.w,
                      color: Color(0xFFE8E8E8),
                    ),
                  ),
                  margin: EdgeInsets.only(
                    top: 24.w,
                    bottom: 340.w,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 16.w,
                    horizontal: 24.w,
                  ),
                  child: TextField(
                    minLines: 7,
                    maxLines: 7,
                    controller: _textEditingController,
                    onChanged: (_) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      hintText: '请输入延长时间说明…',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: AkuMaterialButton(
                    onPressed: () async {
                      // final userProvider =
                      //     Provider.of<UserProvider>(context, listen: false);
                      // widget.model.detail.fixStatuses.add(
                      //   FixStatus(
                      //       title: '${userProvider.userInfoModel.nickName}申请延时',
                      //       date: DateTime.now()),
                      // );
                      // Get.back();
                      BaseModel baseModel = await (ManageFunc.applyDelayed(
                          widget.dispatchId,
                          _delayList.indexOf(_nowSelect) + 1,
                          _textEditingController?.text ?? ''));
                      if (baseModel.success) {
                        Get.back();
                      } else {
                        BotToast.showText(text: baseModel.msg);
                      }
                    },
                    radius: 8.w,
                    child: Text(
                      '确定',
                      style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 32.sp,
                      ),
                    ),
                    color: AppStyle.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
