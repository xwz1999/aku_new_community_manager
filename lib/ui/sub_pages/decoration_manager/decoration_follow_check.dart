import 'package:aku_community_manager/mock_models/decoration/decoration_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/sub_pages/decoration_manager/decoration_checkbox.dart';
import 'package:aku_community_manager/ui/sub_pages/decoration_manager/decoration_success_page.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DecorationFollowCheck extends StatefulWidget {
  final DecorationModel model;
  DecorationFollowCheck({Key key, @required this.model}) : super(key: key);

  @override
  _DecorationFollowCheckState createState() => _DecorationFollowCheckState();
}

class _DecorationFollowCheckState extends State<DecorationFollowCheck> {
  Map<CHECK_TYPE, bool> checkStatus = {
    CHECK_TYPE.ELECTRIC: true,
    CHECK_TYPE.WATER: true,
    CHECK_TYPE.WALL: true,
    CHECK_TYPE.DOOR_AND_WINDOWS: true,
    CHECK_TYPE.SECURITY: true,
  };

  bool get success {
    for (var item in checkStatus.keys) {
      if (checkStatus[item] == false) return false;
    }
    return true;
  }

  TextEditingController _textEditingController = TextEditingController();
  @override
  void dispose() {
    _textEditingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '跟踪检查',
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.w),
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: 32.w,
              vertical: 16.w,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 56.w,
                        width: 56.w,
                        alignment: Alignment.center,
                        child: Text(
                          '家',
                          style: TextStyle(
                            color: AppStyle.secondaryColor,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28.w),
                          color: Color(0xFFE9F2FF),
                        ),
                      ),
                      AkuBox.w(30),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.model.userHomeModel.plot,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppStyle.primaryTextColor,
                                fontSize: 24.sp,
                              ),
                            ),
                            Text(
                              widget.model.userHomeModel.detailAddr,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppStyle.primaryTextColor,
                                fontSize: 24.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 26.w,
                    horizontal: 32.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    color: Color(0xFFF9F9F9),
                  ),
                ),
                AkuBox.h(16),
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 56.w,
                        width: 56.w,
                        alignment: Alignment.center,
                        child: Text(
                          '装',
                          style: TextStyle(
                            color: AppStyle.secondaryColor,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28.w),
                          color: Color(0xFFE9F2FF),
                        ),
                      ),
                      AkuBox.w(30),
                      Expanded(
                        child: Text(
                          widget.model.decorationTeamModel.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppStyle.primaryTextColor,
                            fontSize: 24.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 26.w,
                    horizontal: 32.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    color: Color(0xFFF9F9F9),
                  ),
                ),
                AkuBox.h(16),
                Row(
                  children: [
                    Text(
                      '${DateUtil.formatDate(
                        DateTime.now(),
                        format: 'yyyy-MM-dd',
                      )} 周期检查',
                      style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontSize: 28.w,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    AkuBox.h(96),
                    Text(
                      success ? '正常' : '异常',
                      style: TextStyle(
                        color: success
                            ? AppStyle.successColor
                            : AppStyle.failColor,
                        fontSize: 28.w,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                _buildRow(CHECK_TYPE.ELECTRIC),
                _buildRow(CHECK_TYPE.WATER),
                _buildRow(CHECK_TYPE.WALL),
                _buildRow(CHECK_TYPE.DOOR_AND_WINDOWS),
                _buildRow(CHECK_TYPE.SECURITY),
                TextField(
                  minLines: 3,
                  maxLines: 99,
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16.w,
                      horizontal: 24.w,
                    ),
                    hintText: '请输入检查描述',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.w),
                      borderSide: BorderSide(
                        width: 2.w,
                        color: Color(0xFFE8E8E8),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.w),
                      borderSide: BorderSide(
                        width: 2.w,
                        color: Color(0xFFE8E8E8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottom: AkuBottomButton(
        onTap: () {
          widget.model.checkInfomations.add(
            CheckInfomation(
              checkDate: DateTime.now(),
              checkType: '周期检查',
              info: _textEditingController.text,
              details: checkStatus.entries.map((e) {
                return CheckDetail(type: e.key, status: e.value);
              }).toList(),
            ),
          );
          widget.model.type = DecorationType.DONE;
          Get.off(DecorationSuccessPage());
        },
        title: '确认提交',
      ),
    );
  }

  _buildRow(
    CHECK_TYPE type,
  ) {
    return Row(
      children: [
        Image.asset(
          checkAssetMap[type],
          height: 40.w,
          width: 40.w,
        ),
        Text(
          checkTypeMap[type],
          style: TextStyle(
            fontSize: 28.w,
            color: AppStyle.primaryTextColor,
          ),
        ),
        Spacer(),
        DecorationCheckBox(
          initValue: checkStatus[type],
          onChange: (state) {
            checkStatus[type] = state;
            setState(() {});
          },
        ),
        Spacer(),
      ],
    );
  }
}
