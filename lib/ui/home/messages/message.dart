// Flutter imports:
import 'package:aku_new_community_manager/const/api.dart';
// Project imports:
import 'package:aku_new_community_manager/const/resource.dart';
import 'package:aku_new_community_manager/provider/message_provider.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/ui/home/messages/comment_message.dart';
import 'package:aku_new_community_manager/ui/home/messages/system/system_message.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_button.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/utils/network/base_model.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide Response;
import 'package:get/instance_manager.dart';
import 'package:provider/provider.dart';

class Message extends StatefulWidget {
  Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  EasyRefreshController _refreshController = EasyRefreshController();

  Widget _messageTypeImage(String type) {
    late String path;
    Color? ca;
    Color? cb;
    switch (type) {
      case '系统消息':
        path = R.ASSETS_MESSAGE_IC_TONGZHI_PNG;
        ca = Color(0xFFFFDE9A);
        cb = Color(0xFFFFB00A);
        break;
      case '评论消息':
        path = R.ASSETS_MESSAGE_IC_PINGLUN_PNG;
        ca = Color(0xFF81D1FF);
        cb = Color(0xFF1792FF);
        break;
      default:
    }
    return Container(
      width: 88.w,
      height: 88.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(44.w),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ca!, cb!],
        ),
      ),
      child: Image.asset(
        path,
        width: 70.w,
        height: 70.w,
      ),
    );
  }

  Widget _messageListTile(
      String date, Widget messageImage, String title, String text, int number,
      {required VoidCallback onpressed}) {
    return AkuButton(
      color: Color(0xFFFFFFFF),
      onPressed: onpressed,
      child: Container(
        height: 136.w,
        padding: EdgeInsets.only(
          top: 24.w,
          left: 32.w,
          bottom: 24.w,
          right: 31.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            messageImage,
            SizedBox(
              width: 24.w,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: AppStyle().primaryStyle,
                      ),
                      Spacer(),
                      Text(date, style: AppStyle().minorStyle),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(text, style: AppStyle().minorStyle),
                      Spacer(),
                      number == 0
                          ? SizedBox()
                          : Container(
                              alignment: Alignment.center,
                              width: 32.w,
                              height: 32.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.w),
                                  color: Color(0xFFFF4501)),
                              child: Text(
                                number.toString(),
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 20.sp,
                                ),
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final messageProvider =
        Provider.of<MessageProvider>(Get.context!, listen: false);
    return AkuScaffold(
      title: '消息',
      titleStyle: AppStyle().barTitleStyle,
      body: EasyRefresh(
        controller: _refreshController,
        firstRefresh: true,
        onRefresh: () async {
          await messageProvider.updateMessage();
        },
        header: MaterialHeader(),
        child: ListView(
          padding: EdgeInsets.only(top: 16.w),
          children: [
            _messageListTile(
              messageProvider.sysDate,
              _messageTypeImage('系统消息'),
              '系统消息',
              messageProvider.sysMessage == 0
                  ? '暂无新的系统消息'
                  : '你有一条新的${messageProvider.sysMesTypeString}待处理',
              messageProvider.sysMessage,
              onpressed: () async {
                BaseModel baseModel =
                    await NetUtil().get(API.message.allReadSysMes);
                if (baseModel.status ?? false) {
                  messageProvider.updateMessage();
                  Get.to(() => SystemMessage());
                }
              },
            ),
            Divider(
              height: 1.w,
            ),
            _messageListTile(
              messageProvider.commentDate,
              _messageTypeImage('评论消息'),
              '评论消息',
              messageProvider.commentMessage == 0 ? '暂无新的评论消息' : '你有一条新的评论回复',
              messageProvider.commentMessage,
              onpressed: () async {
                BaseModel baseModel =
                    await NetUtil().get(API.message.allReadCommentMes);
                if (baseModel.status ?? false) {
                  messageProvider.updateMessage();
                  Get.to(() => CommentMessage());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
