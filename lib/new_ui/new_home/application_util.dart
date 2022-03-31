import 'package:aku_new_community_manager/gen/assets.gen.dart';
import 'package:aku_new_community_manager/new_ui/work_order/distributor/work_order_distributor_page.dart';
import 'package:aku_new_community_manager/new_ui/work_order/receiver/work_order_receiver_page.dart';
import 'package:aku_new_community_manager/tools/user_tool.dart';
import 'package:aku_new_community_manager/ui/manage_pages/inspection_manage/inspection_manage_page.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

class ApplicationUtil {
  ApplicationUtil(this.titles);

  List<String> titles = [];

  List<AppElement> get elements {
    var list = <AppElement>[];
    this.titles.forEach((element) {
      var re = _findByTitle(element);
      if (re != null) {
        list.add(re);
      }
    });
    return list;
  }

  AppElement? _findByTitle(String title) {
    for (var item in allApplications) {
      if (title == item.title) {
        return item;
      }
    }
  }

  List<AppElement> get allApplications => [
        AppElement(
            title: '巡检管理',
            imgPath: Assets.home.icPatrol.path,
            onTap: () async {
              await Get.to(InspectionManagePage());
            }),
        AppElement(
            title: '工单管理',
            imgPath: Assets.home.icArticle.path,
            onTap: () async {
              if (UserTool.userProvider.userInfoModel!.workOrderJurisdiction ==
                  1) {
                Get.to(() => WorkOrderDistributorPage());
              } else {
                Get.to(() => WorkOrderReceiverPage());
              }
            }),
        AppElement(
            title: '住户审核',
            imgPath: Assets.home.icArticle.path,
            onTap: () async {})
      ];
}

class AppElement extends Equatable {
  final String title;
  final String imgPath;
  final VoidCallback onTap;

  const AppElement({
    required this.title,
    required this.imgPath,
    required this.onTap,
  });

  @override
  List<Object?> get props => [
        title,
        imgPath,
        onTap,
      ];
}
