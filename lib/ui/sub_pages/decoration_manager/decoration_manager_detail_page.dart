import 'package:aku_community_manager/mock_models/decoration/decoration_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/sub_pages/decoration_manager/decoration_util.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_title_box.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:aku_community_manager/const/resource.dart';
import 'package:flutter/material.dart';

class DecorationManagerDetailPage extends StatefulWidget {
  final DecorationModel model;
  DecorationManagerDetailPage({Key key, @required this.model})
      : super(key: key);

  @override
  _DecorationManagerDetailStatePage createState() =>
      _DecorationManagerDetailStatePage();
}

class _DecorationManagerDetailStatePage
    extends State<DecorationManagerDetailPage> {
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '装修详情',
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.w),
        children: [
          _buildInfo(),
          _buildFinishWorkCheck(),
          _buildCycleCheck(),
          _buildCheckDetail(),
        ],
      ),
    );
  }

  _buildInfo() {
    return AkuTitleBox(
      title: '装修信息',
      spacing: 24,
      suffix: Text(
        DecorationUIUtil(context).getTagName(
          widget.model.type,
          widget.model.statusType,
        ),
        style: TextStyle(
          color: DecorationUIUtil(context).getTagColor(
            widget.model.type,
            widget.model.statusType,
          ),
          fontSize: 24.w,
        ),
      ),
      children: [
        _buildInfoCard(
          tag: '家',
          midTop: widget.model.userHomeModel.plot,
          midBottom: widget.model.userHomeModel.detailAddr,
          name: '业主：' + widget.model.userHomeModel.userName,
          phone: widget.model.userHomeModel.phone,
          rightTopWidget: Placeholder(),
        ),
        AkuBox.h(16),
        _buildInfoCard(
          tag: '装',
          midTop: widget.model.decorationTeamModel.name,
          name: '负责人：' + widget.model.decorationTeamModel.userName,
          phone: widget.model.decorationTeamModel.phone,
        ),
      ],
    );
  }

  _buildInfoCard({
    String tag,
    String midTop,
    String midBottom,
    String name,
    String phone,
    Widget rightTopWidget = const SizedBox(),
  }) {
    return Stack(
      children: [
        Container(
          child: Column(
            children: [
              Expanded(
                  child: Row(
                children: [
                  AkuBox.w(32),
                  Container(
                    height: 96.w,
                    width: 96.w,
                    alignment: Alignment.center,
                    child: Text(
                      tag,
                      style: TextStyle(
                        color: AppStyle.secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 32.sp,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFE9F2FF),
                      borderRadius: BorderRadius.circular(48.w),
                    ),
                  ),
                  AkuBox.w(24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          midTop,
                          style: TextStyle(
                            color: AppStyle.primaryTextColor,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        midBottom == null
                            ? SizedBox()
                            : Text(
                                midBottom,
                                style: TextStyle(
                                  color: AppStyle.primaryTextColor,
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              )),
              Divider(
                height: 1.w,
                thickness: 1.w,
              ),
              Row(
                children: [
                  AkuBox.h(88),
                  AkuBox.w(32),
                  Image.asset(
                    R.ASSETS_MESSAGE_IC_PEOPLE_PNG,
                    height: 40.w,
                    width: 40.w,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      color: AppStyle.minorTextColor,
                      fontSize: 24.sp,
                    ),
                  ),
                  Spacer(),
                  Image.asset(
                    R.ASSETS_MESSAGE_IC_PHONE_PNG,
                    height: 40.w,
                    width: 40.w,
                  ),
                  Text(
                    '电话：$phone',
                    style: TextStyle(
                      color: AppStyle.minorTextColor,
                      fontSize: 24.sp,
                    ),
                  ),
                  AkuBox.w(42),
                ],
              ),
            ],
          ),
          height: 248.w,
          decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(8.w),
          ),
        ),
        Positioned(
          top: -30.w,
          right: -30.w,
          width: 140.w,
          height: 140.w,
          child: rightTopWidget,
        ),
      ],
    );
  }

  _buildFinishWorkCheck() {
    return AkuTitleBox(
      title: '完工检查',
      spacing: 24,
      children: [],
    );
  }

  _buildCycleCheck() {
    return AkuTitleBox(
      title: '周期检查',
      spacing: 24,
      children: [],
    );
  }

  _buildCheckDetail() {
    return AkuTitleBox(
      title: '执行信息',
      spacing: 24,
      children: [],
    );
  }
}
