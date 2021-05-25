import 'package:aku_community_manager/models/manager/rules_manage/rules_manage_list_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/common/bee_download_view.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:aku_community_manager/const/resource.dart';

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
      body: Stack(
              children:[ ListView(
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
            ),
            //  docView(
            // widget.model?.fileDocName ?? '', widget.model?.fileDocUrl ?? '')
          ],
        ),
         Positioned(
            bottom: MediaQuery.of(context).padding.bottom+88.w,
            left: 32.w,
            right: 32.w,
            child: docView(
          widget.model?.fileDocName ?? '', widget.model?.fileDocUrl ?? '') ),
        ]
        
      ),
    );
  }

  Widget docView(String title, String path) {
    // if (title?.isEmpty ?? true) return SizedBox();
    return Container(
      // margin: EdgeInsets.only(right: 113.w),
      alignment: Alignment.centerLeft,
      child: MaterialButton(
        minWidth: 606.w,
        height: 154.w,
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Row(
          children: [
            title.text.size(32.sp).make().expand(),
            Image.asset(
              R.ASSETS_MANAGE_IC_RENWU_PNG,
              height: 52.w,
              width: 52.w,
            ),
          ],
        ),
        onPressed: path.isEmptyOrNull
            ? () {
                BotToast.showText(text: '文件为空！');
              }
            : () async {
                String result = await Get.dialog(BeeDownloadView(file: path));
                if (result != null) OpenFile.open(result);
              },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.w),
          side: BorderSide(color: Color(0xFFD4CFBE)),
        ),
        color: Colors.white,
      ),
    );
  }
}
