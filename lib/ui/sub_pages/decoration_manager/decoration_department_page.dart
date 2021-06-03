// Flutter imports:
import 'package:aku_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:expandable/expandable.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/mock_models/decoration/decoration_model.dart';
import 'package:aku_community_manager/mock_models/fix/fixer_model.dart';
import 'package:aku_community_manager/provider/fix_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

class DecorationDepartmentPage extends StatefulWidget {
  final DecorationModel model;
  DecorationDepartmentPage({Key key, @required this.model}) : super(key: key);

  @override
  _DecorationDepartmentPageState createState() =>
      _DecorationDepartmentPageState();
}

class _DecorationDepartmentPageState extends State<DecorationDepartmentPage> {
  FixerModel _pickedFixer;
  @override
  Widget build(BuildContext context) {
    final fixProvider = Provider.of<FixProvider>(context);

    return AkuScaffold(
      title: '装修指派',
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 16.w),
        itemBuilder: (context, index) {
          return _buildItem(fixProvider.propertyModels[index], index);
        },
        itemCount: fixProvider.propertyModels.length,
      ),
      bottom: AkuMaterialButton(
        height: 96.w,
        onPressed: _pickedFixer == null
            ? null
            : () {
                widget.model.cycleCheck.authPerson = _pickedFixer;
                Get.back();
              },
        color: AppStyle.primaryColor,
        nullColor: AppStyle.primaryColor.withOpacity(0.5),
        child: Text(
          '选择完成',
          style: TextStyle(
            color: _pickedFixer == null
                ? AppStyle.minorTextColor
                : AppStyle.primaryTextColor,
            fontSize: 32.w,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  _buildItem(FixerTypedModel model, int index) {
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
              model.typeName,
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
              ...model.fixers.map((e) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AkuMaterialButton(
                      height: 96.w,
                      onPressed: () {
                        if (_pickedFixer?.name != e.name) {
                          _pickedFixer = e;
                        } else {
                          _pickedFixer = null;
                        }
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          AkuBox.w(72),
                          Checkbox(
                            checkColor: AppStyle.primaryTextColor,
                            activeColor: AppStyle.primaryColor,
                            value: _pickedFixer?.name == e.name,
                            onChanged: (state) {
                              if (_pickedFixer == null) {
                                _pickedFixer = e;
                              } else {
                                _pickedFixer = null;
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
                            e.phone,
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
                    model.fixers.last == e
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
