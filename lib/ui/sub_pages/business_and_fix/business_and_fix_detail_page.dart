// Flutter imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/bussiness_and_fix/bussiness_and_fix_model.dart';
import 'package:aku_community_manager/models/manager/bussiness_and_fix/dispatch_detail_model.dart';
import 'package:aku_community_manager/models/manager/bussiness_and_fix/dispatch_report_model.dart';
import 'package:aku_community_manager/models/manager/bussiness_and_fix/fixed_detail_model.dart';
import 'package:aku_community_manager/models/manager/bussiness_and_fix/work_order_type_model.dart';
import 'package:aku_community_manager/models/manager/bussiness_and_fix/work_time_limit_model.dart';
import 'package:aku_community_manager/tools/aku_map.dart';
import 'package:aku_community_manager/ui/sub_pages/business_and_fix/fix_more_time_page.dart';
import 'package:aku_community_manager/ui/sub_pages/business_and_fix/fix_work_finish_page.dart';
import 'package:aku_community_manager/ui/sub_pages/business_and_fix/fixer_department_page.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/manage_func.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/mock_models/users/user_info_model.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_title_box.dart';
import 'package:aku_community_manager/ui/widgets/inner/show_bottom_sheet.dart';

class BusinessAndFixDetailPage extends StatefulWidget {
  final BussinessAndFixModel model;
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

  bool get isHandOut => widget.model.status == 1;
  FixedDetailModel _detailModel;
  bool _onload = true;
  EasyRefreshController _easyRefreshController;

  List<DispatchDetialModel> _dispatchModels;
  List<WorkTimeLimitModel> _timeLimitModels;
  List<WorkOrderTypeModel> _workTypeModels;
  DispatchReportModel _reportModel = DispatchReportModel.zero();

  @override
  void initState() {
    super.initState();
    _easyRefreshController = EasyRefreshController();
  }

  @override
  void dispose() {
    _easyRefreshController?.dispose();
    super.dispose();
  }

  Widget fixTypeWidget() {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    return Text(
      AkuMap.fixStatus(userProvider.infoModel.canOperation,
          userProvider.infoModel.canPickUpTicket, widget.model.status),
      style: TextStyle(
        color: widget.model.status < 4
            ? Color(0XFFFF4501)
            : AppStyle.minorTextColor,
      ),
    );
  }

