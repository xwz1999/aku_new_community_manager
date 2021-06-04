// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:bot_toast/bot_toast.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

// Project imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:aku_community_manager/tools/extensions/list_extension_tool.dart';

class AddPackagePage extends StatefulWidget {
  AddPackagePage({Key? key}) : super(key: key);

  @override
  _AddPackagePageState createState() => _AddPackagePageState();
}

class _AddPackagePageState extends State<AddPackagePage> {
  TextEditingController? _nameController;
  TextEditingController? _phoneController;
  TextEditingController? _addressController;
  TextEditingController? _codeController;
  TextEditingController? _placeController;
  bool get canSubmit {
    if (TextUtil.isEmpty(_nameController!.text)) {
      BotToast.showText(text: '收件人姓名不能为空！');
      return false;
    }
    if (TextUtil.isEmpty(_phoneController!.text)) {
      BotToast.showText(text: '收件人联系方式不能为空！');
      return false;
    } else if (!_phoneFormat(_phoneController!.text)) {
      BotToast.showText(text: '收件人联系方式格式错误！');
      return false;
    }
    if (TextUtil.isEmpty(_addressController!.text)) {
      BotToast.showText(text: '楼层地址不能为空！');
      return false;
    }
    if (TextUtil.isEmpty(_codeController!.text)) {
      BotToast.showText(text: '包裹单号不能为空！');
      return false;
    }
    if (TextUtil.isEmpty(_placeController!.text)) {
      BotToast.showText(text: '放置位置不能为空！');
      return false;
    }
    return true;
  }

  bool _phoneFormat(String phone) {
    if ((phone.length != 11) || (phone.substring(0, 1) != '1')) {
      return false;
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();
    _codeController = TextEditingController();
    _placeController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController?.dispose();
    _phoneController?.dispose();
    _addressController?.dispose();
    _codeController?.dispose();
    _phoneController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '添加包裹',
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32.w),
          child: Column(
            children: [
              _inputRowTile('收件人姓名', _nameController),
              _inputRowTile('联系方式', _phoneController,
                  formatters: [FilteringTextInputFormatter.digitsOnly]),
              _inputRowTile('收件人楼层地址', _addressController),
              _inputRowTile('包裹单号', _codeController,
                  formatters: [FilteringTextInputFormatter.digitsOnly]),
              _inputRowTile('放置位置', _placeController),
            ].sepWidget(separate: 40.w.heightBox),
          ),
        ),
      ),
      bottom: AkuBottomButton(
        title: '确认提交',
        onTap: () async {
          canSubmit
              ? await addPackage(
                  code: _codeController!.text,
                  addresseeName: _nameController!.text,
                  addresseeTel: _phoneController!.text,
                  address: _addressController!.text,
                  placePosition: _placeController!.text)
              : null;
        },
      ),
    );
  }

  Future addPackage(
      {required String code,
      required String addresseeName,
      required String addresseeTel,
      required String address,
      required String placePosition}) async {
    BaseModel baseModel = await NetUtil().post(
      API.manage.addPackage,
      params: {
        "code": code,
        "addresseeName": addresseeName,
        "addresseeTel": addresseeTel,
        "address": address,
        "placePosition": placePosition,
      },
    );

    if (!baseModel.status!) {
      BotToast.showText(text: baseModel.message!);
      return;
    }
    BotToast.showText(text: baseModel.message!);
    Get.back();
  }

  Widget _inputRowTile(String title, TextEditingController? controller,
      {String? hintText, List<TextInputFormatter>? formatters}) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title.text.size(28.sp).color(kTextPrimaryColor).make(),
          32.w.heightBox,
          TextField(
            inputFormatters: formatters,
            controller: controller,
            textAlign: TextAlign.start,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: hintText ?? '',
              isDense: true,
              contentPadding: EdgeInsets.zero,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 2.w),
              ),
            ),
            style: TextStyle(
              fontSize: 36.sp,
              fontWeight: FontWeight.bold,
              color: kTextPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
