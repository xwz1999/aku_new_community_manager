import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/tools/extensions/list_extension_tool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../const/saas_api.dart';
import '../../saas_models/household_audit/household_audit_list_model.dart';
import '../../utils/network/net_util.dart';
import 'household_audit_card.dart';

class HouseholdAudioReject extends StatefulWidget {
  final EasyRefreshController refreshController;
  const HouseholdAudioReject({Key? key, required this.refreshController}) : super(key: key);

  @override
  _HouseholdAudioRejectState createState() => _HouseholdAudioRejectState();
}

class _HouseholdAudioRejectState extends State<HouseholdAudioReject> {
  List<HouseholdAuditListModel> _models = [];
  int _page = 1;
  int _size = 10;

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
        controller: widget.refreshController,
        firstRefresh: true,
        header: MaterialHeader(),
        footer: MaterialFooter(),
        onRefresh: () async {
          _models = [];
          _page = 1;
          var base =
          await NetUtil().getList(SAASAPI.householdAudit.list, params: {
            'pageNum': _page,
            'size': _size,
            'status': 2
          });
          _models = base.rows
              .map((e) => HouseholdAuditListModel.fromJson(e))
              .toList();
          setState(() {});
        },
        onLoad: () async {
          _page++;
          var base =
          await NetUtil().getList(SAASAPI.householdAudit.list, params: {
            'pageNum': _page,
            'size': _size,
            'status': 2
          });
          if (_models.length < base.total) {
            _models.addAll(base.rows
                .map((e) => HouseholdAuditListModel.fromJson(e))
                .toList());
            setState(() {});
          } else {
            widget.refreshController.finishLoad();
          }
        },
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.w),
          children: _models
              .mapIndexed((currentValue, index) => HouseholdAuditCard(
            index: index,
            refresh: () => widget.refreshController.callRefresh(),
            model: currentValue,
          ))
              .toList()
              .sepWidget(separate: 24.w.heightBox),
        ));
  }
}
