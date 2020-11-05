import 'package:aku_community_manager/mock_models/decoration/decoration_model.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:aku_community_manager/ui/sub_pages/decoration_manager/decoration_check_card_widget.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';
import 'package:flutter/material.dart';

class DecorationCheckRow extends StatelessWidget {
  final List<CHECK_TYPE> details;
  const DecorationCheckRow({Key key, @required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.w,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return DecorationCheckCardWidget(
            type: details[index],
          );
        },
        itemCount: details.length,
        separatorBuilder: (context, index) {
          return AkuBox.w(16);
        },
      ),
    );
  }
}
