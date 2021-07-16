import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:aku_community_manager/utils/extension/list_extension.dart';

class HouseKeepingDepartmentPage extends StatefulWidget {
  HouseKeepingDepartmentPage({Key? key}) : super(key: key);

  @override
  _HouseKeepingDepartmentPageState createState() =>
      _HouseKeepingDepartmentPageState();
}

class _HouseKeepingDepartmentPageState
    extends State<HouseKeepingDepartmentPage> {
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '派单人员列表',
      body: EasyRefresh(
          firstRefresh: true,
          header: MaterialHeader(),
          onRefresh: () async {},
          child: ListView(
            children: [
              _buildItem(1),
            ],
          )),
    );
  }

  _buildItem(int index) {
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
              'model.name!',
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
              ...[].map((e) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AkuMaterialButton(
                      height: 96.w,
                      onPressed: () {
                        // if (_pickedFixers
                        //         .indexWhere((element) => element.id == e.id) ==
                        //     -1) {
                        //   _pickedFixers.add(e);
                        // } else {
                        //   _pickedFixers.remove(e);
                        // }
                        // _reportModel!.operato = e.id;
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          72.w.widthBox,
                          Checkbox(
                            checkColor: AppStyle.primaryTextColor,
                            activeColor: AppStyle.primaryColor,
                            value: false,
                            onChanged: (state) {
                              // if (_pickedFixers.indexOf(e) == -1) {
                              //   _pickedFixers.add(e);
                              // } else {
                              //   _pickedFixers.remove(e);
                              // }
                              // if (_reportModel!.operato == e.id) {
                              //   _reportModel!.operato = -1;
                              // } else {
                              //   _reportModel!.operato = e.id;
                              // }
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
                            e.name!,
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
                            e.tel!,
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
