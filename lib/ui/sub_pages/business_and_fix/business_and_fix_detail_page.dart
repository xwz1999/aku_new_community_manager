import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/mock_models/fix/fix_model.dart';
import 'package:aku_community_manager/mock_models/users/user_info_model.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
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
          _buildType(),
          _buildProcess(),
          _buildResult(),
        ],
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

  _buildType() {
    return _buildRawBox(
      title: '工单类型',
      children: [
        _buildTypeTile('派单类型', fixType, false),
        _buildTypeTile('工单时限', dateLimit, false),
        _buildTypeTile('工单子类', subType, false),
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

  Widget _buildTypeTile(String title, String content, bool canTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: canTap ? () {} : null,
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
              content,
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: AppStyle.primaryTextColor,
              ),
            ),
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
