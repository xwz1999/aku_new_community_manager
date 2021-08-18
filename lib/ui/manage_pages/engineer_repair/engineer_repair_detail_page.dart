import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/json_models/manager/engineer_repair/engineer_repair_detail_model.dart';
import 'package:aku_community_manager/json_models/manager/engineer_repair/engineer_repair_new_acceptance_record_model.dart';
import 'package:aku_community_manager/json_models/manager/engineer_repair/engineer_repair_process_model.dart';
import 'package:aku_community_manager/json_models/manager/engineer_repair/engineer_repair_result_model.dart';
import 'package:aku_community_manager/json_models/manager/engineer_repair/engineer_repair_work_report_model.dart';
import 'package:aku_community_manager/models/user/user_info_model.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/user_tool.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/manage_pages/engineer_repair/engineer_repair_acceptance_page.dart';
import 'package:aku_community_manager/ui/manage_pages/engineer_repair/engineer_repair_acceptance_record_list_page.dart';
import 'package:aku_community_manager/ui/manage_pages/engineer_repair/engineer_repair_acceptance_result_page.dart';
import 'package:aku_community_manager/ui/manage_pages/engineer_repair/engineer_repair_complete_page.dart';
import 'package:aku_community_manager/ui/manage_pages/engineer_repair/engineer_repair_depart_company_page.dart';
import 'package:aku_community_manager/ui/manage_pages/engineer_repair/engineer_repair_depart_person_page.dart';
import 'package:aku_community_manager/ui/manage_pages/engineer_repair/engineer_repair_func.dart';
import 'package:aku_community_manager/ui/manage_pages/engineer_repair/engineer_repair_report_page.dart';
import 'package:aku_community_manager/ui/widgets/app_widgets/bee_grid_image_view.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_title_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'engineer_repair_map.dart';

class EngineerRepairDetailPage extends StatefulWidget {
  final int repairEngineerId;

  const EngineerRepairDetailPage({Key? key, required this.repairEngineerId})
      : super(key: key);

  @override
  _EngineerRepairDetailPageState createState() =>
      _EngineerRepairDetailPageState();
}

