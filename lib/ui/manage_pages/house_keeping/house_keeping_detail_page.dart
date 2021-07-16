import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/aku_divider.dart';
import 'package:aku_community_manager/ui/manage_pages/house_keeping/house_keeping_feed_back_page.dart';
import 'package:aku_community_manager/ui/widgets/app_widgets/bee_grid_image_view.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_title_box.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:aku_community_manager/utils/extension/list_extension.dart';
// class HouseKeepingDetailPage extends StatefulWidget {
//   final HouseKeepingListModel model;
//   HouseKeepingDetailPage({Key? key, required this.model}) : super(key: key);

//   @override
//   _HouseKeepingDetailPageState createState() => _HouseKeepingDetailPageState();
// }

// class _HouseKeepingDetailPageState extends State<HouseKeepingDetailPage> {
//   @override
//   Widget build(BuildContext context) {
//     return AkuScaffold(
//       title: '服务详情',
//       body: ListView(
//         padding: EdgeInsets.all(32.w),
//         children: [
//           _interviewInfo(),
//           20.w.heightBox,
//           _contentWidget(),
//         ],
//       ),
//     );
//   }

//   Widget _interviewInfo() {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
//       padding: EdgeInsets.all(24.w),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               '家政服务'.text.size(32.sp).color(kTextPrimaryColor).bold.make(),
//               Spacer(),
//             ],
//           ),
//           16.w.heightBox,
//           AkuDivider.horizontal(),
//           24.w.heightBox,
//           ...<Widget>[
//             _rowTile(
//                 R.ASSETS_MANAGE_IC_RENWU_PNG,
//                 '房产名称',
//                 widget.model.roomName!.text
//                     .size(24.sp)
//                     .color(kTextSubColor)
//                     .make()),
//             _rowTile(
//                 R.ASSETS_MANAGE_IC_RENWU_PNG,
//                 '人数',
//                 widget.model.num
//                     .toString()
//                     .text
//                     .size(24.sp)
//                     .color(kTextSubColor)
//                     .make()),
//             _rowTile(
//                 R.ASSETS_MANAGE_IC_RENWU_PNG,
//                 '负责人姓名',
//                 widget.model.leaderName!.text
//                     .size(24.sp)
//                     .color(kTextSubColor)
//                     .make()),
//             _rowTile(
//                 R.ASSETS_MESSAGE_IC_PHONE_PNG,
//                 '负责人手机',
//                 widget.model.leaderTel!.text
//                     .size(24.sp)
//                     .color(kTextSubColor)
//                     .make()),
//           ].sepWidget(separate: 12.w.heightBox),
//           // _getBottomButtons(widget.model.status),
//         ],
//       ),
//     );
//   }

//   Widget _contentWidget() {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(8.w)),
//       padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               '访谈内容'.text.size(32.sp).color(kTextPrimaryColor).bold.make(),
//               Spacer(),
//             ],
//           ),
//           16.w.heightBox,
//           AkuDivider.horizontal(),
//           20.w.heightBox,
//           widget.model.content!.text.size(28.sp).color(kTextPrimaryColor).make(),
//           40.w.heightBox,
//           Row(
//             children: [
//               Spacer(),
//               widget.model.createDate!.text
//                   .size(24.sp)
//                   .color(kTextSubColor)
//                   .make(),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _rowTile(String iconPath, String title, Widget content) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 40.w,
//           height: 40.w,
//           child: Image.asset(iconPath),
//         ),
//         12.w.widthBox,
//         title.text.size(24.sp).color(kTextSubColor).make(),
//         Spacer(),
//         content,
//       ],
//     );
//   }
// }
class HouseKeepingDetailPage extends StatefulWidget {
  HouseKeepingDetailPage({Key? key}) : super(key: key);

  @override
  _HouseKeepingDetailPageState createState() => _HouseKeepingDetailPageState();
}

