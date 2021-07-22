import 'package:aku_community_manager/json_models/manager/house_keeping/house_keeping_pick_staff_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/manage_pages/house_keeping/house_keeping_func.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:aku_community_manager/utils/extension/list_extension.dart';

class HouseKeepingDepartmentPage extends StatefulWidget {
  final int id;
  final VoidCallback callRefresh;
  HouseKeepingDepartmentPage(
      {Key? key, required this.id, required this.callRefresh})
      : super(key: key);

  @override
  _HouseKeepingDepartmentPageState createState() =>
      _HouseKeepingDepartmentPageState();
}

class _HouseKeepingDepartmentPageState
    extends State<HouseKeepingDepartmentPage> {
  List<HouseKeepingPickStaffModel> _models = [];
  int _selectId = 0;
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
        title: '派单人员列表',
        body: EasyRefresh(
            firstRefresh: true,
            header: MaterialHeader(),
            onRefresh: () async {
              _models = await HouseKeepingFunc.newHouseKeepingPickStaffList();
            },
            child: ListView(
                padding: EdgeInsets.all(32.w),
                children: [_buildItem(_models)])),
        bottom: AkuBottomButton(
          title: '立即派单',
          onTap: () async {
            bool result = await HouseKeepingFunc.newHouseKeepingOrderDepart(
                widget.id, _selectId);
            if (result) {
              Get.back();
              widget.callRefresh();
            }
          },
        ));
  }

  _buildItem(List<HouseKeepingPickStaffModel> models) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide.none,
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
              '环境卫生部',
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
              ...models.map((e) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AkuMaterialButton(
                      height: 96.w,
                      onPressed: () {
                        if (_selectId == e.id) {
                          _selectId = 0;
                        } else {
                          _selectId = e.id;
                        }
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          72.w.widthBox,
                          Checkbox(
                            checkColor: AppStyle.primaryTextColor,
                            activeColor: AppStyle.primaryColor,
                            value: _selectId == e.id,
                            onChanged: (state) {
                              if (state ?? false) {
                                _selectId = e.id;
                              } else {
                                _selectId = 0;
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
                            e.actualName,
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
                          100.w.widthBox,
                        ],
                      ),
                    ),
                  ].sepWidget(
                    separate: Divider(
                      indent: 32.w,
                      endIndent: 32.w,
                      height: 1.w,
                      thickness: 1.w,
                      color: Color(0xFFE8E8E8),
                    ),
                  ),
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
