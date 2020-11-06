import 'package:aku_community_manager/mock_models/decoration/decoration_model.dart';
import 'package:aku_community_manager/mock_models/users/user_info_model.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/sub_pages/decoration_manager/decoration_check_row.dart';
import 'package:aku_community_manager/ui/sub_pages/decoration_manager/decoration_checkbox.dart';
import 'package:aku_community_manager/ui/sub_pages/decoration_manager/decoration_department_page.dart';
import 'package:aku_community_manager/ui/sub_pages/decoration_manager/decoration_follow_check.dart';
import 'package:aku_community_manager/ui/sub_pages/decoration_manager/decoration_util.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_back_button.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_title_box.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/ui/widgets/inner/show_bottom_sheet.dart';
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:common_utils/common_utils.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

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
  bool get isWaitHandOut => widget.model.type == DecorationType.WAIT_HAND_OUT;
  USER_ROLE get role =>
      Provider.of<UserProvider>(context, listen: false).userInfoModel.role;
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '装修详情',
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.w),
        children: [
          _buildInfo(),
          widget.model.workFinishCheck == null
              ? SizedBox()
              : _buildFinishWorkCheck(),
          _buildCycleCheck(),
          widget.model.checkInfomations == null
              ? SizedBox()
              : _buildCheckDetail(),
        ],
      ),
      bottom: Builder(builder: (context) {
        final CycleCheck cycleCheck = widget.model.cycleCheck;
        if (role == USER_ROLE.MANAGER) {
          switch (widget.model.type) {
            case DecorationType.WAIT_HAND_OUT:
              return AkuBottomButton(
                title: '立即安排',
                onTap: cycleCheck.authPerson != null &&
                        cycleCheck.checkCycle != null &&
                        cycleCheck.startDate != null
                    ? () {
                        widget.model.type = DecorationType.HAND_OUT;
                        setState(() {});
                      }
                    : null,
              );
              break;
            default:
              return SizedBox();
              break;
          }

          // else if(widget.model.type)
        } else if (role == USER_ROLE.PROPERTY) {
          switch (widget.model.type) {
            case DecorationType.HAND_OUT:
              return AkuBottomButton(
                title: '立即执行',
                onTap: () {
                  Get.to(DecorationFollowCheck(model: widget.model));
                },
              );
              break;
            default:
              return SizedBox();
              break;
          }
        } else
          return SizedBox();
      }),
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
            widget.model.decorationDate,
            format: 'yyyy-MM-dd',
          ),
        ),
        _buildRow(
          title: '接受人',
          subTitle: widget.model.workFinishCheck?.authPerson?.name,
        ),
        _buildRow(title: '所属项目', subTitle: '装修管理'),
        _buildRow(
          title: '开始日期',
          subTitle: DateUtil.formatDate(
            widget.model.workFinishCheck?.startDate,
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
        DecorationCheckRow(
          details: widget.model.workFinishCheck?.checkDetails,
          onChange: (details) {},
        ),
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
            widget.model.decorationDate,
            format: 'yyyy-MM-dd',
          ),
        ),
        _buildRow(
          title: '接受人',
          subTitle: widget.model.cycleCheck?.authPerson?.name,
          onTap: isWaitHandOut
              ? () {
                  Get.to(DecorationDepartmentPage(
                    model: widget.model,
                  )).then((value) => setState(() {}));
                }
              : null,
        ),
        _buildRow(title: '所属项目', subTitle: '装修管理'),
        _buildRow(
          title: '开始日期',
          subTitle: DateUtil.formatDate(
            widget.model.cycleCheck?.startDate,
            format: 'yyyy-MM-dd',
          ),
          onTap: isWaitHandOut
              ? () {
                  showAkuSheet(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            AkuBox.h(96),
                            AkuBackButton.text(),
                            Spacer(),
                            Text(
                              '开始日期',
                              style: TextStyle(
                                color: AppStyle.primaryTextColor,
                                fontSize: 32.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            AkuMaterialButton(
                              minWidth: (64 + 56).w,
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                '确定',
                                style: TextStyle(
                                  color: AppStyle.secondaryColor,
                                  fontSize: 28.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 500.w,
                          child: CupertinoDatePicker(
                            onDateTimeChanged: (dateTime) {
                              widget.model.cycleCheck.startDate = dateTime;
                            },
                          ),
                        ),
                      ],
                    ),
                  ).then((value) {
                    setState(() {});
                  });
                }
              : null,
        ),
        _buildRow(
          title: '检查周期',
          subTitle: widget.model.cycleCheck.checkCycle == null
              ? null
              : '${widget.model.cycleCheck.checkCycle}天',
          onTap: isWaitHandOut
              ? () {
                  showAkuSheet(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            AkuBox.h(96),
                            AkuBackButton.text(),
                            Spacer(),
                            Text(
                              '检查周期',
                              style: TextStyle(
                                color: AppStyle.primaryTextColor,
                                fontSize: 32.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            AkuMaterialButton(
                              minWidth: (64 + 56).w,
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                '确定',
                                style: TextStyle(
                                  color: AppStyle.secondaryColor,
                                  fontSize: 28.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 500.w,
                          child: CupertinoPicker(
                            children: [
                              Center(
                                child: Text('1天'),
                              ),
                              Center(
                                child: Text('3天'),
                              ),
                              Center(
                                child: Text('7天'),
                              ),
                              Center(
                                child: Text('14天'),
                              ),
                              Center(
                                child: Text('30天'),
                              ),
                            ],
                            itemExtent: 88.w,
                            onSelectedItemChanged: (int value) {
                              int realValue = 0;
                              switch (value) {
                                case 0:
                                  realValue = 1;
                                  break;
                                case 1:
                                  realValue = 3;
                                  break;
                                case 2:
                                  realValue = 7;
                                  break;
                                case 3:
                                  realValue = 14;
                                  break;
                                case 4:
                                  realValue = 30;
                                  break;
                              }
                              widget.model.cycleCheck.checkCycle = realValue;
                            },
                          ),
                        ),
                      ],
                    ),
                  ).then((value) {
                    setState(() {});
                  });
                }
              : null,
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
        DecorationCheckRow(
          details: [
            CHECK_TYPE.ELECTRIC,
            CHECK_TYPE.WATER,
            CHECK_TYPE.WALL,
            CHECK_TYPE.DOOR_AND_WINDOWS,
            CHECK_TYPE.SECURITY,
          ],
          onChange: (details) {
            widget.model.cycleCheck.checkDetails = details;
          },
          canTap: isWaitHandOut,
        )
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
    VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Color(0xFFE8E8E8), width: 1.w)),
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
                  TextUtil.isEmpty(subTitle) ? '请选择' : subTitle,
                  style: TextStyle(
                    color: TextUtil.isEmpty(subTitle)
                        ? AppStyle.minorTextColor
                        : AppStyle.primaryTextColor,
                    fontSize: 28.w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap == null ? SizedBox() : AkuBox.w(24),
                onTap == null
                    ? SizedBox()
                    : Icon(
                        Icons.arrow_forward_ios,
                        size: 32.w,
                        color: AppStyle.minorTextColor,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
