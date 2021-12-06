import 'package:aku_new_community_manager/json_models/manager/engineer_repair/engineer_repair_organization_model.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/tools/aku_divider.dart';
import 'package:aku_new_community_manager/tools/extensions/list_extension_tool.dart';
import 'package:aku_new_community_manager/ui/manage_pages/engineer_repair/engineer_repair_func.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class EngineerRepairDepartCompany extends StatefulWidget {
  final int repairId;

  const EngineerRepairDepartCompany({Key? key, required this.repairId})
      : super(key: key);

  @override
  _EngineerRepairDepartCompanyState createState() =>
      _EngineerRepairDepartCompanyState();
}

class _EngineerRepairDepartCompanyState
    extends State<EngineerRepairDepartCompany> {
  bool _onLoad = true;
  List<EngineerRepairOrganizationModel> _models = [];
  int _selectId = 0;

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '选择维修公司',
      body: EasyRefresh(
        firstRefresh: true,
        header: MaterialHeader(),
        onRefresh: () async {
          _models.clear();
          _models.addAll(await EngineerRepairFunc.getOrganization());
          _onLoad = false;
          setState(() {});
        },
        child: _onLoad
            ? Container()
            : ListView(
                children: [
                  16.w.heightBox,
                  ..._models.map((e) => _buildTile(e)).toList()
                ].sepWidget(separate: AkuDivider.horizontal()),
              ),
      ),
      bottom: AkuBottomButton(
        title: '立即派单',
        onTap: _selectId == 0
            ? null
            : () async {
                var result = await EngineerRepairFunc.companySend(
                    widget.repairId, _selectId);
                if (result) {
                  Get.back();
                  Get.back();
                }
              },
      ),
    );
  }

  Widget _buildTile(EngineerRepairOrganizationModel model) {
    return GestureDetector(
      onTap: () {
        if (_selectId == model.id) {
          _selectId = 0;
        } else {
          _selectId = model.id;
        }
        setState(() {});
      },
      child: Row(
        children: [
          Checkbox(
            value: _selectId == model.id,
            onChanged: (value) {
              if (value ?? false) {
                _selectId = model.id;
              } else {
                _selectId = 0;
              }
              setState(() {});
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ).box.width(28.w).height(28.sp).make(),
          8.w.widthBox,
          model.name.text.size(32.sp).color(kTextPrimaryColor).make(),
        ],
      ).box.color(Colors.white).padding(EdgeInsets.all(32.w)).make(),
    );
  }
}
