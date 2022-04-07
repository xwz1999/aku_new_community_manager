import 'package:aku_new_community_manager/const/saas_api.dart';
import 'package:aku_new_community_manager/gen/assets.gen.dart';
import 'package:aku_new_community_manager/saas_models/household_audit/household_audit_list_model.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/common/bee_divider.dart';
import 'package:aku_new_community_manager/ui/widgets/common/car_bottom_button.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/aku_tab_bar.dart';
import 'package:aku_new_community_manager/utils/extension/list_extension.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/src/extensions/iterable_ext.dart';
import 'package:velocity_x/src/extensions/num_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';

class HouseholdAuditPage extends StatefulWidget {
  const HouseholdAuditPage({Key? key}) : super(key: key);

  @override
  _HouseholdAuditPageState createState() => _HouseholdAuditPageState();
}

class _HouseholdAuditPageState extends State<HouseholdAuditPage>
    with SingleTickerProviderStateMixin {
  List<String> _tabs = ['全部', '待审核', '已驳回', '已同意'];
  List<EasyRefreshController> _refreshControllers = [];
  late TabController _tabController;
  List<HouseholdAuditListModel> _models = [];
  int _page = 1;
  int _size = 10;

  @override
  void initState() {
    _refreshControllers = List.filled(_tabs.length, EasyRefreshController());
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _refreshControllers.forEach((element) {
      element.dispose();
    });
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '住户审核',
      appBarBottom: PreferredSize(
          preferredSize: Size.fromHeight(107.w),
          child: AkuTabBar(
            controller: _tabController,
            tabs: _tabs,
          )),
      body: TabBarView(
          controller: _tabController,
          children: List.generate(_tabs.length, (index) => _getView(index))),
    );
  }

  Widget _getView(int index) {
    return EasyRefresh(
        controller: _refreshControllers[index],
        firstRefresh: true,
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh: () async {
          _models = [];
          _page = 1;
          var base = await NetUtil().getList(SAASAPI.householdAudit.list,params: {
            'pageNum': _page,
            'size': _size,
            'status':index==0?null:index
          });
          _models = base.rows
              .map((e) => HouseholdAuditListModel.fromJson(e))
              .toList();
          setState(() {});
        },
        onLoad: () async {
          _page++;
          var base = await NetUtil().getList(SAASAPI.householdAudit.list,params: {
            'pageNum': _page,
            'size': _size,
            'status':index==0?null:index
          });
          if (_models.length < base.total) {
            _models.addAll(base.rows
                .map((e) => HouseholdAuditListModel.fromJson(e))
                .toList());
            setState(() {});
          } else {
            _refreshControllers[index].finishLoad();
          }
        },
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.w),
          children: _models
              .mapIndexed((currentValue, index) => _card(currentValue, index))
              .toList()
              .sepWidget(separate: 24.w.heightBox),
        ));
  }

  Widget _card(HouseholdAuditListModel model, int index) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.w), color: Colors.white),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
                height: 77.w,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        //     stops: [
                        //   0.4,
                        //   0.6,
                        //   0.8
                        // ],
                        colors: [
                      Color(0xFFFFEAC3).withOpacity(0.31),
                      Color(0xFFFEE1AE).withOpacity(0.24),
                      Color(0xFFFFFFFF),
                    ])),
                child: Row(
                  children: [
                    '2栋1单元502室'
                        .text
                        .size(32.sp)
                        .color(Colors.black.withOpacity(0.85))
                        .make(),
                    Spacer(),
                    '类型:${model.estateTypeName}'
                        .text
                        .size(24.sp)
                        .color(Colors.black.withOpacity(0.45))
                        .make(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                            width: 160.w,
                            child: '申请人'
                                .text
                                .size(28.sp)
                                .color(Colors.black.withOpacity(0.45))
                                .make()),
                        model.name.text
                            .size(28.sp)
                            .color(Colors.black.withOpacity(0.85))
                            .make(),
                      ],
                    ),
                    24.w.heightBox,
                    Row(
                      children: [
                        SizedBox(
                            width: 160.w,
                            child: '申请身份'
                                .text
                                .size(28.sp)
                                .color(Colors.black.withOpacity(0.45))
                                .make()),
                        _identity[model.identity]!
                            .text
                            .size(28.sp)
                            .color(Colors.black.withOpacity(0.85))
                            .make(),
                      ],
                    ),
                    24.w.heightBox,
                    Row(
                      children: [
                        SizedBox(
                            width: 160.w,
                            child: '申请身份'
                                .text
                                .size(28.sp)
                                .color(Colors.black.withOpacity(0.45))
                                .make()),
                        _identity[model.identity]!
                            .text
                            .size(28.sp)
                            .color(Colors.black.withOpacity(0.85))
                            .make(),
                      ],
                    )
                  ],
                ),
              ),
              Offstage(
                offstage: model.status != 1,
                child: Column(
                  children: [
                    BeeDivider.horizontal(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 32.w, vertical: 24.w),
                      child: Row(
                        children: [
                          Spacer(),
                          CardBottomButton.yellow(
                              text: '通过',
                              onPressed: () async {
                                var base = await NetUtil().post(
                                    SAASAPI.householdAudit.review,
                                    params: {
                                      'operate': 1,
                                      'estateReviewId': model.estateReviewId
                                    });
                                if (base.success) {
                                  _refreshControllers[index].callRefresh();
                                }
                              }),
                          24.w.widthBox,
                          CardBottomButton.white(
                              text: '驳回',
                              onPressed: () async {
                                var base = await NetUtil().post(
                                    SAASAPI.householdAudit.review,
                                    params: {
                                      'operate': 2,
                                      'estateReviewId': model.estateReviewId
                                    });
                                if (base.success) {
                                  _refreshControllers[index].callRefresh();
                                }
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          right: 24.w,
          bottom: 24.w,
          child: Offstage(
            offstage: model.status == 1,
            child: Image.asset(
              model.status == 2
                  ? Assets.manage.rejected.path
                  : Assets.manage.passed.path,
              width: 160.w,
              height: 160.w,
            ),
          ),
        )
      ],
    );
  }

  Map<int, String> _identity = {1: '业主', 2: '业主亲属', 3: '租户', 4: '租户亲属'};
}
