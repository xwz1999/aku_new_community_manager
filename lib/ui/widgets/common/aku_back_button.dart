import 'package:flutter/material.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';

class AkuBackButton extends StatefulWidget {
  final Brightness brightness;
  final IconData icon;
  AkuBackButton({
    Key key,
    this.brightness = Brightness.light,
    this.icon = Icons.arrow_back_ios,
  }) : super(key: key);

  AkuBackButton.close({
    Key key,
    this.brightness = Brightness.light,
    this.icon = Icons.clear,
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
              widget.icon,
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
