import 'package:aku_community_manager/mock_models/decoration/decoration_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/sub_pages/decoration_manager/decoration_check_row.dart';
import 'package:aku_community_manager/ui/sub_pages/decoration_manager/decoration_checkbox.dart';
import 'package:aku_community_manager/ui/sub_pages/decoration_manager/decoration_util.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_title_box.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:aku_community_manager/const/resource.dart';
import 'package:common_utils/common_utils.dart';
import 'package:expandable/expandable.dart';
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
      children: [
        _buildRow(
          title: '开始装修时间',
          subTitle: DateUtil.formatDate(
            widget.model.workFinishCheck.decorationDate,
            format: 'yyyy-MM-dd',
          ),
        ),
        _buildRow(
          title: '接受人',
          subTitle: widget.model.workFinishCheck.authPerson.name,
        ),
        _buildRow(title: '所属项目', subTitle: '装修管理'),
        _buildRow(
          title: '开始日期',
          subTitle: DateUtil.formatDate(
            widget.model.workFinishCheck.startDate,
            format: 'yyyy-MM-dd',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 28.w,
          ),
          child: Text(
            '检查内容',
            style: TextStyle(
              color: AppStyle.primaryTextColor,
              fontSize: 28.w,
            ),
          ),
        ),
        DecorationCheckRow(details: widget.model.workFinishCheck.checkDetails),
      ],
    );
  }

  _buildCycleCheck() {
    return AkuTitleBox(
      title: '周期检查',
      spacing: 24,
      children: [
        _buildRow(
          title: '开始装修时间',
          subTitle: DateUtil.formatDate(
            widget.model.cycleCheck.decorationDate,
            format: 'yyyy-MM-dd',
          ),
        ),
        _buildRow(
          title: '接受人',
          subTitle: widget.model.cycleCheck.authPerson.name,
        ),
        _buildRow(title: '所属项目', subTitle: '装修管理'),
        _buildRow(
          title: '开始日期',
          subTitle: DateUtil.formatDate(
            widget.model.cycleCheck.startDate,
            format: 'yyyy-MM-dd',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 28.w,
          ),
          child: Text(
            '检查内容',
            style: TextStyle(
              color: AppStyle.primaryTextColor,
              fontSize: 28.w,
            ),
          ),
        ),
        DecorationCheckRow(details: widget.model.cycleCheck.checkDetails),
      ],
    );
  }

  _buildCheckDetail() {
    return AkuTitleBox(
      title: '执行信息',
      spacing: 24,
      children: widget.model.checkInfomations.map((e) {
        return Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFE8E8E8),
                width: 1.w,
              ),
            ),
          ),
          child: ExpandablePanel(
            theme: ExpandableThemeData(
              tapHeaderToExpand: true,
              iconPlacement: ExpandablePanelIconPlacement.right,
              iconPadding: EdgeInsets.only(top: 32.w),
              iconSize: 32.w,
              iconColor: AppStyle.minorTextColor,
            ),
            header: Row(
              children: [
                AkuBox.h(96),
                Text(
                  '${DateUtil.formatDate(e.checkDate, format: 'yyyy-MM-dd')} ' +
                      e.checkType,
                  style: TextStyle(
                    color: AppStyle.primaryTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 28.sp,
                  ),
                ),
                Spacer(),
                Text(
                  e.checkAllResult ? '正常' : '异常',
                  style: TextStyle(
                    color: e.checkAllResult
                        ? Color(0xFF32B814)
                        : Color(0xFFFF4501),
                    fontSize: 28.sp,
                  ),
                ),
              ],
            ),
            expanded: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...e.details.map((e) {
                  return Container(
                    height: 96.w,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color(0xFFE8E8E8),
                          width: 1.w,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        AkuBox.w(48),
                        Image.asset(
                          e.assetpath,
                          height: 40.w,
                        ),
                        Text(
                          e.typeValue,
                          style: TextStyle(
                            fontSize: 28.sp,
                            color: AppStyle.primaryTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        DecorationCheckBox(
                          initValue: e.status,
                        ),
                        Spacer(),
                      ],
                    ),
                  );
                }).toList(),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 1.w,
                        color: Color(0xFFE8E8E8),
                      ),
                    ),
                  ),
                  height: 96.w,
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  alignment: Alignment.centerLeft,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '检查描述:',
                          style: TextStyle(
                            color: AppStyle.minorTextColor,
                          ),
                        ),
                        TextSpan(
                          text: e.info,
                        ),
                      ],
                      style: TextStyle(
                        color: AppStyle.primaryTextColor,
                        fontSize: 28.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  _buildRow({
    String title,
    String subTitle,
  }) {
    return Container(
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Color(0xFFE8E8E8), width: 1.w)),
      ),
      child: InkWell(
        child: Row(
          children: [
            AkuBox.h(96),
            Text(
              title,
              style: TextStyle(
                color: AppStyle.primaryTextColor,
                fontSize: 28.w,
              ),
            ),
            Spacer(),
            Text(
              subTitle,
              style: TextStyle(
                color: AppStyle.primaryTextColor,
                fontSize: 28.w,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