  Widget _empty() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '报修详情',
      body: EasyRefresh(
        firstRefresh: true,
        controller: _easyRefreshController,
        header: MaterialHeader(),
        onRefresh: () async {
          _detailModel = await ManageFunc.repairDetail(widget.model.id);
          _reportModel.dispatchListId = widget.model.id;
          _reportModel.workOrderTyoe = 1;
          _onload = false;
          setState(() {});
        },
        child: _onload
            ? _empty()
            : ListView(
                padding: EdgeInsets.symmetric(vertical: 16.w),
                children: [
                  _buildInfo(),
                  _buildType(widget.model.status == 1),
                  _buildProcess(),
                  _detailModel.handlingSituation == null
                      ? SizedBox()
                      : _buildResult(),
                  _detailModel.evaluateInfo == null
                      ? SizedBox()
                      : _buildRating(),
                ],
              ),
      ),
      bottom: Builder(
        builder: (context) {
          final userProvider =
              Provider.of<UserProvider>(context, listen: false);
          if (userProvider.infoModel.canOperation && widget.model.status < 2) {
            return AkuMaterialButton(
              color: AppStyle.primaryColor,
              nullColor: AppStyle.minorColor,
              onPressed: _reportModel.type != null &&
                      _reportModel.workOrderTyoe != null &&
                      _reportModel.workOrderTimeLimit != null
                  ? () {
                      Get.to(FixerDepartmentPage(model: _reportModel,dispatchId: _detailModel.repairDetail.dispatchId,));
                    }
                  : null,
              child: Text(
                '立即派单',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else if (widget.model.status == 2) {
            if (userProvider.infoModel.canOperation) {
              return AkuMaterialButton(
                color: AppStyle.primaryColor,
                nullColor: AppStyle.minorColor,
                onPressed: () {
                  Get.to(FixerDepartmentPage(
                    model: _reportModel,
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
                onPressed: () async {
                  BaseModel baseModel =
                      await ManageFunc.recevingOrders(widget.model.dispatchId);
                  if (baseModel.status) {
                    Get.back();
                  } else {
                    BotToast.showText(text: baseModel.message);
                  }
                },
                child: Text(
                  '立即接单',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
          } else if ((widget.model.status == 3) &&
              userProvider.infoModel.canPickUpTicket)
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
                    onPressed: () {
                      Get.to(
                          FixMoreTimePage(dispatchId: widget.model.dispatchId));
                    },
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
                    onPressed: () {
                      Get.to(FixWorkFinishPage(
                          fixModel: widget.model,
                          model: _detailModel,
                          dispatchType:
                              _detailModel.dispatchType.dispatchType == 1));
                    },
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
    return AkuTitleBox(
      title: '报修信息',
      suffix: fixTypeWidget(),
      children: [
        AkuBox.h(16),
        _buildTile(
          R.ASSETS_MESSAGE_IC_PEOPLE_PNG,
          '报修人',
          _detailModel.repairDetail.name,
        ),
        _buildTile(
          R.ASSETS_MESSAGE_IC_PHONE_PNG,
          '联系电话',
          _detailModel.repairDetail.tel,
        ),
        _buildTile(
          R.ASSETS_MESSAGE_IC_AREA_PNG,
          '报修区域',
          AkuMap.fixAreaType[_detailModel.repairDetail.type],
        ),
        AkuBox.h(8),
        Text(
          widget.model.reportDetail,
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
          children: _detailModel.repairDetail.imgUrls.map((e) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(4.w),
              child: FadeInImage.assetNetwork(
                  placeholder: R.ASSETS_PLACEHOLDER_WEBP,
                  image: API.image(e.url)),
            );
          }).toList(),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }

  _buildType(bool canTap) {
    return AkuTitleBox(
      title: '工单类型',
      children: [
        _buildTypeTile(
          '派单类型',
          canTap
              ? _dispatchModels == null
                  ? null
                  : _dispatchModels[_dispatchModels.indexWhere(
                          (element) => element.showValue == _reportModel.type)]
                      .showName
              : AkuMap.dispatchType[_detailModel.dispatchType.dispatchType],
          canTap,
          helpContent: '请选择服务类型',
          onTap: () async {
            List models = await ManageFunc.dispatchListDetailType();
            _dispatchModels =
                models.map((e) => DispatchDetialModel.fromJson(e)).toList();
            showItemSheet(
              title: '派单类型',
              items: _dispatchModels.map((e) => e.showName).toList(),
              ids: _dispatchModels.map((e) => e.showValue).toList(),
              selectItem: _reportModel.type,
              onTap: (result) {
                _reportModel.type = result;
              },
            ).then((_) {
              if (_reportModel.type == -1) {
                _dispatchModels = null;
              }
              setState(() {});
            });
          },
        ),
        _buildTypeTile(
          '工单时限',
          canTap
              ? _timeLimitModels == null
                  ? null
                  : _timeLimitModels[_timeLimitModels.indexWhere((element) =>
                          element.id == _reportModel.workOrderTimeLimit)]
                      ?.name
              : _detailModel.dispatchType.workOrderLimitName,
          canTap,
          helpContent: '请选择工单时限',
          onTap: () async {
            List models = await ManageFunc.workOrderTimeType();
            _timeLimitModels =
                models.map((e) => WorkTimeLimitModel.fromJson(e)).toList();
            showItemSheet(
              title: '工单时限',
              items: _timeLimitModels.map((e) => e.name).toList(),
              ids: _timeLimitModels.map((e) => e.id).toList(),
              selectItem: _reportModel.workOrderTimeLimit,
              onTap: (result) {
                _reportModel.workOrderTimeLimit = result;
              },
            ).then((_) {
              if (_reportModel.workOrderTimeLimit == -1) {
                _timeLimitModels = null;
              }
              setState(() {});
            });
          },
        ),
        _buildTypeTile(
          '工单子类',
          canTap
              ? _workTypeModels == null
                  ? null
                  : _workTypeModels[_workTypeModels.indexWhere((element) =>
                          element.id == _reportModel.workOrderTypeDetail)]
                      .name
              : _detailModel.dispatchType.workOrderSubclassName,
          canTap,
          helpContent: '请选择工单子类',
          onTap: () async {
            List models = await ManageFunc.workOrderTypeDetail(1);
            _workTypeModels =
                models.map((e) => WorkOrderTypeModel.fromJson(e)).toList();
            showItemSheet(
              title: '工单子类',
              items: _workTypeModels.map((e) => e.name).toList(),
              ids: _workTypeModels.map((e) => e.id).toList(),
              selectItem: _reportModel.workOrderTypeDetail,
              onTap: (result) {
                _reportModel.workOrderTypeDetail = result;
              },
            ).then((_) {
              if (_reportModel.workOrderTypeDetail == -1) {
                _workTypeModels = null;
              }
              setState(() {});
            });
          },
        ),
      ],
    );
  }

  _buildProcess() {
    return AkuTitleBox(
      title: '报修进程',
      children: _detailModel.processRecord.map((e) {
        return _buildProcessTile(
          AkuMap.operationType[e.operationType],
          DateUtil.formatDateStr(e.operationDate,
              format: 'yyyy-MM-dd HH:mm:ss'),
        );
      }).toList(),
    );
  }

  _buildResult() {
    return AkuTitleBox(
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
          _detailModel.handlingSituation.detail,
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
          _detailModel.handlingSituation.materialList,
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
          children: _detailModel.handlingSituation.imgUrls.map((e) {
            return ClipRRect(
                borderRadius: BorderRadius.circular(4.w),
                child: FadeInImage.assetNetwork(
                    placeholder: R.ASSETS_PLACEHOLDER_WEBP,
                    image: API.image(e.url)));
          }).toList(),
        ),
      ],
    );
  }

  _buildRating() {
    return AkuTitleBox(
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
            _buildStar(5),
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
          _detailModel.evaluateInfo,
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
}
