import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/mock_models/fix/fix_model.dart';
import 'package:aku_community_manager/mock_models/users/user_info_model.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/sub_pages/fixer_department/fixer_department_page.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/show_bottom_sheet.dart';
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class BusinessAndFixDetailPage extends StatefulWidget {
  final FixModel model;
  BusinessAndFixDetailPage({Key key, this.model}) : super(key: key);

  @override
  _BusinessAndFixDetailPageState createState() =>
      _BusinessAndFixDetailPageState();
}

class _BusinessAndFixDetailPageState extends State<BusinessAndFixDetailPage> {
  USER_ROLE get userRole {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    return userProvider.userInfoModel.role;
  }

  bool get isHandOut => widget.model.type == FIX_ENUM.HAND_OUT;
  FixDetailModel get detailModel => widget.model.detail;

  String get fixType {
    switch (detailModel.type) {
      case FIX_PAYMENT_TYPE.FREE:
        return '无偿服务';
        break;
      case FIX_PAYMENT_TYPE.PAY:
        return '有偿服务';
        break;
      default:
        return '';
        break;
    }
  }

  String get dateLimit {
    switch (detailModel.limit) {
      case FIX_DATE_LIMIT.HOUR_24:
        return '24小时内处理';
        break;
      case FIX_DATE_LIMIT.HOUR_12:
        return '12小时内处理';
        break;
      case FIX_DATE_LIMIT.HOUR_8:
        return '8小时内处理';
        break;
      default:
        return '';
        break;
    }
  }

  String get subType {
    switch (detailModel.subType) {
      case FIX_SUB_TYPE.NORMAL:
        return '一般单';
        break;
      case FIX_SUB_TYPE.HURRY:
        return '加急单';
        break;
      default:
        return '';
        break;
    }
  }

