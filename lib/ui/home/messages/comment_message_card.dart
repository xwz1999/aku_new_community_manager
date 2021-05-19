// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:aku_ui/aku_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';

// Project imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/message/comment_message_detail_model.dart';
import 'package:aku_community_manager/models/message/comment_message_item_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';

class CommentMessageCard extends StatefulWidget {
  final CommentMessageItemModel itemModel;
  CommentMessageCard({Key key, @required this.itemModel}) : super(key: key);

  @override
  _CommentMessageCardState createState() => _CommentMessageCardState();
}

class _CommentMessageCardState extends State<CommentMessageCard> {
  CommentMessageDetailModel _model;
  bool _onload = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () async {
      BaseModel baseModel =
          await NetUtil().get(API.message.getCommentByDispatchId, params: {
        "dispatchId": widget.itemModel.relationId,
      });
      _model = CommentMessageDetailModel.fromJson(baseModel.data);
      _onload = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return _messageList(_model);
  }

  String getComment(int level) {
    switch (level) {
      case 1:
        return '半星';
        break;
      case 2:
        return '一星';
      case 3:
        return '一星半';
      case 4:
        return '二星';
      case 5:
        return '二星半';
      case 6:
        return '三星';
      case 7:
        return '三星半';
      case 8:
        return '四星';
      case 9:
        return '四星半';
      case 10:
        return '五星';
      default:
        return '零星';
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
              'date',
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

  Widget _messageList(CommentMessageDetailModel model) {
    return _onload
        ? _loadingWidget()
        : Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(
                  '',
                  style: TextStyle(
                      color: AppStyle.minorTextColor, fontSize: 24.sp),
                ),
              ),
              Container(
                color: Color(0xFFFFFFFF),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    24.w.heightBox,
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
                        '评论消息',
                        style: TextStyle(
                            color: AppStyle.primaryTextColor,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 8.w),
                    ]).pSymmetric(h: 24.w),
                    Text(
                      '你有一条新的评论消息，请立即查看',
                      style: TextStyle(
                          color: AppStyle.primaryTextColor,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold),
                    ).pSymmetric(h: 24.w),
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
                          '评论人',
                          style: TextStyle(
                              color: AppStyle.minorTextColor, fontSize: 28.sp),
                        ),
                        Spacer(),
                        Text(
                          '${model.name}',
                          style: TextStyle(
                              color: AppStyle.primaryTextColor,
                              fontSize: 28.sp),
                        ),
                      ],
                    ).pSymmetric(h: 24.w),
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
                        Text('综合评分',
                            style: TextStyle(
                                color: AppStyle.minorTextColor,
                                fontSize: 28.sp)),
                        Spacer(),
                        Text(getComment(model.level),
                            style: TextStyle(
                                color: AppStyle.primaryTextColor,
                                fontSize: 28.sp)),
                      ],
                    ).pSymmetric(h: 24.w),
                    SizedBox(height: 16.w),
                    Divider(
                      height: 1.w,
                      indent: 24.w,
                      endIndent: 24.w,
                    ),
                    AkuButton(
                      onPressed: () {},
                      child: Container(
                        height: 88.w,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 24.w),
                        child: Row(
                          children: [
                            Text(
                              '查看详情',
                              style: TextStyle(
                                  color: AppStyle.primaryTextColor,
                                  fontSize: 28.sp),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios, size: 22.w),
                            24.w.widthBox,
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
