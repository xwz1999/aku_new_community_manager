// Flutter imports:
// Project imports:
import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/const/resource.dart';
import 'package:aku_new_community_manager/models/manager/goods_out/goods_out_detail_model.dart';
import 'package:aku_new_community_manager/provider/user_provider.dart';
import 'package:aku_new_community_manager/saas_models/net_model/base_model.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/tools/extensions/list_extension_tool.dart';
import 'package:aku_new_community_manager/tools/user_tool.dart';
import 'package:aku_new_community_manager/tools/widget_tool.dart';
import 'package:aku_new_community_manager/ui/sub_pages/items_outdoor/outdoor_notpass_page.dart';
import 'package:aku_new_community_manager/ui/sub_pages/items_outdoor/outdoor_pass_page.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_button.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
// Package imports:
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemsOutdoorDetailsPage extends StatefulWidget {
  final int id;

  ItemsOutdoorDetailsPage({Key? key, /*required*/ required this.id})
      : super(key: key);

  @override
  _ItemsOutdoorDetailsPageState createState() =>
      _ItemsOutdoorDetailsPageState();
}

class _ItemsOutdoorDetailsPageState extends State<ItemsOutdoorDetailsPage> {
  GoodsOutDetailModel? _model;

  _buildTile(String path, String title, String? subTitle) {
    return Row(
      children: [
        Image.asset(
          path,
          width: 40.w,
          height: 40.w,
        ),
        AkuBox.w(4),
        Text(
          title,
          style: TextStyle(color: AppStyle.minorTextColor, fontSize: 28.sp),
        ),
        Spacer(),
        Text(
          subTitle ?? '',
          style: AppStyle().primaryStyle,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '????????????',
      body: EasyRefresh(
        firstRefresh: true,
        onRefresh: () async {
          BaseModel model = await NetUtil().get(
            API.manage.goodsOutDetail,
            params: {'articleOutId': widget.id},
          );
          _model = GoodsOutDetailModel.fromJson(model.data);
          setState(() {});
        },
        header: MaterialHeader(),
        child: _model == null
            ? SizedBox()
            : ListView(
                padding: EdgeInsets.symmetric(vertical: 16.w),
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.w),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '????????????',
                              style: AppStyle().barTitleStyle,
                            ),
                            Spacer(),
                            Text(
                              _model!.statusValue,
                              style: TextStyle(
                                color: _model!.statusColor,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        AkuBox.h(16),
                        ...<Widget>[
                          _buildTile(R.ASSETS_OUTDOOR_IC_HOME_PNG, '????????????',
                              '${UserTool.userProvider.userInfoModel!.communityName}'),
                          _buildTile(
                            R.ASSETS_OUTDOOR_IC_ADDRESS_PNG,
                            '????????????',
                            _model!.roomName,
                          ),
                          _buildTile(R.ASSETS_OUTDOOR_IC_HOME_PNG, '?????????',
                              _model!.applicantName),
                          _buildTile(R.ASSETS_OUTDOOR_IC_HOME_PNG, '??????',
                              _model!.identityValue),
                          _buildTile(R.ASSETS_OUTDOOR_IC_HOME_PNG, '????????????',
                              _model!.applicantTel),
                          _buildTile(
                            R.ASSETS_OUTDOOR_IC_HOME_PNG,
                            '????????????',
                            DateUtil.formatDate(
                              _model!.expected,
                              format: 'yyyy-MM-dd HH:mm',
                            ),
                          ),
                        ].sepWidget(separate: AkuBox.h(12)),
                      ],
                    ),
                  ),
                  Divider(height: 1.w),
                  MaterialButton(
                    onPressed: () async {
                      launch('tel:${_model!.applicantTel}');
                    },
                    elevation: 0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          R.ASSETS_OUTDOOR_IC_PHONEBLUE_PNG,
                          width: 30.w,
                          height: 30.w,
                        ),
                        AkuBox.w(16),
                        Text(
                          '????????????',
                          style: TextStyle(
                            color: Color(0xFF3F8FFE),
                            fontSize: 28.sp,
                          ),
                        ),
                      ],
                    ),
                    color: Colors.white,
                    height: 96.w,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  Container(
                    color: Color(0xFFFFFFFF),
                    margin: EdgeInsets.only(top: 16.w),
                    padding: EdgeInsets.only(
                        top: 24.w, left: 32.w, right: 32.w, bottom: 40.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '????????????',
                          style: AppStyle().barTitleStyle,
                        ),
                        AkuBox.h(16),
                        Row(
                          children: [
                            Image.asset(
                              R.ASSETS_OUTDOOR_IC_CHUHU_PNG,
                              width: 40.w,
                              height: 40.w,
                            ),
                            AkuBox.w(4),
                            Text(
                              '????????????',
                              style: AppStyle().secondaryTextStyle,
                            ),
                            Spacer(),
                            Text(
                              _model!.articleOutName ?? '',
                              style: AppStyle().primaryStyle,
                            ),
                          ],
                        ),
                        AkuBox.h(16),
                        Row(
                          children: [
                            Image.asset(
                              R.ASSETS_OUTDOOR_IC_WEIGHT_PNG,
                              width: 40.w,
                              height: 40.w,
                            ),
                            AkuBox.w(4),
                            Text(
                              '????????????',
                              style: AppStyle().secondaryTextStyle,
                            ),
                            Spacer(),
                            Text(
                              _model!.weightValue,
                              style: AppStyle().primaryStyle,
                            ),
                          ],
                        ),
                        AkuBox.h(16),
                        Row(
                          children: [
                            Image.asset(
                              R.ASSETS_OUTDOOR_IC_TRANSPORT_PNG,
                              width: 40.w,
                              height: 40.w,
                            ),
                            AkuBox.w(4),
                            Text(
                              '????????????',
                              style: AppStyle().secondaryTextStyle,
                            ),
                            Spacer(),
                            Text(
                              _model!.approachValue,
                              style: AppStyle().primaryStyle,
                            )
                          ],
                        ),
                        AkuBox.h(16),
                        Row(
                          children: [
                            Image.asset(
                              R.ASSETS_OUTDOOR_IC_IMAGE_PNG,
                              width: 40.w,
                              height: 40.w,
                            ),
                            AkuBox.w(4),
                            Text(
                              '????????????',
                              style: AppStyle().secondaryTextStyle,
                            ),
                            Spacer(),
                          ],
                        ),
                        AkuBox.h(16),
                        Wrap(
                          spacing: 16.w,
                          children: _model!.imgUrls!
                              .map(
                                (e) => ClipRRect(
                                    borderRadius: BorderRadius.circular(4.w),
                                    child: FadeInImage.assetNetwork(
                                      placeholder: R.ASSETS_PLACEHOLDER_WEBP,
                                      image: API.image(e.url ?? ''),
                                      width: 218.w,
                                      height: 218.w,
                                    )),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
      bottom: _model == null ? SizedBox() : _bottomCard(),
    );
  }

  Widget _bottomCard() {
    final userProvider = Provider.of<UserProvider>(context);
    switch (_model!.status) {
      case 1:
        return userProvider.userInfoModel!.type == 1
            ? Container(
                height: 98.w,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFF9F9F9),
                      offset: Offset(0, -10.w),
                      blurRadius: 10.w,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                margin: EdgeInsets.only(top: 22.w),
                padding: EdgeInsets.only(
                    top: 13.w, bottom: 13.w, left: 32.w, right: 32.w),
                child: Row(
                  children: [
                    AkuButton(
                      onPressed: () {
                        Get.to(OutdoorNotpassPage(id: _model!.id!));
                      },
                      child: Container(
                        width: 304.w,
                        height: 72.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFFFFC40C), width: 2.w),
                          borderRadius: BorderRadius.circular(4.w),
                        ),
                        child: Text(
                          '?????????',
                          style: AppStyle().primaryStyle,
                        ),
                      ),
                    ),
                    Spacer(),
                    AkuMaterialButton(
                      onPressed: () {
                        Get.to(OutdoorPassPage(id: _model!.id!));
                      },
                      radius: 4.w,
                      color: Color(0xFFFFC40C),
                      child: Text(
                        '??????',
                        style: AppStyle().primaryStyle,
                      ),
                      minWidth: 304.w,
                      height: 72.w,
                    ),
                  ],
                ),
              )
            : SizedBox();

