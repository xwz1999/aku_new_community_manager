import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NickNameChangePage extends StatefulWidget {
  NickNameChangePage({Key key}) : super(key: key);

  @override
  _NickNameChangePageState createState() => _NickNameChangePageState();
}

class _NickNameChangePageState extends State<NickNameChangePage> {
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
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return AkuScaffold(
      title: '修改昵称',
      body: Material(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              55.w.heightBox,
              '昵称'.text.black.size(28.sp).make(),
              TextFormField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintText: '${userProvider.infoModel.nickName}',
                  hintStyle:
                      TextStyle(color: Color(0xFF999999), fontSize: 34.sp),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFFEEEEEE),
                    width: 1.w,
                  )),
                ),
              ),
              150.w.heightBox,
              MaterialButton(
                onPressed: () async {
                  BaseModel baseModel = await NetUtil().post(
                      API.user.updateNickName,
                      params: {'nickName': _textEditingController.text});

                  if (baseModel.status == true) {
                    userProvider.setNickName(_textEditingController.text);
                    Get.back();
                  } else {
                    BotToast.showText(text: baseModel.message);
                  }
                },
                child: '保存'.text.black.size(32.sp).make(),
                color: Color(0xFFFFC40C),
                elevation: 0,
                minWidth: 686.w,
                height: 85.w,
              ),
              24.w.heightBox,
              '为保护个人隐私，在与邻里交往时显示昵称，默认为真实姓名，您可自行修改'
                  .text
                  .color(Color(0xFF999999))
                  .size(24.sp)
                  .maxLines(2)
                  .make()
            ],
          ),
        ),
      ),
    );
  }
}
