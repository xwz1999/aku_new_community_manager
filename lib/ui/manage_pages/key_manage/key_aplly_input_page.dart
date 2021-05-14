import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class KeyApplyInputPage extends StatefulWidget {
  KeyApplyInputPage({Key key}) : super(key: key);

  @override
  _KeyApplyInputPageState createState() => _KeyApplyInputPageState();
}

class _KeyApplyInputPageState extends State<KeyApplyInputPage> {
  TextEditingController _nameController;
  TextEditingController _phoneController;
  TextEditingController _roleController;
  TextEditingController _placeController;
  bool get canSubmit {
    if (TextUtil.isEmpty(_nameController.text)) {
      BotToast.showText(text: '申请人姓名不能为空！');
      return false;
    }
    if (TextUtil.isEmpty(_phoneController.text)) {
      BotToast.showText(text: '申请人联系方式不能为空！');
      return false;
    } else if (!_phoneFormat(_phoneController.text)) {
      BotToast.showText(text: '收件人联系方式格式错误！');
      return false;
    }
    if (TextUtil.isEmpty(_roleController.text)) {
      BotToast.showText(text: '身份不能为空！');
      return false;
    }
    if (TextUtil.isEmpty(_placeController.text)) {
      BotToast.showText(text: '对应设备不能为空！');
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
    _roleController = TextEditingController();
    _placeController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController?.dispose();
    _phoneController?.dispose();
    _roleController?.dispose();
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
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              _inputRowTile('申请人姓名', _nameController),
              _inputRowTile('联系方式', _phoneController,
                  formatters: [FilteringTextInputFormatter.digitsOnly]),
              _inputRowTile('身份', _roleController),
              _inputRowTile('对应设备位置', _placeController),
            ],
          ),
        ),
      ),
      bottom: AkuBottomButton(
        title: '确认提交',
        onTap: () async {
        },
      ),
    );
  }

  Widget _inputRowTile(String title, TextEditingController controller,
      {String hintText, List<TextInputFormatter> formatters}) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          40.w.heightBox,
          title.text.size(28.sp).color(kTextPrimaryColor).make(),
          32.w.heightBox,
          TextField(
            inputFormatters: formatters,
            textAlign: TextAlign.start,
            onChanged: (value) {
              controller.text = value;
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