      case 2:
        return Container(
          height: 226.w,
          color: Color(0xFFFFFFFF),
          margin: EdgeInsets.only(top: 16.w),
          padding:
              EdgeInsets.only(top: 24.w, left: 32.w, right: 32.w, bottom: 40.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('????????????', style: AppStyle().barTitleStyle),
              Spacer(),
              Row(
                children: [
                  Image.asset(
                    R.ASSETS_OUTDOOR_IC_TIME_PNG,
                    width: 40.w,
                    height: 40.w,
                  ),
                  AkuBox.w(4),
                  Text(
                    '????????????',
                    style: AppStyle().secondaryTextStyle,
                  ),
                  Spacer(),
                  Text(
                    DateUtil.formatDate(
                      _model!.expected,
                      format: 'yyyy-MM-dd HH:mm',
                    ),
                    style: AppStyle().primaryStyle,
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Image.asset(
                    R.ASSETS_OUTDOOR_IC_CHUHU_PNG,
                    width: 40.w,
                    height: 40.w,
                  ),
                  AkuBox.w(4),
                  Text(
                    '????????????',
                    style: AppStyle().secondaryTextStyle,
                  ),
                  Spacer(),
                  Text(
                    _model!.exportValue,
                    style: AppStyle().primaryStyle,
                  ),
                ],
              ),
            ],
          ),
        );

      case 3:
        return Container(
          height: 226.w,
          color: Color(0xFFFFFFFF),
          margin: EdgeInsets.only(top: 16.w),
          padding:
              EdgeInsets.only(top: 24.w, left: 32.w, right: 32.w, bottom: 40.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('????????????', style: AppStyle().barTitleStyle),
              Spacer(),
              Row(
                children: [
                  Image.asset(
                    R.ASSETS_OUTDOOR_IC_TIME_PNG,
                    width: 40.w,
                    height: 40.w,
                  ),
                  AkuBox.w(4),
                  Text(
                    '????????????',
                    style: AppStyle().secondaryTextStyle,
                  ),
                  Spacer(),
                  Text(
                    DateUtil.formatDate(
                      _model!.expected,
                      format: 'yyyy-MM-dd HH:mm',
                    ),
                    style: AppStyle().primaryStyle,
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Image.asset(
                    R.ASSETS_OUTDOOR_IC_CHUHU_PNG,
                    width: 40.w,
                    height: 40.w,
                  ),
                  AkuBox.w(4),
                  Text(
                    '????????????',
                    style: AppStyle().secondaryTextStyle,
                  ),
                  Spacer(),
                  Text(
                    _model!.remarks!,
                    style: TextStyle(
                        color: Color(0xFFFF4501),
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        );

      default:
        return SizedBox();
    }
  }
}
