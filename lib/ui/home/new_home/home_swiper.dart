import 'dart:async';

import 'package:aku_new_community_manager/gen/assets.gen.dart';
import 'package:aku_new_community_manager/saas_models/home/home_message_list_model.dart';
import 'package:aku_new_community_manager/utils/bee_date_util.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeSwiper extends StatefulWidget {
  final List<HomeMessageListModel> models;

  const HomeSwiper({Key? key, required this.models}) : super(key: key);

  @override
  _HomeSwiperState createState() => _HomeSwiperState();
}

class _HomeSwiperState extends State<HomeSwiper> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  late Timer timer;

  @override
  void initState() {
    // _pageController.addListener(() {
    //   setState(() {});
    // });
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentPage != widget.models.length - 1) {
        var page = (_currentPage + 1).toInt();
        _pageController.animateToPage(page,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        _pageController.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 440.w,
      height: 272.w,
      padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.w),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              reverse: true,
              onPageChanged: (page) {
                _currentPage = page;
                setState(() {});
              },
              itemCount: widget.models.length,
              itemBuilder: (context, index) {
                return _card(widget.models[index]);
              },
            ),
          ),
          16.w.heightBox,
          _indicator(),
          8.w.heightBox,
        ],
      ),
    );
  }

  Widget _indicator() {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            widget.models.length,
            (index) => GestureDetector(
              onTap: () {
                _pageController.animateToPage(index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
                setState(() {});
              },
              child: Material(
                child: Container(
                  width: 32.w,
                  height: 6.w,
                  decoration: BoxDecoration(
                    borderRadius: index == 0
                        ? BorderRadius.only(
                            topLeft: Radius.circular(3.w),
                            bottomLeft: Radius.circular(3.w))
                        : index == widget.models.length - 1
                            ? BorderRadius.only(
                                topRight: Radius.circular(3.w),
                                bottomRight: Radius.circular(3.w))
                            : BorderRadius.circular(3.w),
                    color: Color(0xFFF6F6F6),
                  ),
                ),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
            top: 0,
            left: _currentPage * 32.w,
            child: Container(
              width: 32.w,
              height: 6.w,
              decoration: BoxDecoration(
                color: Color(0xFFFFC40C),
                borderRadius: BorderRadius.circular(3.w),
              ),
            ),
            curve: Curves.easeInOut,
            duration: Duration(
              milliseconds: 500,
            ))
      ],
    );
  }

  Widget _card(HomeMessageListModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Assets.home.message.image(width: 40.w, height: 40.w),
            16.w.widthBox,
            model.title.text.size(28.sp).color(Colors.black).bold.make(),
          ],
        ),
        20.w.heightBox,
        model.content.text
            .size(24.sp)
            .maxLines(3)
            .overflow(TextOverflow.ellipsis)
            .color(Colors.black.withOpacity(0.65))
            .make(),
        40.w.heightBox,
        BeeDateUtil(DateUtil.getDateTime(model.sendDate))
            .timeAgo
            .text
            .size(20.sp)
            .color(Colors.black.withOpacity(0.25))
            .make(),
      ],
    );
  }
}