class _EngineerRepairDetailPageState extends State<EngineerRepairDetailPage> {
  EasyRefreshController _refreshController = EasyRefreshController();
  bool _onLoad = true;
  EngineerRepairDetailModel? _model;
  List<EngineerRepairProcessModel> _processModels = [];
  List<EngineerRepairWorkReportModel> _reportModels = [];

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '工程维修',
      body: EasyRefresh(
        firstRefresh: true,
        header: MaterialHeader(),
        onRefresh: () async {
          _model = await EngineerRepairFunc.getEngineerRepairDetail(
              widget.repairEngineerId);
          _processModels.clear();
          _reportModels.clear();
          _processModels.addAll(
              await EngineerRepairFunc.getProcess(widget.repairEngineerId));
          _reportModels.addAll(
              await EngineerRepairFunc.getWorkReport(widget.repairEngineerId));

          if (_model != null) {
            _onLoad = false;
            setState(() {});
          }
        },
        controller: _refreshController,
        child: _onLoad
            ? Container()
            : ListView(
                padding: EdgeInsets.symmetric(vertical: 16.w),
                children: [
                  _buildInfo(),
                  if (_model?.maintenanceStaff != null) _buildOperator(),
                  if (_model?.organizationId != null) _buildOrganization(),
                  if (_processModels.isNotEmpty) _buildProcess(),
                  if (_reportModels.isNotEmpty) _buildReport(),
                  GestureDetector(
                    onTap: () async {
                      List<EngineerRepairNewAcceptanceRecordModel> models = [];
                      models.addAll(
                          await EngineerRepairFunc.getAcceptanceRecordList(
                              widget.repairEngineerId));
                      await Get.to(() => EngineerRepairAcceptanceRecordListPage(
                          models: models));
                    },
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(32.w),
                      child: Row(
                        children: [
                          '查看验收记录'
                              .text
                              .size(28.sp)
                              .color(kTextPrimaryColor)
                              .make(),
                          Spacer(),
                          Icon(
                            CupertinoIcons.chevron_right,
                            size: 40.w,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
      bottom: _bottomButtons(),
    );
  }

  Widget _bottomButtons() {
    if (_model != null) {
      switch (_model!.status) {
        case 1:
          return UserTool.userProvider.infoModel!.engineeringRepairAuthority ==
                  ERAUTH.SENDTOCOMPANY
              ? AkuBottomButton(
                  title: '立即派单',
                  onTap: () async {
                    await Get.to(EngineerRepairDepartCompany(
                        repairId: widget.repairEngineerId));
                  },
                )
              : SizedBox();
        case 2:
          print(UserTool.userProvider.infoModel!.engineeringRepairAuthority ==
              ERAUTH.SENDTOPERSON);
          return UserTool.userProvider.infoModel!.engineeringRepairAuthority ==
                  ERAUTH.SENDTOPERSON
              ? AkuBottomButton(
                  title: '立即派单',
                  onTap: () async {
                    await Get.to(EngineerRepairDepartPersonPage(
                        organizationId: _model!.organizationId!,
                        organizationName: _model!.organizationName!,
                        repairId: _model!.id));
                  },
                )
              : SizedBox();
        case 3:
          return UserTool.userProvider.infoModel!.engineeringRepairAuthority ==
                  ERAUTH.PICK
              ? AkuBottomButton(
                  title: '立即接单',
                  onTap: () async {
                    var result =
                        await EngineerRepairFunc.personPick(_model!.id);
                    if (result) {
                      Get.back();
                    }
                  },
                )
              : SizedBox();
        case 4:
          return UserTool.userProvider.infoModel!.engineeringRepairAuthority ==
                  ERAUTH.PICK
              ? Row(
                  children: [
                    AkuMaterialButton(
                        minWidth: 287.w,
                        onPressed: () async {
                          await Get.to(() =>
                              EngineerRepairCompletePage(detailModel: _model!));
                        },
                        color: Colors.black,
                        child:
                            '维修完成'.text.size(32.sp).color(Colors.white).make()),
                    AkuMaterialButton(
                        color: kPrimaryColor,
                        minWidth: 463.w,
                        onPressed: () async {
                          await Get.to(() =>
                              EngineerRepairReportPage(repairId: _model!.id));
                        },
                        child:
                            '汇报进度'.text.size(32.sp).color(Colors.black).make()),
                  ],
                )
              : SizedBox();
        case 5:
          return UserTool.userProvider.infoModel!.engineeringRepairAuthority ==
                  ERAUTH.SENDTOCOMPANY
              ? AkuMaterialButton(
                  color: kPrimaryColor,
                  onPressed: () async {
                    EngineerRepairResultModel? resultModel =
                        await EngineerRepairFunc.getRepairResult(
                            widget.repairEngineerId);
                    if (resultModel != null) {
                      await Get.to(() => EngineerRepairAcceptancePage(
                            resultModel: resultModel,
                            repairId: _model!.id,
                            status: _model!.status,
                          ));
                    }
                  },
                  child:
                      '验收审核'.text.size(32.sp).bold.color(Colors.black).make())
              : SizedBox();
        case 6:
          return UserTool.userProvider.infoModel!.engineeringRepairAuthority ==
                  ERAUTH.PICK
              ? AkuMaterialButton(
                  color: kPrimaryColor,
                  onPressed: () async {
                    EngineerRepairNewAcceptanceRecordModel?
                        acceptanceRecordModel =
                        await EngineerRepairFunc.getAcceptanceRecord(
                            widget.repairEngineerId);
                    if (acceptanceRecordModel != null) {
                      await Get.to(() => EngineerRepairAcceptanceResultPage(
                            recordModel: acceptanceRecordModel,
                          ));
                    }
                  },
                  child:
                      '验收结果'.text.size(32.sp).bold.color(Colors.black).make())
              : SizedBox();
        default:
          return SizedBox();
      }
    } else {
      return SizedBox();
    }
  }

  Widget _buildReport() {
    return AkuTitleBox(
      title: '工作日志',
      children: [
        40.w.heightBox,
        ..._reportModels
            .mapIndexed(
                (currentValue, index) => _buildReportTile(currentValue, index))
            .toList()
      ],
    ).pOnly(bottom: 16.w);
  }

  Widget _buildReportTile(EngineerRepairWorkReportModel model, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.all(8.w),
              width: 24.w,
              height: 24.w,
              decoration: BoxDecoration(
                  color: index == 0 ? Color(0xFFFFC40C) : Color(0xFFD8D8D8),
                  borderRadius: BorderRadius.circular(12.w)),
            ),
            18.w.widthBox,
            model.createDate.text.size(28.sp).color(kTextSubColor).make(),
          ],
        ),
        16.w.heightBox,
        '${model.content}'
            .text
            .size(28.sp)
            .color(kTextSubColor)
            .make()
            .pOnly(left: 58.w),
        18.w.heightBox,
        if (model.workReportImgLists != null)
          BeeGridImageView(
              urls: model.workReportImgLists!.map((e) => e.url ?? '').toList())
      ],
    );
  }

