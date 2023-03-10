// Flutter imports:
import 'package:aku_new_community_manager/ui/manage_pages/facilities/facilities_view.dart';
// Project imports:
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/aku_tab_bar.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FacilitiesPage extends StatefulWidget {
  final int facilitiesType;

  FacilitiesPage({Key? key, required this.facilitiesType}) : super(key: key);

  @override
  _FacilitiesPageState createState() => _FacilitiesPageState();
}

class _FacilitiesPageState extends State<FacilitiesPage>
    with TickerProviderStateMixin {
  List<String> get _tabs {
    return ['待检查', '已完成', '未完成'];
  }

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: widget.facilitiesType == 1 ? '设施检查' : '设备检查',
      appBarBottom: PreferredSize(
        child: AkuTabBar(controller: _tabController!, tabs: _tabs),
        preferredSize: Size.fromHeight(88.w),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(
            _tabs.length,
            (index) => FacilitiesView(
                  facilitiesType: widget.facilitiesType,
                  index: index,
                )),
      ),
    );
  }
}
