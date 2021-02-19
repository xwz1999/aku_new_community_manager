// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:aku_community_manager/const/resource.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_back_button.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

class SearchWorkOrderPage extends StatefulWidget {
  SearchWorkOrderPage({Key key}) : super(key: key);

  @override
  _SearchWorkOrderpageState createState() => _SearchWorkOrderpageState();
}

class _SearchWorkOrderpageState extends State<SearchWorkOrderPage> {
  TextEditingController _textController;
  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: SizedBox(
          width: 89.w,
          child: AkuBackButton(),
        ),
        titleSpacing: 0,
        title: Container(
          margin: EdgeInsets.only(right: 37.w),
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          height: 72.w,
          child: Row(
            children: [
              Image.asset(
                R.ASSETS_HOME_IC_SEARCH_PNG,
                height: 40.w,
                width: 40.w,
              ),
              AkuBox.w(16),
              Expanded(
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: '搜索工单、手机号',
                    hintStyle: TextStyle(
                      color: AppStyle.minorTextColor,
                      fontSize: 28.sp,
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: AppStyle.minorTextColor,
                    fontSize: 28.sp,
                  ),
                  onChanged: (text) {
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(8.w),
          ),
        ),
      ),
      body: Center(
        child: _textController.text.isEmpty
            ? SizedBox()
            : Text(
                '无结果',
                style: TextStyle(
                    color: AppStyle.primaryTextColor, fontSize: 36.sp),
              ),
      ),
    );
  }
}
