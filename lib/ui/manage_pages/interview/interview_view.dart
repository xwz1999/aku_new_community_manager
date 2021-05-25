import 'package:aku_community_manager/const/api.dart';
import 'package:aku_community_manager/models/manager/interview/interview_list_model.dart';
import 'package:aku_community_manager/ui/manage_pages/interview/interview_card.dart';
import 'package:aku_community_manager/ui/widgets/common/bee_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class InterviewView extends StatefulWidget {
  final int index;
  InterviewView({Key key, this.index}) : super(key: key);

  @override
  _InterviewViewState createState() => _InterviewViewState();
}

class _InterviewViewState extends State<InterviewView> {
  EasyRefreshController _refreshController;
  @override
  void initState() {
    super.initState();
    _refreshController = EasyRefreshController();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BeeListView(
        path: API.manage.interviewList,
        controller: _refreshController,
        extraParams: {
          "interviewStatus": widget.index + 1,
        },
        convert: (models) {
          return models.tableList
              .map((e) => InterviewListModel.fromJson(e))
              .toList();
        },
        builder: (items) {
          return ListView.separated(
              padding: EdgeInsets.all(24.w),
              itemBuilder: (context, index) {
                return InterviewCard(
                  model: items[index],
                );
              },
              separatorBuilder: (_, __) {
                return 24.w.heightBox;
              },
              itemCount: items.length);
        });
  }
}
