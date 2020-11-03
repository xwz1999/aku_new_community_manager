import 'package:aku_community_manager/mock_models/fix/fix_model.dart';
import 'package:aku_community_manager/mock_models/users/user_info_model.dart';
import 'package:aku_community_manager/provider/user_provider.dart';
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:provider/provider.dart';

class BusinessFixCard extends StatefulWidget {
  final FixModel model;
  BusinessFixCard({Key key, @required this.model}) : super(key: key);

  @override
  _BusinessFixCardState createState() => _BusinessFixCardState();
}

class _BusinessFixCardState extends State<BusinessFixCard> {
  String get dateStart => DateUtil.formatDate(widget.model.dateStart,
      format: 'yyyy-MM-dd HH:mm:ss');

  Widget get fixTypeWidget {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    if (userProvider.userInfoModel.role == USER_ROLE.MANAGER) {
      return Text(
        FixModel.managerRoleMap[widget.model.type],
        style: TextStyle(
          color: widget.model.type != FIX_ENUM.DONE
              ? Color(0XFFFF4501)
              : AppStyle.minorTextColor,
        ),
      );
    } else {
      return Text(
        FixModel.otherRoleMap[widget.model.type],
        style: TextStyle(
          color: widget.model.type != FIX_ENUM.DONE
              ? Color(0XFFFF4501)
              : AppStyle.minorTextColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                child: Text(
                  '报事报修',
                  style: TextStyle(
                    color: AppStyle.secondaryColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 6.w, horizontal: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.w),
                  border:
                      Border.all(width: 2.w, color: AppStyle.secondaryColor),
                ),
              ),
              AkuBox.w(16),
              Expanded(
                child: Text(
                  dateStart,
                  style: TextStyle(
                    color: AppStyle.minorTextColor,
                    fontSize: 22.sp,
                  ),
                ),
              ),
              fixTypeWidget,
            ],
          ),
          AkuBox.h(24),
          Text(
            widget.model.title,
            style: TextStyle(
              color: AppStyle.primaryTextColor,
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          AkuBox.h(16),
          _buildImgs(),
        ],
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 32.w,
        vertical: 8.w,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
      ),
    );
  }

  _buildImgs() {
    return Container(
      height: 168.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var imgObj = widget.model.imgs[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            height: 168.w,
            width: 168.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.w),
              image: DecorationImage(
                  image: (imgObj is String)
                      ? AssetImage(imgObj)
                      : FileImage(imgObj)),
            ),
          );
        },
        itemCount: widget.model.imgs.length,
      ),
    );
  }
}
