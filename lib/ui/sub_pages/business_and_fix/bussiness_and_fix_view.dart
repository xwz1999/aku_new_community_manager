// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

// Project imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/bussiness_and_fix/bussiness_and_fix_model.dart';
import 'package:aku_community_manager/ui/sub_pages/business_and_fix/business_fix_card.dart';
import 'package:aku_community_manager/ui/widgets/common/bee_list_view.dart';

class BussinessAndFixView extends StatefulWidget {
  final int? status;
  BussinessAndFixView({Key? key,  this.status}) : super(key: key);

  @override
  _BussinessAndFixViewState createState() => _BussinessAndFixViewState();
}

class _BussinessAndFixViewState extends State<BussinessAndFixView>
    with AutomaticKeepAliveClientMixin {
  EasyRefreshController? _easyRefreshController;
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BeeListView(
        path: API.manage.repairList,
        extraParams: {
          'repairStatus': widget.status,
        },
        controller: _easyRefreshController,
        convert: (models) {
          return models.tableList!
              .map((e) => BussinessAndFixModel.fromJson(e))
              .toList();
        },
        builder: (items) {
          return ListView.separated(
              itemBuilder: (context, index) {
                return BusinessFixCard(
                    model: items[index],
                    callRefresh: () {
                      _easyRefreshController!.callRefresh();
                    });
              },
              separatorBuilder: (_, __) {
                return 16.w.heightBox;
              },
              itemCount: items.length);
        });
  }

  @override
  bool get wantKeepAlive => true;
}
