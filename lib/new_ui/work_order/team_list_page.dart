import 'package:aku_new_community_manager/const/saas_api.dart';
import 'package:aku_new_community_manager/gen/assets.gen.dart';
import 'package:aku_new_community_manager/saas_models/work_order/team_list_model.dart';
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_new_community_manager/utils/network/net_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class TeamListPage extends StatefulWidget {
  final int workOderId;

  const TeamListPage({Key? key, required this.workOderId}) : super(key: key);

  @override
  _TeamListPageState createState() => _TeamListPageState();
}

class _TeamListPageState extends State<TeamListPage> {
  List<TeamListModel> _models = [];

  TeamListModel? get _mainModel {
    for (var item in _models) {
      if (item.userType == 1) {
        return item;
      } else {
        return null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '服务团队名单',
      body: EasyRefresh(
        onRefresh: () async {
          var base = await NetUtil()
              .get(SAASAPI.workOrder.findServiceTeamList, params: {
            'workOrderId': widget.workOderId,
          });
          if (base.success) {
            _models = (base.data as List)
                .map((e) => TeamListModel.fromJson(e))
                .toList();
            setState(() {});
          }
        },
        child: ListView(
          children: [
            _positionTile('主负责人'),
            if (_mainModel != null) _personTile(_mainModel!),
            _positionTile('协同人'),
            ..._models.map((e) => _personTile(e)).toList()
          ],
        ),
      ),
    );
  }

  Widget _personTile(TeamListModel model) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
      width: double.infinity,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.red,
          ),
          16.w.heightBox,
          Column(
            children: [
              model.manageUserName.text
                  .size(28.sp)
                  .color(Colors.black.withOpacity(0.85))
                  .make(),
              8.w.heightBox,
              model.departmentName.text
                  .size(24.sp)
                  .color(Colors.black.withOpacity(0.45))
                  .make(),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () async {
              await launch('tel:${model.manageUserTel}');
            },
            child: Assets.icons.phone.image(width: 40.w, height: 40.w),
          )
        ],
      ),
    );
  }

  Widget _positionTile(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.w),
      width: double.infinity,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 26.sp,
          color: Colors.black.withOpacity(0.45),
        ),
      ),
    );
  }
}