class _HouseKeepingDetailPageState extends State<HouseKeepingDetailPage> {
  @override
  Widget build(BuildContext context) {
    var payfeePrice = Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
      color: Colors.white,
      child: Row(
        children: [
          '服务费用'.text.size(28.sp).black.make(),
          Spacer(),
          '¥ ${0}'.text.size(32.sp).color(Colors.red).make()
        ],
      ),
    );
    return AkuScaffold(
      title: '服务详情',
      body: ListView(
        children: <Widget>[
          _buildInfo(),
          _buildProcess(),
          _serviceFeedBack(),
          payfeePrice,
          _buildEvaluate(),
        ].sepWidget(separate: 16.w.heightBox),
      ),
      bottom: _getBottomButtons(1),
    );
  }

  Widget _getBottomButtons(int status) {
    switch (status) {
      case 1:
        return AkuBottomButton(
          title: '立即提交',
          onTap: () {
            Get.to(() => HouseKeepingFeedBackPage());
          },
        );
      case 2:
        return AkuBottomButton(
          title: '',
          onTap: () {},
        );
      default:
        return SizedBox();
    }
  }

  Widget _serviceFeedBack() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          '服务反馈'.text.size(36.sp).bold.black.make(),
          40.w.heightBox,
          Row(
            children: [
              '完成情况'.text.size(28.sp).color(kTextSubColor).make(),
              Spacer(),
              'widget.model.completionString'.text.size(32.sp).black.make()
            ],
          ),
          40.w.heightBox,
          Row(
            children: [
              Image.asset(
                R.ASSETS_PLACEHOLDER_WEBP,
                width: 40.w,
                height: 40.w,
              ),
              8.w.widthBox,
              '维修人'.text.size(28.sp).color(kTextSubColor).make(),
              Spacer(),
              'widget.model.proposerName'.text.size(28.sp).black.make(),
            ],
          ),
          16.w.heightBox,
          Row(
            children: [
              Image.asset(
                R.ASSETS_PLACEHOLDER_WEBP,
                width: 40.w,
                height: 40.w,
              ),
              8.w.widthBox,
              '联系电话'.text.size(28.sp).color(kTextSubColor).make(),
              Spacer(),
              'widget.model.proposerTel'.text.size(28.sp).black.make(),
            ],
          ),
          16.w.heightBox,
          40.w.heightBox,
          '处理描述'.text.size(28.sp).color(kTextSubColor).make(),
          24.w.heightBox,
          ('widget.model.processDescription')
              .text
              .size(2)
              .black
              .softWrap(true)
              .make(),
          BeeGridImageView(urls: [])
        ],
      ),
    );
  }

  Widget _buildEvaluate() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 24.w),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          '服务评价'.text.size(36.sp).bold.black.make(),
          40.w.heightBox,
          Row(
            children: [
              '综合评价'.text.size(28.sp).color(kTextSubColor).make(),
              40.w.widthBox,
              RatingBar(
                  ignoreGestures: true,
                  allowHalfRating: true,
                  itemPadding: EdgeInsets.symmetric(horizontal: 15.w),
                  itemSize: 32.w,
                  initialRating: (0).toDouble(),
                  ratingWidget: RatingWidget(
                      empty: Icon(
                        CupertinoIcons.star,
                      ),
                      full: Icon(
                        CupertinoIcons.star_fill,
                        color: kPrimaryColor,
                      ),
                      half: Icon(
                        CupertinoIcons.star_lefthalf_fill,
                        color: kPrimaryColor,
                      )),
                  onRatingUpdate: (value) {})
            ],
          ),
          40.w.heightBox,
          AkuDivider.horizontal(),
          40.w.heightBox,
          ('').text.size(28.sp).black.softWrap(true).make(),
          BeeGridImageView(urls: [])
        ],
      ),
    );
  }

  _buildInfo() {
    return AkuTitleBox(
      title: '报修信息',
      suffix: ''.text.size(28.sp).black.make(),
      children: [
        16.w.heightBox,
        _buildTile(R.ASSETS_MESSAGE_IC_PEOPLE_PNG, '报修人', ''),
        _buildTile(R.ASSETS_MESSAGE_IC_PHONE_PNG, '联系电话', ''),
        _buildTile(R.ASSETS_MESSAGE_IC_AREA_PNG, '报修区域', ''),
        8.w.heightBox,
        Text(
          '',
          style: TextStyle(
            color: AppStyle.primaryTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 28.w,
          ),
        ),
        GridView(
          padding: EdgeInsets.only(top: 16.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.w,
          ),
          children: [].map((e) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(4.w),
              child: FadeInImage.assetNetwork(
                  placeholder: R.ASSETS_PLACEHOLDER_WEBP, image: API.image('')),
            );
          }).toList(),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }

  Widget _buildTile(String asset, String title, String subTitle) {
    return Row(
      children: [
        56.w.heightBox,
        Image.asset(
          asset,
          height: 40.w,
          width: 40.w,
        ),
        4.w.widthBox,
        Text(
          title,
          style: TextStyle(
            fontSize: 28.sp,
            color: AppStyle.minorTextColor,
          ),
        ),
        Spacer(),
        Text(
          subTitle,
          style: TextStyle(
            fontSize: 28.sp,
            color: AppStyle.primaryTextColor,
          ),
        ),
      ],
    );
  }

  _buildProcess() {
    return AkuTitleBox(
      title: '报修进程',
      children: [].map((e) {
        return _buildProcessTile(
          '',
          DateUtil.formatDateStr(e.operationDate!,
              format: 'yyyy-MM-dd HH:mm:ss'),
        );
      }).toList(),
    );
  }

  Widget _buildProcessTile(String title, String date) {
    return Row(
      children: [
        56.w.heightBox,
        Text(
          title,
          style: TextStyle(
            color: AppStyle.minorTextColor,
            fontSize: 28.w,
          ),
        ),
        Spacer(),
        Text(
          date,
          style: TextStyle(
            color: AppStyle.primaryTextColor,
            fontSize: 28.w,
          ),
        ),
      ],
    );
  }
}