  Widget _buildProcess() {
    return AkuTitleBox(
      title: '报修进程',
      children: _processModels.map((e) {
        return _buildProcessTile(
          ERMap.operationType(e.operationType),
          e.operationDate,
        );
      }).toList(),
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

  _buildOperator() {
    return AkuTitleBox(
      title: '维修人员',
      children: [
        16.w.heightBox,
        _buildTile(R.ASSETS_MESSAGE_IC_PEOPLE_PNG, '所属部门',
            _model!.maintenanceStaffOrganizationName!),
        16.w.heightBox,
        _buildTile(R.ASSETS_MESSAGE_IC_PEOPLE_PNG, '主要负责人',
            _model!.maintenanceStaffName!),
        16.w.heightBox,
        _buildTile(
            R.ASSETS_MESSAGE_IC_PHONE_PNG, '联系电话', _model!.maintenanceStaffTel!)
      ],
    );
  }

  _buildOrganization() {
    return AkuTitleBox(
      title: '负责单位',
      children: [
        16.w.heightBox,
        _buildTile(
            R.ASSETS_MESSAGE_IC_PEOPLE_PNG, '维修单位', _model!.organizationName!),
        16.w.heightBox,
        _buildTile(R.ASSETS_MESSAGE_IC_PEOPLE_PNG, '主要负责人',
            _model!.organizationLeadingName ?? ''),
        16.w.heightBox,
        _buildTile(R.ASSETS_MESSAGE_IC_PHONE_PNG, '联系电话',
            _model!.organizationLeadingTel ?? '')
      ],
    );
  }

  _buildInfo() {
    return AkuTitleBox(
      title: '报修信息',
      suffix: fixTypeWidget(),
      children: [
        AkuBox.h(16),
        _buildTile(
          R.ASSETS_MESSAGE_IC_PEOPLE_PNG,
          '报修人',
          _model!.createName,
        ),
        _buildTile(
          R.ASSETS_MESSAGE_IC_PHONE_PNG,
          '联系电话',
          _model!.createTel,
        ),
        _buildTile(R.ASSETS_MESSAGE_IC_AREA_PNG, '报修区域',
            '${S.of(context)!.tempPlotName} ${_model!.repairArea}'),
        AkuBox.h(8),
        Text(
          _model!.reportDetail,
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
          children: _model!.imgUrls.map((e) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(4.w),
              child: FadeInImage.assetNetwork(
                  placeholder: R.ASSETS_PLACEHOLDER_WEBP,
                  image: API.image(e.url!)),
            );
          }).toList(),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }

  Widget fixTypeWidget() {
    return Text(
      ERMap.statusString(_model!.status),
      style: TextStyle(color: Color(0xFFFF4501)),
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
}
