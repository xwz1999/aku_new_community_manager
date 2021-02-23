// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:aku_ui/common_widgets/aku_cupertino_button.dart';
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/permission_tool.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/tool_pages/warning/warning_detail_page.dart';
import 'package:aku_community_manager/ui/tool_pages/warning/warning_sub_page.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

class WarningPage extends StatefulWidget {
  WarningPage({Key key}) : super(key: key);

  @override
  _WarningPageState createState() => _WarningPageState();
}

class _WarningPageState extends State<WarningPage> {
  AmapController _amapController;
  Location _location;

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '一键报警',
      actions: [
        AkuMaterialButton(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          onPressed: () {
            Get.to(WarningDetailPage());
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
          AmapView(
            zoomLevel: 15,
            showZoomControl: false,
            showCompass: false,
            showScaleControl: false,
            onMapCreated: (controller) async {
              _amapController = controller;
              _amapController.showMyLocation(MyLocationOption());
              _getLocation();
            },
          ),

          ///首部地址栏
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.all(32.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.w),
                color: Color(0xE8FFFFFF),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4.w),
                    blurRadius: 6.w,
                    spreadRadius: 4.w,
                    color: Color(0x1A5C5959),
                  ),
                ],
              ),
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
                          _location?.address ?? '加载中',
                          overflow: TextOverflow.ellipsis,
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
                  onPressed: () {
                    Get.to(WarningSubPage());
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
                _getLocation();
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

  _getLocation() {
    _location = null;
    setState(() {});
    PermissionTool.getLocationPermission().then((state) {
      if (state) {
        AmapLocation.instance.fetchLocation().then((location) {
          _amapController.setCenterCoordinate(location.latLng);
          _location = location;
          setState(() {});
        });
      }
    });
  }
}
