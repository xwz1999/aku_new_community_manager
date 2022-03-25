// Flutter imports:
import 'dart:async';

// Project imports:
import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/json_models/message/system_message_green_model.dart';
import 'package:aku_new_community_manager/saas_models/net_model/base_model.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/ui/home/messages/message_map.dart';
import 'package:aku_new_community_manager/ui/manage_pages/green_manage/green_manage_page.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_button.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

class SystemMessageGreenCard extends StatefulWidget {
  final int relationId;
  final String? date;
  final int type;
  SystemMessageGreenCard({
    Key? key,
    required this.relationId,
    required this.date,
    required this.type,
  }) : super(key: key);

  @override
  _SystemMessageGreenCardState createState() => _SystemMessageGreenCardState();
}

class _SystemMessageGreenCardState extends State<SystemMessageGreenCard> {
  SystemMessageGreenModel? _systemModel;
  bool _onLoad = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () async {
      _systemModel = await getSystemMessage(widget.relationId);
      _onLoad = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return (_systemModel == null || _onLoad)
        ? _loadingWidget()
        : _messageList(_systemModel!);
  }

  Future<SystemMessageGreenModel> getSystemMessage(int repairId) async {
    BaseModel baseModel =
        await NetUtil().get(API.message.getSysGreenMessageById, params: {
      "greenTaskId": repairId,
    });
    if (baseModel.success) {
      return SystemMessageGreenModel.fromJson(baseModel.data);
    } else {
      return SystemMessageGreenModel.fail();
    }
  }

  Widget _loadingWidget() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 24.w, bottom: 24.w),
          alignment: Alignment.center,
          width: double.infinity,
          child: Shimmer.fromColors(
            baseColor: kPrimaryColor.withOpacity(0.3),
            highlightColor: kPrimaryColor.withOpacity(0.1),
            child: Text(
              '',
              style: TextStyle(color: AppStyle.minorTextColor, fontSize: 24.sp),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 24.w, left: 24.w, right: 24.w),
          color: Color(0xFFFFFFFF),
          child: Shimmer.fromColors(
            baseColor: kPrimaryColor.withOpacity(0.3),
            highlightColor: kPrimaryColor.withOpacity(0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Container(
                    width: 16.w,
                    height: 16.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.w),
                        color: Color(0xFFFF4501)),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Text(
                    '',
                    style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8.w),
                ]),
                Text(
                  '',
                  style: TextStyle(
                      color: AppStyle.primaryTextColor,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 24.w),
                Row(
                  children: [
                    Image.asset(
                      R.ASSETS_MESSAGE_IC_PEOPLE_PNG,
                      width: 40.w,
                      height: 40.w,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      '',
                      style: TextStyle(
                          color: AppStyle.minorTextColor, fontSize: 28.sp),
                    ),
                    Spacer(),
                    Text(
                      '',
                      style: TextStyle(
                          color: AppStyle.primaryTextColor, fontSize: 28.sp),
                    ),
                  ],
                ),
                SizedBox(height: 16.w),
                Row(
                  children: [
                    Image.asset(
                      R.ASSETS_MESSAGE_IC_STAR_PNG,
                      width: 40.w,
                      height: 40.w,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text('',
                        style: TextStyle(
                            color: AppStyle.minorTextColor, fontSize: 28.sp)),
                    Spacer(),
                    Text('',
                        style: TextStyle(
                            color: AppStyle.primaryTextColor, fontSize: 28.sp)),
                  ],
                ),
                SizedBox(height: 16.w),
                Divider(height: 1.w),
                AkuButton(
                  onPressed: () {},
                  child: Container(
                    height: 88.w,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 24.w),
                    child: Row(
                      children: [
                        Text(
                          '',
                          style: TextStyle(
                              color: AppStyle.primaryTextColor,
                              fontSize: 28.sp),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios, size: 22.w),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _messageList(SystemMessageGreenModel model) {
    return Column(
      children: [
        widget.date == null ? 16.w.heightBox : SizedBox(),
        widget.date == null
            ? SizedBox()
            : Container(
                margin: EdgeInsets.only(top: 24.w, bottom: 24.w),
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(
                  widget.date!,
                  style: TextStyle(
                      color: AppStyle.minorTextColor, fontSize: 24.sp),
                ),
              ),
        Container(
          padding: EdgeInsets.only(top: 24.w, left: 24.w, right: 24.w),
          color: Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                // Container(
                //   width: 16.w,
                //   height: 16.w,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(8.w),
                //       color: Color(0xFFFF4501)),
                // ),
                // SizedBox(
                //   width: 16.w,
                // ),
                Text(
                  '系统通知',
                  style: TextStyle(
                      color: AppStyle.primaryTextColor,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8.w),
              ]),
              Text(
                '你有一条新的${MessageMap.sysType(widget.type)}，请立即处理',
                style: TextStyle(
                    color: AppStyle.primaryTextColor,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24.w),
              Row(
                children: [
                  Image.asset(
                    R.ASSETS_MESSAGE_IC_PEOPLE_PNG,
                    width: 40.w,
                    height: 40.w,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    '保修人',
                    style: TextStyle(
                        color: AppStyle.minorTextColor, fontSize: 28.sp),
                  ),
                  Spacer(),
                  Text(
                    model.name,
                    style: TextStyle(
                        color: AppStyle.primaryTextColor, fontSize: 28.sp),
                  ),
                ],
              ),
              SizedBox(height: 16.w),
              Row(
                children: [
                  Image.asset(
                    R.ASSETS_MESSAGE_IC_PHONE_PNG,
                    width: 40.w,
                    height: 40.w,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text('联系电话',
                      style: TextStyle(
                          color: AppStyle.minorTextColor, fontSize: 28.sp)),
                  Spacer(),
                  Text(model.tel,
                      style: TextStyle(
                          color: AppStyle.primaryTextColor, fontSize: 28.sp)),
                ],
              ),
              SizedBox(height: 16.w),
              Row(
                children: [
                  Image.asset(
                    R.ASSETS_MESSAGE_IC_AREA_PNG,
                    width: 40.w,
                    height: 40.w,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text('报修区域',
                      style: TextStyle(
                          color: AppStyle.minorTextColor, fontSize: 28.sp)),
                  Spacer(),
                  Text('area',
                      style: TextStyle(
                          color: AppStyle.primaryTextColor, fontSize: 28.sp)),
                ],
              ),
              SizedBox(height: 16.w),
              Divider(
                height: 1.w,
              ),
              AkuButton(
                onPressed: () {
                  Get.to(() => GreenManagePage());
                },
                child: Container(
                  height: 88.w,
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Text(
                        '查看详情',
                        style: TextStyle(
                            color: AppStyle.primaryTextColor, fontSize: 28.sp),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios, size: 22.w),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
