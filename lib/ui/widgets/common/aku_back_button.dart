import 'package:flutter/material.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';

class AkuBackButton extends StatefulWidget {
  final Brightness brightness;
  AkuBackButton({
    Key key,
    this.brightness = Brightness.light,
  }) : super(key: key);

  @override
  _AkuBackButtonState createState() => _AkuBackButtonState();
}

class _AkuBackButtonState extends State<AkuBackButton> {
  @override
  Widget build(BuildContext context) {
    return Navigator.canPop(context)
        ? IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 32.w,
              color: widget.brightness == Brightness.light
                  ? Color(0xFF333333)
                  : Color(0xFFEEEEEE),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        : SizedBox();
  }
}
