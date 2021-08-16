import 'package:aku_community_manager/json_models/manager/engineer_repair/engineer_repair_person_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/manage_pages/engineer_repair/engineer_repair_func.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EngineerRepairDepartPersonPage extends StatefulWidget {
  final int organizationId;
  final String organizationName;
  final int repairId;

  const EngineerRepairDepartPersonPage(
      {Key? key,
      required this.organizationId,
      required this.organizationName,
      required this.repairId})
      : super(key: key);

  @override
  _EngineerRepairDepartPersonPageState createState() =>
      _EngineerRepairDepartPersonPageState();
}

class _EngineerRepairDepartPersonPageState
    extends State<EngineerRepairDepartPersonPage> {
  bool _onLoad = true;
  List<EngineerRepairPersonModel> _models = [];
  int _selectId = 0;

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '选择维修人员',
      body: EasyRefresh(
        firstRefresh: true,
        header: MaterialHeader(),
        onRefresh: () async {
          _models.addAll(
              await EngineerRepairFunc.getPersons(widget.organizationId));
          if (_models.isNotEmpty) {
            _onLoad = false;
            setState(() {});
          }
        },
        child: _onLoad
            ? Container()
            : ListView(
                padding: EdgeInsets.only(top: 16.w),
                children: [_buildBody()],
              ),
      ),
      bottom: AkuBottomButton(
        title: '立即派单',
        onTap: _selectId == 0
            ? null
            : () async {
                var result = await EngineerRepairFunc.personSend(
                    widget.repairId, _selectId);
                if (result) {
                  Get.back();
                }
              },
      ),
    );
  }

  Widget _buildBody() {
    return Material(
      color: Colors.white,
      child: ExpandablePanel(
        controller: ExpandableController(initialExpanded: true),
        header: Container(
          height: 96.w,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Text(
            widget.organizationName,
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
            ..._models.map((e) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AkuMaterialButton(
                    height: 96.w,
                    onPressed: () {
                      _selectId = e.id;
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        AkuBox.w(72),
                        Checkbox(
                          checkColor: AppStyle.primaryTextColor,
                          activeColor: AppStyle.primaryColor,
                          value: _selectId == e.id,
                          onChanged: (state) {
                            if (!(state ?? false)) {
                              _selectId = 0;
                            } else {
                              _selectId = e.id;
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
                          e.userName,
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
                  _models.last == e
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
    );
  }
}
