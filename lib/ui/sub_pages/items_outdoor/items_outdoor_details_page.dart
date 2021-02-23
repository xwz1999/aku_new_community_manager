// Flutter imports:
import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/goods_out/goods_out_detail_model.dart';
import 'package:aku_community_manager/utils/network/base_model.dart';
import 'package:aku_community_manager/utils/network/net_util.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:aku_community_manager/tools/extensions/list_extension_tool.dart';

// Package imports:
import 'package:aku_ui/aku_ui.dart';
import 'package:aku_ui/common_widgets/aku_material_button.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/mock_models/outdoor_models/outdoor_model.dart';
import 'package:aku_community_manager/mock_models/users/user_info_model.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/sub_pages/items_outdoor/items_outdoor_card.dart';
import 'package:aku_community_manager/ui/sub_pages/items_outdoor/outdoor_notpass_page.dart';
import 'package:aku_community_manager/ui/sub_pages/items_outdoor/outdoor_pass_page.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

class ItemsOutdoorDetailsPage extends StatefulWidget {
  final int id;
  ItemsOutdoorDetailsPage({Key key, @required this.id}) : super(key: key);

  @override
  _ItemsOutdoorDetailsPageState createState() =>
      _ItemsOutdoorDetailsPageState();
}

class _ItemsOutdoorDetailsPageState extends State<ItemsOutdoorDetailsPage> {
  GoodsOutDetailModel _model;

  _buildTile(String path, String title, String subTitle) {
    return Row(
      children: [
        Image.asset(
          path,
          width: 40.w,
          height: 40.w,
        ),
        AkuBox.w(4),
        Text(
          title ?? '',
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
      title: '出户详情',
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
                              '出户信息',
                              style: AppStyle().barTitleStyle,
                            ),
                            Spacer(),
                            Text(
                              _model.statusValue,
                              style: TextStyle(
                                color: _model.statusColor,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        AkuBox.h(16),
                        ...<Widget>[
                          _buildTile(
                              R.ASSETS_OUTDOOR_IC_HOME_PNG, '小区名称', 'XXXX'),
                          _buildTile(
                            R.ASSETS_OUTDOOR_IC_ADDRESS_PNG,
                            '详细地址',
                            _model.roomName,
                          ),
                          _buildTile(R.ASSETS_OUTDOOR_IC_HOME_PNG, '出户人',
                              _model.applicantName),
                          _buildTile(R.ASSETS_OUTDOOR_IC_HOME_PNG, '身份',
                              _model.identityValue),
                          _buildTile(R.ASSETS_OUTDOOR_IC_HOME_PNG, '联系方式',
                              _model.applicantTel),
                          _buildTile(
                            R.ASSETS_OUTDOOR_IC_HOME_PNG,
                            '出户时间',
                            DateUtil.formatDate(
                              _model.expected,
                              format: 'yyyy-MM-dd HH:mm',
                            ),
                          ),
                        ].sepWidget(separate: AkuBox.h(12)),
                      ],
                    ),
                  ),
                  Divider(height: 1.w),
                  MaterialButton(
                    onPressed: () {},
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
                          '联系业主',
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
                          '物品信息',
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
                              '出户物品',
                              style: AppStyle().secondaryTextStyle,
                            ),
                            Spacer(),
                            Text(
                              _model.articleOutName ?? '',
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
                              '物品重量',
                              style: AppStyle().secondaryTextStyle,
                            ),
                            Spacer(),
                            Text(
                              _model.weightValue,
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
                              '搬运方式',
                              style: AppStyle().secondaryTextStyle,
                            ),
                            Spacer(),
                            Text(
                              _model.approachValue,
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
                              '图片信息',
                              style: AppStyle().secondaryTextStyle,
                            ),
                            Spacer(),
                          ],
                        ),
                        AkuBox.h(16),
                        Wrap(
                          spacing: 16.w,
                          children: _model.imgUrls
                              .map(
                                (e) => ClipRRect(
                                    borderRadius: BorderRadius.circular(4.w),
                                    child: FadeInImage.assetNetwork(
                                      placeholder: R.ASSETS_PLACEHOLDER_WEBP,
                                      image: API.image(e?.url ?? ''),
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
    switch (_model.status) {
      case 1:
        return userProvider.infoModel.canPass
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
                        //TODO not pass
                        // Get.to(OutdoorNotpassPage(
                        //   model: widget.cardMedel,
                        // ));
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
                          '不放行',
                          style: AppStyle().primaryStyle,
                        ),
                      ),
                    ),
                    Spacer(),
                    AkuMaterialButton(
                      onPressed: () {
                        //TODO pass
                        // Get.to(OutdoorPassPage(
                        //   model: widget.cardMedel,
                        // ));
                      },
                      radius: 4.w,
                      color: Color(0xFFFFC40C),
                      child: Text(
                        '放行',
                        style: AppStyle().primaryStyle,
                      ),
                      minWidth: 304.w,
                      height: 72.w,
                    ),
                  ],
                ),
              )
            : SizedBox();
        break;
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
              Text('放行信息', style: AppStyle().barTitleStyle),
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
                    '出门时间',
                    style: AppStyle().secondaryTextStyle,
                  ),
                  Spacer(),
                  Text(
                    DateUtil.formatDate(
                      _model.expected,
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
                    '物品出门',
                    style: AppStyle().secondaryTextStyle,
                  ),
                  Spacer(),
                  Text(
                    _model.exportValue,
                    style: AppStyle().primaryStyle,
                  ),
                ],
              ),
            ],
          ),
        );
        break;
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
              Text('放行信息', style: AppStyle().barTitleStyle),
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
                    '驳回时间',
                    style: AppStyle().secondaryTextStyle,
                  ),
                  Spacer(),
                  Text(
                    DateUtil.formatDate(
                      _model.expected,
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
                    '驳回理由',
                    style: AppStyle().secondaryTextStyle,
                  ),
                  Spacer(),
                  Text(
                    _model.remarks,
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
        break;
      default:
        return SizedBox();
    }
  }
}
