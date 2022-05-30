import 'package:aku_new_community_manager/const/saas_api.dart';
import 'package:aku_new_community_manager/gen/assets.gen.dart';
import 'package:aku_new_community_manager/new_ui/new_home/home_map.dart';
import 'package:aku_new_community_manager/new_ui/work_order/distributor/distributor_detail_page.dart';
import 'package:aku_new_community_manager/new_ui/work_order/receiver/receiver_detail_page.dart';
import 'package:aku_new_community_manager/saas_models/home/home_message_list_model.dart';
import 'package:aku_new_community_manager/saas_models/home/home_status_number_model.dart';
import 'package:aku_new_community_manager/saas_models/home/home_todo_list_model.dart';
import 'package:aku_new_community_manager/tools/user_tool.dart';
import 'package:aku_new_community_manager/ui/home/personal_draw.dart';
import 'package:aku_new_community_manager/ui/manage_pages/inspection_manage/inspection_manage_details_page.dart';
import 'package:aku_new_community_manager/ui/widgets/app_widgets/bee_avatar_widget.dart';
import 'package:aku_new_community_manager/utils/extension/list_extension.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'application_util.dart';
import 'home_swiper.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);

  @override
  _NewHomePageState createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  List<HomeMessageListModel> _announceModels = [];
  List<HomeTodoListModel> _todoModels = [];
  HomeStatusNumberModel? _homeNums;

  Future _getAnnounces() async {
    //type类型写死为公告
    var re = await NetUtil().getList(SAASAPI.message.messageList,
        params: {'type': 1, 'pageNum': 1, 'size': 10});
    _announceModels =
        re.rows.map((e) => HomeMessageListModel.fromJson(e)).toList();
  }

  Future _getToDoList() async {
    var base = await NetUtil().get(SAASAPI.home.todoList);
    _todoModels =
        (base.data as List).map((e) => HomeTodoListModel.fromJson(e)).toList();
  }

  Future _getStatusNum() async {
    var base = await NetUtil().get(SAASAPI.home.statusNum);
    _homeNums = HomeStatusNumberModel.fromJson(base.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      drawer: PersonalDraw(),
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight((72 + 96).w),
        child: Padding(
          padding: EdgeInsets.only(top: 96.w, left: 30.w),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 72.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.w),
                    color: Colors.white.withOpacity(0.34),
                  ),
                  child: Row(
                    children: [
                      24.w.widthBox,
                      Icon(
                        CupertinoIcons.search,
                        size: 40.w,
                      ),
                      16.w.widthBox,
                      '搜索工单、订单号、手机'
                          .text
                          .size(28.sp)
                          .color(Color(0xFF333333))
                          .make(),
                    ],
                  ),
                ),
              ),
              24.w.widthBox,
              //TODO：暂时隐藏 消息中心待做
              // SizedBox(
              //   height: 40.w,
              //   width: 40.w,
              //   child: IconButton(
              //     padding:EdgeInsets.zero,
              //     onPressed: () {
              //       Get.to(() => Message());
              //     },
              //     icon: Icon(
              //       CupertinoIcons.bell,
              //       size: 40.w,
              //     ),
              //   ),
              // )
              24.w.widthBox,
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: Assets.home.homeBack.image(),
          ),
          SafeArea(
            child: EasyRefresh(
              firstRefresh: true,
              onRefresh: () async {
                await _getAnnounces();
                await _getStatusNum();
                await _getToDoList();
                setState(() {});
              },
              header: MaterialHeader(),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                children: [
                  (32).w.heightBox,
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: '今天也要努力打工哦～'.text.size(32.sp).black.bold.make(),
                  ),
                  24.w.heightBox,
                  _headCard(),
                  64.w.heightBox,
                  _todoListWidget(),
                  56.w.heightBox,
                  _messageManageWidget(),
                  56.w.heightBox,
                  _applicationAssist(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _messageManageWidget() {
    var head = Row(
      children: [
        '信息管理'.text.size(36.sp).black.bold.make(),
        Spacer(),
      ],
    );
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          head,
          32.w.heightBox,
          Row(
            children: [
              HomeSwiper(models: _announceModels),
              24.w.widthBox,
              Flexible(
                child: Container(
                  height: 272.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 36.w),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFFFC40C).withOpacity(0.15),
                          offset: Offset(0, 2),
                          blurRadius: 6,
                          spreadRadius: 0)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          '未处理'
                              .text
                              .size(28.sp)
                              .color(Colors.black.withOpacity(0.85))
                              .make(),
                          Spacer(),
                          '${_homeNums?.noProcessedNum ?? 0}'
                              .text
                              .size(24.sp)
                              .color(Color(0xFFF01C26))
                              .make(),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          '处理中'
                              .text
                              .size(28.sp)
                              .color(Colors.black.withOpacity(0.85))
                              .make(),
                          Spacer(),
                          '${_homeNums?.processingNum ?? 0}'
                              .text
                              .size(24.sp)
                              .color(Color(0xFF1C92FF))
                              .make(),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          '已处理'
                              .text
                              .size(28.sp)
                              .color(Colors.black.withOpacity(0.85))
                              .make(),
                          Spacer(),
                          '${_homeNums?.processedNum ?? 0}'
                              .text
                              .size(24.sp)
                              .color(Color(0xFF52C41A))
                              .make(),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          '全部'
                              .text
                              .size(28.sp)
                              .color(Colors.black.withOpacity(0.85))
                              .make(),
                          Spacer(),
                          '${_homeNums?.allProcessNum ?? 0}'
                              .text
                              .size(24.sp)
                              .color(Color(0xFFFFC40C))
                              .make(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _applicationAssist() {
    var head = Row(
      children: [
        '功能助手'.text.size(36.sp).black.bold.make(),
        Spacer(),
      ],
    );
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          head,
          32.w.heightBox,
          Column(
            children: [
              Row(
                children: ApplicationUtil(['巡检管理', '工单管理', '住户审核'])
                    .elements
                    .map((e) => _applicationElement(e))
                    .toList()
                    .sepWidget(separate: 60.w.widthBox),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _applicationElement(AppElement element) {
    return GestureDetector(
      onTap: element.onTap,
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              element.imgPath,
              width: 80.w,
              height: 80.w,
            ),
            10.w.heightBox,
            element.title.text.size(24.sp).color(Color(0xFF111111)).make(),
          ],
        ),
      ),
    );
  }

  Container _todoListWidget() {
    var head = Row(
      children: [
        '待办事项'.text.size(36.sp).black.bold.make(),
        Spacer(),
        GestureDetector(
          onTap: () {},
          child: Material(
            color: Colors.transparent,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // '查看全部待办'.text.size(28.sp).color(Color(0xFFFFC40C)).make(),
                8.w.widthBox,
                // Container(
                //   width: 28.w,
                //   height: 28.w,
                //   alignment: Alignment.center,
                //   decoration: BoxDecoration(
                //     color: Color(0xFFC40C),
                //     borderRadius: BorderRadius.circular(4.w),
                //   ),
                //   child: Icon(
                //     CupertinoIcons.chevron_right,
                //     color: Color(0xFFFFC40C),
                //     size: 24.w,
                //   ),
                // )
              ],
            ),
          ),
        ),
      ],
    );
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          head,
          32.w.heightBox,
          SizedBox(
            height: 220.w,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: _todoModels
                  .mapIndexed((currentValue, index) =>
                      _todoListCard(currentValue, index))
                  .toList()
                  .sepWidget(separate: 20.w.widthBox),
            ),
          ),
        ],
      ),
    );
  }

  Widget _headCard() {
    var avatar = Container(
      width: 108.w,
      height: 108.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(54.w)),
      child: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: BeeAvatarWidget(
            width: 96.w,
            height: 96.w,
            imgs: UserTool.userProvider.userInfoModel!.imgList,
          ),
        );
      }),
    );
    return Container(
      height: 268.w,
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 48.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.w),
          image: DecorationImage(image: AssetImage(Assets.home.homeHead.path))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          avatar,
          24.w.widthBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              '${UserTool.userProvider.userInfoModel!.nickName}'
                  .text
                  .size(32.sp)
                  .black
                  .bold
                  .make(),
              10.w.heightBox,
              Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFC40C),
                      borderRadius: BorderRadius.circular(4.w),
                    ),
                    child:
                        '${UserTool.userProvider.userInfoModel!.communityName}'
                            .text
                            .size(24.sp)
                            .color(Colors.black.withOpacity(0.85))
                            .make(),
                  ),
                  16.w.widthBox,
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFC40C),
                      borderRadius: BorderRadius.circular(4.w),
                    ),
                    child:
                        '${UserTool.userProvider.userInfoModel!.positionName ?? ''}'
                            .text
                            .size(24.sp)
                            .color(Colors.black.withOpacity(0.85))
                            .make(),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _todoListCard(HomeTodoListModel model, int index) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            switch (model.type) {
              case 1:
                Get.to(InspectionManageDetailsPage(
                  executeId: model.id,
                ));
                break;
              case 2:
                if (UserTool
                        .userProvider.userInfoModel!.workOrderJurisdiction ==
                    1) {
                  Get.to(() => DistributorDetailPage(id: model.id));
                } else {
                  Get.to(() => ReceiverDetailPage(id: model.id));
                }
                break;
            }
          },
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 390.w,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
              decoration: BoxDecoration(
                color: Color(0xFFFFC40C).withOpacity(0.03),
                borderRadius: BorderRadius.circular(8.w),
                border: Border.all(color: Color(0xFFFFC40C).withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  '${HomeMap.todoType[model.type]}'
                      .text
                      .size(28.sp)
                      .color(Color(0xFF333333))
                      .bold
                      .make(),
                  12.w.heightBox,
                  '时间：${model.pendingDate}'
                      .text
                      .size(24.sp)
                      .color(Color(0xFF333333))
                      .make(),
                  8.w.heightBox,
                  '编号：${model.code}'
                      .text
                      .size(24.sp)
                      .color(Color(0xFF333333))
                      .make(),
                  Spacer(),
                  // BeeDateUtil(DateTime.now())
                  //     .timeAgo
                  //     .text
                  //     .size(20.sp)
                  //     .color(Color(0xFF999999))
                  //     .make(),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 66.w,
              height: 50.w,
              decoration: BoxDecoration(
                color: Color(0xFFFFC40C).withOpacity(0.3),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8.w)),
              ),
            ))
      ],
    );
  }
}
