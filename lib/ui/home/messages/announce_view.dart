import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../const/saas_api.dart';
import '../../../models/message/notice_model.dart';
import '../../../utils/network/net_util.dart';
import 'announce_card.dart';

class ListDateModel {
  final String month;
  final int index;
  final String year;
  final List<NoticeModel> models;

  ListDateModel(this.month, this.models, this.index, this.year);
}

class AnnounceView extends StatefulWidget {
  const AnnounceView({
    Key? key,
  }) : super(key: key);

  @override
  _AnnounceViewState createState() => _AnnounceViewState();
}

class _AnnounceViewState extends State<AnnounceView> {
  EasyRefreshController _refreshController = EasyRefreshController();
  late AutoScrollController _autoScrollController;

  List<ListDateModel> _modelLists = [];
  List<NoticeModel> _innerModelList = [];
  String _headMonth = '';

  void monthListDepart(List<NoticeModel> models) {
    for (var item in models) {
      var index =
          _modelLists.indexWhere((element) => element.month == item.month);
      if (index >= 0) {
        _modelLists[index].models.add(item.copyWith());
      } else {
        _modelLists.insert(
            _modelLists.length,
            ListDateModel(item.month.toString(), [item.copyWith()],
                _modelLists.length, item.year.toString()));
      }
    }
  }

  int _page = 1;
  int _size = 5;

  bool visible(int index) {
    if (index == 0) {
      return true;
    } else if (_modelLists[index].month == _modelLists[index - 1].month) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.top + 130.w),
      axis: Axis.vertical,
    );

    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _autoScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: EasyRefresh(
            firstRefresh: true,
            header: MaterialHeader(),
            footer: MaterialFooter(),
            scrollController: _autoScrollController,
            controller: _refreshController,
            onRefresh: () async {
              _page = 1;
              _modelLists.clear();
              _innerModelList.clear();
              var base =
                  await NetUtil().getList(SAASAPI.message.messageList, params: {
                'pageNum': _page,
                'size': _size,
                'type': 2,
              });
              _innerModelList =
                  base.rows.map((e) => NoticeModel.fromJson(e)).toList();
              monthListDepart(_innerModelList);
              if (_modelLists.isNotEmpty) {
                _headMonth = _modelLists[0].month;
              }

              setState(() {});
            },
            onLoad: () async {
              _page++;
              var base =
                  await NetUtil().getList(SAASAPI.message.messageList, params: {
                'pageNum': _page,
                'size': _size,
                'type': 2,
              });
              if (base.total > _modelLists.length) {
                _innerModelList =
                    base.rows.map((e) => NoticeModel.fromJson(e)).toList();
                monthListDepart(_innerModelList);
                setState(() {});
              } else {
                print('1111111');
                _refreshController.finishLoadCallBack!(noMore: true);
              }
            },
            child: _modelLists.isEmpty
                ? Container()
                : ListView.separated(
                    shrinkWrap: true,
                    controller: _autoScrollController,
                    itemBuilder: (context, index) {
                      return AutoScrollTag(
                        key: ValueKey(index),
                        index: index,
                        controller: _autoScrollController,
                        child: AnnounceCard(
                          modelList: _modelLists[index],
                          index: index,
                          visible: visible(index),
                        ),
                      );
                    },
                    separatorBuilder: (_, index) => SizedBox(),
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 32.w),
                    //   alignment: Alignment.centerLeft,
                    //   width: double.infinity,
                    //   height: 98.w,
                    //   child: _modelLists[index + 1]
                    //       .month
                    //       .text
                    //       .size(36.sp)
                    //       .black
                    //       .make(),
                    // ),
                    itemCount: _modelLists.length),
          ),
        ),
      ],
    );
  }

  PopupMenuButton _popupMenuButton() {
    return PopupMenuButton(
      child: Icon(
        CupertinoIcons.arrowtriangle_down_fill,
        size: 24.w,
      ),
      itemBuilder: (context) {
        return List.generate(
            _modelLists.length,
            (index) => PopupMenuItem(
                  child: Text(_modelLists[index].month),
                  value: _modelLists[index].index,
                ));
      },
      onSelected: (value) {
        _headMonth = _modelLists[value].month;
        print(value);
        _autoScrollController.scrollToIndex(value,
            preferPosition: AutoScrollPosition.end);
        setState(() {});
      },
    );
  }
}
