// Flutter imports:
import 'package:aku_new_community_manager/models/manager/borrow/borrow_status_item_model.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/show_bottom_sheet.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:aku_new_community_manager/const/api.dart';
import 'package:aku_new_community_manager/models/manager/borrow/borrow_check_item_model.dart';
import 'package:aku_new_community_manager/style/app_style.dart';
import 'package:aku_new_community_manager/tools/widget_tool.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:aku_new_community_manager/utils/network/base_model.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
import 'package:velocity_x/velocity_x.dart';

import '../manage_func.dart';

class BorrowManagerExaminePage extends StatefulWidget {
  final int id;
  final int type;
  //1为借用 2为归还
  final BorrowStatusItemModel model;
  BorrowManagerExaminePage({Key? key, required this.id,required this.type, required this.model}) : super(key: key);

  @override
  _BorrowManagerExaminePageState createState() => _BorrowManagerExaminePageState();
}

class _BorrowManagerExaminePageState extends State<BorrowManagerExaminePage> {
  int borrowStatus = -1;
  BorrowCheckItemModel? _model;
  String rejectReasons = '';
  late TextEditingController _editingController;
  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController();

  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '物品审核',
      bottom: AkuBottomButton(
        title: '点击提交',
        onTap: () async {
          if(borrowStatus!=-1){
            Function cancel = BotToast.showLoading();
            await NetUtil().post(
              API.manage.lendingApproval,
              params: {
                'id': widget.id,
                'status': borrowStatus,
                'rejectReasons':rejectReasons,
              },
              showMessage: true,
            );
            cancel();
            Get.back(result: true);
          }
          else{
            BotToast.showText(text: '请先选择审核结果！');
          }

        },
      ),
      body: EasyRefresh(
        firstRefresh: true,
        onRefresh: () async {
          BaseModel model = await NetUtil().get(
            API.manage.borrowCheckInfo,
            params: {'articleBorrowId': widget.id},
            showMessage: false,
          );
          if (model.data == null) {
            // Get.back();
            return;
          }
          _model = BorrowCheckItemModel.fromJson(model.data);
          setState(() {});
        },
        header: MaterialHeader(),
        child: _model == null
            ? SizedBox()
            : ListView(
                padding: EdgeInsets.symmetric(vertical: 16.w),
                children: [
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              _buildRow(
                                '物品名称',
                                Text(
                                  _model!.articleName!,
                                  style: TextStyle(
                                    color: AppStyle.primaryTextColor,
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Divider(height: 1.w),
                              _buildRow(
                                '操作类型',
                                Text(
                                  widget.type==1?'借用':'归还',
                                  style: TextStyle(
                                    color: AppStyle.primaryTextColor,
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Divider(height: 1.w),
                              _buildRow(
                                  widget.type==1?'借用数量':'归还数量',
                                  Text(
                                    '1',
                                    style: TextStyle(
                                      color: AppStyle.primaryTextColor,
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                              Divider(height: 1.w),
                              _buildRow(
                                '物品图片',
                                FadeInImage.assetNetwork(
                                  placeholder: R.ASSETS_PLACEHOLDER_WEBP,
                                  image: API.image(_model!.firstImg?.url ?? ''),
                                  height: 184.w,
                                  width: 184.w,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          color: Color(0XFFF9F9F9),
                          height: 16.w,
                          width: double.infinity,
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              _buildRow(
                                widget.type==1?'借用人    ':'归还人    ',
                                Text(
                                  widget.model.borrowName??'',
                                  style: TextStyle(
                                    color: AppStyle.primaryTextColor,
                                    fontSize: 28.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Divider(height: 1.w),
                              _buildRow(
                                  '联系电话',
                                  Text(
                                    widget.model.borrowTel??'',
                                    style: TextStyle(
                                      color: AppStyle.primaryTextColor,
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ],
                          ),
                        ),

                        Container(
                          color: Color(0XFFF9F9F9),
                          height: 16.w,
                          width: double.infinity,
                        ),
                  Container(
                    color: Color(0XFFF9F9F9),
                    height: 16.w,
                    width: double.infinity,
                  ),

                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 16,right: 16,bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 25.w,bottom: 25.w),child:'审核结果'.text.size(28.sp).black.make()),
                        Divider(height: 1.w),
                      Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap:  () {
                          _openModalBottomSheet();
                        },
                        child: Row(
                          children: [
                            AkuBox.h(96),
                            Text(
                              borrowStatus==-1?'请选择审核结果': borrowStatus==0?'审核失败':'审核通过',
                              style: TextStyle(
                                fontSize: 32.sp,
                                fontWeight: FontWeight.bold,
                                color:  borrowStatus==-1
                                    ? Color(0x40000000)
                                    : Colors.black,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 24.w,
                              color: AppStyle.minorTextColor,
                            )

                          ],
                        ),
                      ),
                    ),
                        Divider(height: 1.w),

                        Padding(padding: EdgeInsets.only(top: 25.w),child:  '备注内容'.text.size(28.sp).black.make()),
                        25.w.heightBox,
                        Container(
                          padding: EdgeInsets.all(24.w),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFD4CFBE), width: 0.5.w),
                              borderRadius: BorderRadius.circular(4.w)),
                          child: TextField(
                            onChanged: (value){
                              rejectReasons = value;
                              setState(() {

                              });
                            },
                            controller: _editingController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                isDense: true,
                                border: InputBorder.none,
                                hintText: '请输入备注内容',
                                hintStyle: TextStyle(
                                  fontSize: 24.sp,
                                  color: kTextSubColor,

                                )),
                            style: TextStyle(
                              fontSize: 28.sp,
                              color: Colors.black,
                            ),
                            maxLines: 10,
                            minLines: 5,
                          ),
                        ),



                      ],
                    ),
                  ),



                ],
              ),
      ),
    );
  }

   _openModalBottomSheet()  {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 180,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('审核通过',textAlign: TextAlign.center,style: TextStyle(

                      fontSize: 32.sp,
                      color: Color(0xFF333333)
                  ),),
                  onTap: () {
                    Get.back();
                    borrowStatus = 1;
                    setState(() {});
                  },
                ),
                ListTile(
                  title: Text('审核失败',textAlign: TextAlign.center,style: TextStyle(

                      fontSize: 32.sp,
                      color: Color(0xFF333333)
                  ),),
                  onTap: () {
                    Get.back();
                    borrowStatus = 0;
                    setState(() {});
                  },
                ),
                Container(
                  width: double.infinity,
                  height: 16.w,
                  color: Color(0xFFF7F7F7),
                ),
                ListTile(
                  title: Text('取消',textAlign: TextAlign.center,style: TextStyle(

                      fontSize: 32.sp,
                      color: Color(0xFF333333)
                  ),),
                  onTap: () {
                    Get.back();
                    borrowStatus = -1;
                    setState(() {});
                  },
                ),
              ],
            ),
          );
        }
    );


  }

  _buildRow(String title, Widget child) {
    return Row(
      children: [
        AkuBox.h(96),
        Text(
          title,
          style: TextStyle(
            color: AppStyle.minorTextColor,
            fontSize: 28.w,
          ),
        ),
        AkuBox.w(80),
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: child,
          ),
        ),
      ],
    );
  }

  _buildCard(int status) {
    return GestureDetector(
      onTap: () {
        borrowStatus = status;
        setState(() {});
      },
      child: Container(
        height: 56.w,
        width: 112.w,
        child: Text(
          {
            1: '完好',
            2: '损坏',
            3: '丢失',
          }[status]!,
          style: TextStyle(
            color: borrowStatus == status
                ? AppStyle.secondaryColor
                : AppStyle.minorTextColor,
            fontSize: 28.sp,
          ),
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: borrowStatus == status
                ? AppStyle.secondaryColor
                : AppStyle.minorTextColor,
            width: 2.w,
          ),
        ),
      ),
    );
  }
}
