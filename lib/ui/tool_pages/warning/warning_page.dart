// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_cupertino_button.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:amap_flutter_base/amap_flutter_base.dart';
import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:aku_community_manager/provider/app_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/tool_pages/warning/warning_detail_page.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

class PermissonUtil {
  static Future getLocationPermisson() async {
    return await Permission.locationWhenInUse.request().isGranted;
  }
}

class WarningPage extends StatefulWidget {
  WarningPage({Key? key}) : super(key: key);

  @override
  _WarningPageState createState() => _WarningPageState();
}

class _WarningPageState extends State<WarningPage> {
  AMapController? _mapController;
  @override
  void initState() {
    super.initState();
    PermissonUtil.getLocationPermisson();
  }

  @override
  void dispose() {
    _mapController?.disponse();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    return AkuScaffold(
      title: '一键报警',
      actions: [
        AkuMaterialButton(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          onPressed: () {
            Get.to(() => WarningDetailPage());
          },
          child: Text(
            '功能说明',
            style: TextStyle(
              color: AppStyle.primaryTextColor,
              fontSize: 28.sp,
            ),
          ),
        ),
      ],
      body: Stack(
        children: [
          AMapWidget(
            onMapCreated: (controller) {
              LatLng _target = LatLng(
                appProvider.location!['latitude'] as double,
                appProvider.location!['longitude'] as double,
              );

              _mapController = controller;
              _mapController!.moveCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(target: _target, zoom: 18),
                ),
              );
            },
            myLocationStyleOptions: MyLocationStyleOptions(true,
                circleFillColor:
                    Theme.of(context).primaryColor.withOpacity(0.2),
                circleStrokeColor: Theme.of(context).primaryColor),
          ),

          ///首部地址栏
          Positioned(
            top: 32.w,
            left: 32.w,
            right: 32.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.w),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Color(0xAAFFFFFF),
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.w,
                    vertical: 24.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '当前位置(仅供参考)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppStyle.primaryTextColor,
                          fontSize: 28.sp,
                        ),
                      ),
                      AkuBox.h(20),
                      Row(
                        children: [
                          Image.asset(
                            R.ASSETS_MANAGE_LOCATION_PNG,
                            height: 29.w,
                            width: 21.w,
                          ),
                          AkuBox.w(10),
                          Expanded(
                            child: Text(
                              (appProvider.location == null)
                                  ? '加载中……'
                                  : appProvider.location!['address'] as String,
                              style: TextStyle(
                                color: AppStyle.minorTextColor,
                                fontSize: 28.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          ///底部
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 271.w,
            child: Container(
              color: Colors.white.withOpacity(0.9),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '谎报警情，依法追责',
                    style: TextStyle(
                      color: Color(0xFFE02020),
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  AkuBox.h(8),
                  Text(
                    '谎报警情将可能被处以五日以上十日以下拘留',
                    style: TextStyle(
                      color: AppStyle.minorTextColor,
                      fontSize: 24.sp,
                    ),
                  ),
                  AkuBox.h(40),
                ],
              ),
            ),
          ),

          ///底部按钮
          Positioned(
            bottom: 173.w,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 196.w,
                width: 196.w,
                alignment: Alignment.center,
                child: AkuCupertinoButton(
                  minWidth: 0,
                  onPressed: () async {
                     await NetUtil()
                        .post(API.manage.insertAlarmRecord, showMessage: true);

                    launch('tel:110');
                    // Get.to(()=>WarningSubPage());
                  },
                  child: Container(
                    height: 172.w,
                    width: 172.w,
                    alignment: Alignment.center,
                    child: Image.asset(
                      R.ASSETS_MANAGE_POLICE_PNG,
                      height: 86.w,
                      width: 86.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular((172 / 2).w),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFF8880),
                          Color(0xFFEF0909),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x54FD7770),
                          offset: Offset(0, 10.w),
                          blurRadius: 20.w,
                          spreadRadius: 4.w,
                        ),
                      ],
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular((196 / 2).w),
                ),
              ),
            ),
          ),

          ///定位按钮
          Positioned(
            bottom: 300.w,
            right: 34.w,
            child: AkuCupertinoButton(
              minWidth: 0,
              onPressed: () {
                LatLng _target = LatLng(
                  appProvider.location!['latitude'] as double,
                  appProvider.location!['longitude'] as double,
                );
                _mapController!.moveCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(target: _target, zoom: 18),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  R.ASSETS_MANAGE_DINGWEI_PNG,
                  height: 40.w,
                  width: 40.w,
                ),
                height: 66.w,
                width: 66.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(3.w, 4.w),
                      blurRadius: 6.w,
                      spreadRadius: 1.w,
                      color: Color(0x1F000000),
                    )
                  ],
                  borderRadius: BorderRadius.circular(33.w),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // _getLocation() {
  //   _location = null;
  //   setState(() {});
  //   PermissionTool.getLocationPermission().then((state) {
  //     if (state) {
  //       AmapLocation.instance.fetchLocation().then((location) {
  //         _amapController.setCenterCoordinate(location.latLng);
  //         _location = location;
  //         setState(() {});
  //       });
  //     }
  //   });
  // }
}
