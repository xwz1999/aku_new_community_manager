import 'package:aku_community_manager/models/manager/rules_manage/rules_manage_list_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class RulesManageDetailPage extends StatefulWidget {
  final RulesManageListModel model;
  RulesManageDetailPage({Key key, this.model}) : super(key: key);

  @override
  _RulesManageDetailPageState createState() => _RulesManageDetailPageState();
}

class _RulesManageDetailPageState extends State<RulesManageDetailPage> {
  RulesManageListModel get _detailModel => widget.model;
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      backgroundColor: Colors.white,
      title: '规程管理',
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
        children: [
          _detailModel.title.text
              .size(32.sp)
              .color(kTextPrimaryColor)
              .bold
              .align(TextAlign.center)
              .make(),
          24.w.heightBox,
          SizedBox(
            width: double.infinity,
            child: _detailModel.content.text
                .size(28.sp)
                .color(kTextPrimaryColor)
                .make(),
            // child: RichText(
            // text: TextSpan(
            //     children: List.generate(_parasedText.length, (index) {
            //   if (index.isEven) {
            //     return TextSpan(
            //       text: _parasedText[index],
            //       style: TextStyle(fontSize: 28.sp, color: ktextPrimary),
            //     );
            //   } else {
            //     return TextSpan(
            //         text: _parasedText[index],
            //         style: TextStyle(
            //           fontSize: 28.sp,
            //           color: Colors.lightBlue,
            //         ),
            //         recognizer: _tapLinkUrlLancher
            //           ..onTap = () {
            //             launch(_parasedText[index]);
            //           });
            //   }
            // })),
            // ),
          ),
          40.w.heightBox,
          Row(
            children: [
              Spacer(),
              '发布于 ${DateUtil.formatDateStr(_detailModel.releaseDate, format: 'MM-dd HH:mm')}'
                  .text
                  .size(24.sp)
                  .color(kTextSubColor)
                  .make(),
            ],
          )
        ],
      ),
    );
  }
}
