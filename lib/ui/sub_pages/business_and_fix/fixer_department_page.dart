// Flutter imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/fixer_item_model.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/mock_models/fix/fix_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

class FixerDepartmentPage extends StatefulWidget {
  final FixModel model;
  final bool changeType;
  FixerDepartmentPage({Key key, @required this.model, this.changeType = false})
      : super(key: key);

  @override
  _FixerDepartmentPageState createState() => _FixerDepartmentPageState();
}

class _FixerDepartmentPageState extends State<FixerDepartmentPage> {
  List<RepairmanVos> _pickedFixers = [];

  List<FixerItemModel> _fixerItems = [];
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '房屋管理维修部',
      body: EasyRefresh(
        firstRefresh: true,
        header: MaterialHeader(),
        onRefresh: () async {
          BaseModel model = await NetUtil().get(API.manage.fixers);
          _fixerItems = (model.data as List)
              .map((e) => FixerItemModel.fromJson(e))
              .toList();
          setState(() {});
        },
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 16.w),
          itemBuilder: (context, index) {
            return _buildItem(_fixerItems[index], index);
          },
          itemCount: _fixerItems.length,
        ),
      ),
      bottom: AkuMaterialButton(
        height: 96.w,
        onPressed: _pickedFixers.isEmpty
            ? null
            : () {
                if (widget.changeType) {
                  Get.back();
                  _pickedFixers.forEach((element) {
                    widget.model.detail.fixStatuses.add(
                      FixStatus(
                          title: '改派给${element.name}', date: DateTime.now()),
                    );
                  });
                } else {
                  Get.back();
                  Get.back();
                  widget.model.type = FIX_ENUM.WAIT_PICKUP;
                  _pickedFixers.forEach((element) {
                    widget.model.detail.fixStatuses.add(
                      FixStatus(
                          title: '分配给${element.name}', date: DateTime.now()),
                    );
                  });
                }
              },
        color: AppStyle.primaryColor,
        nullColor: AppStyle.primaryColor.withOpacity(0.5),
        child: Text(
          '立即派单',
          style: TextStyle(
            color: _pickedFixers.isEmpty
                ? AppStyle.minorTextColor
                : AppStyle.primaryTextColor,
            fontSize: 32.w,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  _buildItem(FixerItemModel model, int index) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: index == 0
              ? BorderSide.none
              : BorderSide(color: Color(0xFFE8E8E8), width: 1.w),
          bottom: BorderSide(color: Color(0xFFE8E8E8), width: 1.w),
        ),
      ),
      child: Material(
        color: Colors.white,
        child: ExpandablePanel(
          controller: ExpandableController(initialExpanded: true),
          header: Container(
            height: 96.w,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Text(
              model.name,
              style: TextStyle(
                color: AppStyle.primaryTextColor,
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          collapsed: SizedBox(),
          expanded: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(
                color: Color(0xFFE8E8E8),
                height: 1.w,
                thickness: 1.w,
              ),
              ...model.repairmanVos.map((e) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AkuMaterialButton(
                      height: 96.w,
                      onPressed: () {
                        if (_pickedFixers
                                .indexWhere((element) => element.id == e.id) ==
                            -1) {
                          _pickedFixers.add(e);
                        } else {
                          _pickedFixers.remove(e);
                        }
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          AkuBox.w(72),
                          Checkbox(
                            checkColor: AppStyle.primaryTextColor,
                            activeColor: AppStyle.primaryColor,
                            value: _pickedFixers.indexOf(e) != -1,
                            onChanged: (state) {
                              if (_pickedFixers.indexOf(e) == -1) {
                                _pickedFixers.add(e);
                              } else {
                                _pickedFixers.remove(e);
                              }
                              setState(() {});
                            },
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          Image.asset(
                            R.ASSETS_MESSAGE_IC_PEOPLE_PNG,
                            height: 40.w,
                            width: 40.w,
                          ),
                          Text(
                            e.name,
                            style: TextStyle(
                              color: AppStyle.primaryTextColor,
                              fontSize: 28.w,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Image.asset(
                            R.ASSETS_MESSAGE_IC_PHONE_PNG,
                            height: 40.w,
                            width: 40.w,
                          ),
                          Text(
                            e.tel,
                            style: TextStyle(
                              color: AppStyle.primaryTextColor,
                              fontSize: 28.w,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          AkuBox.w(101),
                        ],
                      ),
                    ),
                    model.repairmanVos.last == e
                        ? SizedBox()
                        : Divider(
                            indent: 32.w,
                            endIndent: 32.w,
                            height: 1.w,
                            thickness: 1.w,
                            color: Color(0xFFE8E8E8),
                          ),
                  ],
                );
              }).toList()
            ],
          ),
          theme: ExpandableThemeData(
            tapHeaderToExpand: true,
            iconPlacement: ExpandablePanelIconPlacement.right,
            iconPadding: EdgeInsets.only(top: 32.w, right: 32.w),
            iconSize: 32.w,
            iconColor: AppStyle.minorTextColor,
          ),
        ),
      ),
    );
  }
}
