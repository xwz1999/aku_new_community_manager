import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/saas_models/net_model/base_model.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/ui/widgets/app_widgets/aku_single_check_button.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/common/bee_text_field.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class NewRenovationFinishSubmitPage extends StatefulWidget {
  final int id;
  final VoidCallback? callRefresh;
  NewRenovationFinishSubmitPage(
      {Key? key, /*required*/ required this.id, this.callRefresh})
      : super(key: key);

  @override
  _NewRenovationFinishSubmitPageState createState() =>
      _NewRenovationFinishSubmitPageState();
}

class _NewRenovationFinishSubmitPageState
    extends State<NewRenovationFinishSubmitPage> {
  int _isQualified = 1;
  late TextEditingController _detailController;
  @override
  void initState() {
    super.initState();
    _detailController = TextEditingController();
  }

  @override
  void dispose() {
    _detailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '完工检查',
      body: ListView(
        padding: EdgeInsets.all(32.w),
        children: [
          Container(
            padding: EdgeInsets.all(24.w),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _headWidget(),
                40.w.heightBox,
                BeeTextField(
                  controller: _detailController,
                  hintText: '请输入具体检查情况',
                  onChange: () {
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ],
      ),
      bottom: AkuBottomButton(
        title: '立即提交',
        onTap: () async {
          BaseModel baseModel =
              await NetUtil().post(API.manage.submitRenovation,
                  params: {
                    "decorationNewId": widget.id,
                    "detail": _detailController.text,
                    "isQualified": _isQualified,
                  },
                  showMessage: true);
          if (baseModel.success ?? false) {
            Get.back();
          }
        },
      ),
    );
  }

  Widget _headWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            '检查结果'.text.size(32.sp).bold.color(kTextPrimaryColor).make(),
            Spacer(),
          ],
        ),
        20.w.heightBox,
        Row(
          children: [
            AkuSingleCheckButton(
              text: '合格',
              value: 1,
              gropValue: _isQualified,
              onPressed: () {
                _isQualified = 1;
                setState(() {});
              },
            ),
            40.w.widthBox,
            AkuSingleCheckButton(
              text: '不合格',
              value: 2,
              gropValue: _isQualified,
              onPressed: () {
                _isQualified = 2;
                setState(() {});
              },
            ),
          ],
        ),
      ],
    );
  }
}
