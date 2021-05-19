// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:aku_ui/common_widgets/aku_common_widgets.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_radio.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';

class OutdoorNotpassPage extends StatefulWidget {
  final int id;
  OutdoorNotpassPage({Key key, @required this.id}) : super(key: key);

  @override
  _OutdoorNotpassPageState createState() => _OutdoorNotpassPageState();
}

class _OutdoorNotpassPageState extends State<OutdoorNotpassPage> {
  String _currentTime = DateUtil.formatDate(DateTime.now());
  List<String> _rejectReason = ['业主不同意', '申报物品与实际不符', '该房子处于法院查封状态', '其他'];
  int _select = 0;
  TextEditingController _textEditingController;
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
      title: '不放行',
      body: Column(
        children: [
          AkuBox.h(16),
          Container(
            padding: EdgeInsets.only(
              left: 32.w,
            ),
            color: Color(0xFFFFFFFF),
            alignment: Alignment.center,
            width: double.infinity,
            height: 96.w,
            child: Row(
              children: [
                Text(
                  '当前时间',
                  style: AppStyle().secondaryTextStyle,
                ),
                AkuBox.w(80),
                Text(
                  _currentTime,
                  style: AppStyle().primaryStyle,
                ),
                Spacer(),
              ],
            ),
          ),
          Divider(
            height: 1.w,
          ),
          Container(
            padding: EdgeInsets.only(top: 28.w, left: 32.w),
            color: Color(0xFFFFFFFF),
            height: 328.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '不放行理由',
                  style: AppStyle().secondaryTextStyle,
                ),
                AkuBox.w(52),
                Expanded(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        AkuRadio(
                          size: 32.w,
                          value: 0,
                          grouvalue: _select,
                          onchanged: (newvalue) {
                            setState(() {
                              _select = newvalue;
                            });
                          },
                        ),
                        AkuBox.w(16),
                        Text(
                          _rejectReason[0],
                          style: AppStyle().primaryStyle,
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        AkuRadio(
                          size: 32.w,
                          value: 1,
                          grouvalue: _select,
                          onchanged: (newvalue) {
                            setState(() {
                              _select = newvalue;
                            });
                          },
                        ),
                        AkuBox.w(16),
                        Text(
                          _rejectReason[1],
                          style: AppStyle().primaryStyle,
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        AkuRadio(
                          size: 32.w,
                          value: 2,
                          grouvalue: _select,
                          onchanged: (newvalue) {
                            setState(() {
                              _select = newvalue;
                            });
                          },
                        ),
                        AkuBox.w(16),
                        Text(
                          _rejectReason[2],
                          style: AppStyle().primaryStyle,
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        AkuRadio(
                          size: 32.w,
                          value: 3,
                          grouvalue: _select,
                          onchanged: (newvalue) {
                            setState(() {
                              _select = newvalue;
                            });
                          },
                        ),
                        AkuBox.w(16),
                        Text(
                          _rejectReason[3],
                          style: AppStyle().primaryStyle,
                        ),
                      ],
                    ),
                    Container(
                        height: 96.w,
                        child: TextFormField(
                          controller: _textEditingController,
                          style: TextStyle(
                              color: AppStyle.primaryTextColor, fontSize: 32.w),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '请输入其他理由',
                              hintStyle: AppStyle().secondaryTextStyle),
                        )),
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
      bottom: AkuButton(
        onPressed: () async {
          Function cancel = BotToast.showLoading();
          String remark = '';
          if (_select <= 2) {
            remark = _rejectReason[_select];
          } else {
            remark = _textEditingController.text;
          }
          await NetUtil().post(
            API.manage.goodsOutNotRelease,
            params: {
              'id': widget.id,
              'remarks': remark,
            },
            showMessage: true,
          );
          cancel();
          Get.back();
          Get.back();
        },
        child: Container(
          color: Color(0xFFFFC40C),
          height: 98.w,
          alignment: Alignment.center,
          child: Text(
            '确认不放行',
            style: TextStyle(
                color: AppStyle.primaryTextColor,
                fontSize: 32.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