  Widget get fixTypeWidget {
    if (userRole == USER_ROLE.MANAGER) {
      return Text(
        FixModel.managerRoleMap[widget.model.type],
        style: TextStyle(
          color: widget.model.type != FIX_ENUM.DONE
              ? Color(0XFFFF4501)
              : AppStyle.minorTextColor,
        ),
      );
    } else {
      return Text(
        FixModel.otherRoleMap[widget.model.type],
        style: TextStyle(
          color: widget.model.type != FIX_ENUM.DONE
              ? Color(0XFFFF4501)
              : AppStyle.minorTextColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '报修详情',
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.w),
        children: [
          _buildInfo(),
          _buildType(widget.model.type == FIX_ENUM.HAND_OUT),
          _buildProcess(),
          detailModel.result == null ? SizedBox() : _buildResult(),
          detailModel.review == null ? SizedBox() : _buildRating(),
        ],
      ),
      bottom: Builder(
        builder: (context) {
          final userProvider =
              Provider.of<UserProvider>(context, listen: false);
          if (widget.model.type == FIX_ENUM.HAND_OUT) {
            return AkuMaterialButton(
              color: AppStyle.primaryColor,
              nullColor: AppStyle.minorColor,
              onPressed: detailModel.type != null &&
                      detailModel.subType != null &&
                      detailModel.limit != null
                  ? () {
                      Get.to(FixerDepartmentPage(model: widget.model));
                    }
                  : null,
              child: Text(
                '立即派单',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else if (widget.model.type == FIX_ENUM.WAIT_PICKUP) {
            if (userProvider.userInfoModel.role == USER_ROLE.MANAGER) {
              return AkuMaterialButton(
                color: AppStyle.primaryColor,
                nullColor: AppStyle.minorColor,
                onPressed: () {
                  Get.to(FixerDepartmentPage(
                    model: widget.model,
                    changeType: true,
                  ));
                },
                child: Text(
                  '改派',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            } else {
              return AkuMaterialButton(
                color: AppStyle.primaryColor,
                nullColor: AppStyle.minorColor,
                onPressed: () {
                  final userProvider =
                      Provider.of<UserProvider>(context, listen: false);
                  detailModel.fixStatuses.add(FixStatus(
                    title: '${userProvider.userInfoModel.nickName}已接单',
                    date: DateTime.now(),
                  ));
                  widget.model.type = FIX_ENUM.PROCESSING;
                  Get.back();
                },
                child: Text(
                  '立即接单',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
          } else if (widget.model.type == FIX_ENUM.PROCESSING &&
              userProvider.userInfoModel.role == USER_ROLE.FIXER)
            return Container(
              height: 96.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -10.w),
                    blurRadius: 10.w,
                    color: Color(0xFFF9F9F9),
                  )
                ],
              ),
              child: Row(
                children: [
                  AkuBox.w(32),
                  MaterialButton(
                    height: 72.w,
                    minWidth: 304.w,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.w),
                      side: BorderSide(
                        width: 2.w,
                        color: AppStyle.primaryColor,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      '申请延时',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  AkuMaterialButton(
                    height: 72.w,
                    minWidth: 304.w,
                    radius: 4.w,
                    color: AppStyle.primaryColor,
                    onPressed: () {},
                    child: Text(
                      '处理完成',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  AkuBox.w(32),
                ],
              ),
            );
          else
            return SizedBox();
        },
      ),
    );
  }

  _buildInfo() {
    return _buildRawBox(
      title: '报修信息',
      suffix: fixTypeWidget,
      children: [
        AkuBox.h(16),
        _buildTile(
          R.ASSETS_MESSAGE_IC_PEOPLE_PNG,
          '报修人',
          widget.model.detail.userName,
        ),
        _buildTile(
          R.ASSETS_MESSAGE_IC_PHONE_PNG,
          '联系电话',
          widget.model.detail.userPhoneNumber,
        ),
        _buildTile(
          R.ASSETS_MESSAGE_IC_AREA_PNG,
          '报修区域',
          widget.model.detail.fixArea,
        ),
        AkuBox.h(8),
        Text(
          widget.model.title,
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
          children: widget.model.imgs.map((e) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(4.w),
              child: (e is String) ? Image.asset(e) : Image.file(e),
            );
          }).toList(),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }

  _buildType(bool canTap) {
    return _buildRawBox(
      title: '工单类型',
      children: [
        _buildTypeTile(
          '派单类型',
          fixType,
          canTap,
          helpContent: '请选择服务类型',
          onTap: () {
            showItemSheet(
              title: '派单类型',
              items: ['无偿服务', '有偿服务'],
              selectItem: fixPaymentMap[detailModel.type],
              onTap: (result) {
                detailModel.type = fixPaymentStringMap[result];
              },
            ).then((_) {
              setState(() {});
            });
          },
        ),
        _buildTypeTile(
          '工单时限',
          dateLimit,
          canTap,
          helpContent: '请选择工单时限',
          onTap: () {
            showItemSheet(
              title: '工单时限',
              items: ['24小时内处理', '12小时内处理', '8小时内处理'],
              selectItem: fixDateLimitMap[detailModel.limit],
              onTap: (result) {
                detailModel.limit = fixDateLimitStringMap[result];
              },
            ).then((_) {
              setState(() {});
            });
          },
        ),
        _buildTypeTile(
          '工单子类',
          subType,
          canTap,
          helpContent: '请选择工单子类',
          onTap: () {
            showItemSheet(
              title: '工单子类',
              items: ['一般单', '加急单'],
              selectItem: fixSubTypeMap[detailModel.subType],
              onTap: (result) {
                detailModel.subType = fixSubTypeStringMap[result];
              },
            ).then((_) {
              setState(() {});
            });
          },
        ),
      ],
    );
  }

  _buildProcess() {
    return _buildRawBox(
      title: '报修进程',
      children: detailModel.fixStatuses.map((e) {
        return _buildProcessTile(
          e.title,
          DateUtil.formatDate(e.date, format: 'yyyy-MM-dd HH:mm:ss'),
        );
      }).toList(),
    );
  }

  _buildResult() {
    return _buildRawBox(
      title: '处理情况',
      spacing: 24,
      children: [
        Text(
          '处理描述',
          style: TextStyle(
            color: AppStyle.minorTextColor,
            fontSize: 28.w,
          ),
        ),
        AkuBox.h(8),
        Text(
          detailModel.result.detail,
          style: TextStyle(
            color: AppStyle.primaryTextColor,
            fontSize: 28.w,
            fontWeight: FontWeight.bold,
          ),
        ),
        AkuBox.h(24),
        Text(
          '更换材料',
          style: TextStyle(
            color: AppStyle.minorTextColor,
            fontSize: 28.w,
          ),
        ),
        AkuBox.h(8),
        Text(
          detailModel.result.material,
          style: TextStyle(
            color: AppStyle.primaryTextColor,
            fontSize: 28.w,
            fontWeight: FontWeight.bold,
          ),
        ),
        AkuBox.h(24),
        Text(
          '上传照片',
          style: TextStyle(
            color: AppStyle.minorTextColor,
            fontSize: 28.w,
          ),
        ),
        AkuBox.h(8),
        GridView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          children: detailModel.result.imgs.map((e) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(4.w),
              child: (e is String) ? Image.asset(e) : Image.file(e),
            );
          }).toList(),
        ),
      ],
    );
  }

  _buildRating() {
    return _buildRawBox(
      title: '评价信息',
      spacing: 24,
      children: [
        Row(
          children: [
            Text(
              '综合评分',
              style: TextStyle(
                color: AppStyle.minorTextColor,
                fontSize: 28.w,
              ),
            ),
            Spacer(),
            _buildStar(detailModel.review.rate),
          ],
        ),
        AkuBox.h(24),
        Text(
          '评价内容',
          style: TextStyle(
            color: AppStyle.minorTextColor,
            fontSize: 28.w,
          ),
        ),
        AkuBox.h(8),
        Text(
          detailModel.review.content,
          style: TextStyle(
            color: AppStyle.primaryTextColor,
            fontSize: 28.w,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildTile(String asset, String title, String subTitle) {
    return Row(
      children: [
        AkuBox.h(56),
        Image.asset(
          asset,
          height: 40.w,
          width: 40.w,
        ),
        AkuBox.w(4),
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

  Widget _buildTypeTile(String title, String content, bool canTap,
      {VoidCallback onTap, String helpContent}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: canTap ? onTap : null,
        child: Row(
          children: [
            AkuBox.h(96),
            Text(
              title,
              style: TextStyle(
                fontSize: 28.sp,
                color: AppStyle.primaryTextColor,
              ),
            ),
            Spacer(),
            Text(
              TextUtil.isEmpty(content) ? helpContent : content,
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: TextUtil.isEmpty(content)
                    ? AppStyle.minorTextColor
                    : AppStyle.primaryTextColor,
              ),
            ),
            isHandOut ? AkuBox.w(24) : SizedBox(),
            isHandOut
                ? Icon(
                    Icons.arrow_forward_ios,
                    size: 24.w,
                    color: AppStyle.minorTextColor,
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildProcessTile(String title, String date) {
    return Row(
      children: [
        AkuBox.h(56),
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

  _buildStar(double count) {
    List<Widget> children = [];
    for (int i = 0; i < count; i++) {
      children.add(Icon(
        Icons.star,
        color: AppStyle.primaryColor,
        size: 32.w,
      ));
      children.add(AkuBox.w(16));
    }
    return Row(
      children: children..removeLast(),
    );
  }

  _buildRawBox({
    String title,
    List<Widget> children,
    Widget suffix,
    double spacing = 0,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 32.w),
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppStyle.primaryTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 36.sp,
                ),
              ),
              Spacer(),
              suffix ?? SizedBox(),
            ],
          ),
          AkuBox.h(spacing),
          ...children,
        ],
      ),
    );
  }
}
