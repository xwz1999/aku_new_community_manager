import 'dart:io';

import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/aku_divider.dart';
import 'package:aku_community_manager/ui/widgets/app_widgets/aku_pick_image_widget.dart';
import 'package:aku_community_manager/ui/widgets/app_widgets/aku_single_check_button.dart';
import 'package:aku_community_manager/ui/widgets/app_widgets/bee_grid_image_view.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
class HouseKeepingFeedBackPage extends StatefulWidget {
  HouseKeepingFeedBackPage({Key? key}) : super(key: key);

  @override
  _HouseKeepingFeedBackPageState createState() =>
      _HouseKeepingFeedBackPageState();
}

class _HouseKeepingFeedBackPageState extends State<HouseKeepingFeedBackPage> {
  int _feedBackStatus = 0;
  late TextEditingController _editingController;
  late TextEditingController _priceController;

  List<File> _files = [];
  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController();
    _priceController = TextEditingController();
  }

  @override
  void dispose() {
    _editingController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '工作汇报',
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.w),
        children: <Widget>[
          _buidlInfo(),
          16.w.heightBox,
          _buildFeedBack(),
          16.w.heightBox,
          _payTile(),
        ],
      ),
    );
  }

  Widget _buidlInfo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.w),
      color: Colors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          '服务信息'.text.size(36.sp).black.bold.make(),
          40.w.heightBox,
          ''.text.size(28.sp).black.make(),
          16.w.heightBox,
          BeeGridImageView(urls: []),
        ],
      ),
    );
  }

  Widget _buildFeedBack() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.w, horizontal: 24.w),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          '服务反馈'.text.size(36.sp).black.bold.make(),
          40.w.heightBox,
          '完成情况'.text.size(28.sp).black.make(),
          24.w.heightBox,
          Row(
            children: [
              AkuSingleCheckButton(
                  text: '未完成',
                  value: 1,
                  gropValue: _feedBackStatus,
                  onPressed: () {
                    _feedBackStatus = 1;
                    setState(() {});
                  }),
              40.w.widthBox,
              AkuSingleCheckButton(
                  text: '已完成',
                  value: 2,
                  gropValue: _feedBackStatus,
                  onPressed: () {
                    _feedBackStatus = 2;
                    setState(() {});
                  }),
            ],
          ),
          40.w.heightBox,
          '处理描述'.text.size(28.sp).black.make(),
          24.w.heightBox,
          Container(
            padding: EdgeInsets.all(24.w),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.w),
                borderRadius: BorderRadius.circular(22.w)),
            child: TextField(
              controller: _editingController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  border: InputBorder.none,
                  hintText: '请输入处理描述',
                  hintStyle: TextStyle(
                    fontSize: 28.sp,
                    color: kTextSubColor,
                    fontWeight: FontWeight.bold,
                  )),
              style: TextStyle(
                fontSize: 28.sp,
                color: Colors.black,
              ),
              maxLines: 10,
              minLines: 5,
            ),
          ),
          40.w.heightBox,
          '上传服务完成照片'.text.size(28.sp).black.make(),
          24.w.heightBox,
          AkuPickImageWidget(onChanged: (files) {
            _files = files;
          })
        ],
      ),
    );
  }

  Widget _payTile() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 32.w, horizontal: 32.w),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              '支付费用'.text.size(28.sp).black.make(),
              350.w.widthBox,
              '¥'.text.size(32.sp).bold.color(Colors.red).make(),
              24.w.widthBox,
              TextField(
                controller: _editingController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^[0-9][\.\d]*(,\d+)?$'))
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                    border: InputBorder.none,
                    hintText: '请输入金额',
                    hintStyle: TextStyle(
                        fontSize: 32.sp,
                        color: kTextSubColor,
                        fontWeight: FontWeight.bold)),
                style: TextStyle(
                  fontSize: 32.sp,
                  color: Colors.black,
                ),
              ).expand(),
            ],
          ),
          24.w.heightBox,
          AkuDivider.horizontal()
        ],
      ),
    );
  }
}
