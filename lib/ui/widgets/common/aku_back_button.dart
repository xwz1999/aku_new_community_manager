// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:aku_ui/common_widgets/aku_material_button.dart';

// Project imports:
import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';

class AkuBackButton extends StatefulWidget {
  final Brightness brightness;
  final IconData icon;
  final bool text;

  AkuBackButton({
    Key key,
    this.brightness = Brightness.light,
    this.icon = Icons.arrow_back_ios,
    this.text = false,
  }) : super(key: key);

  AkuBackButton.close({
    Key key,
    this.brightness = Brightness.light,
    this.icon = Icons.clear,
    this.text = false,
  }) : super(key: key);

  AkuBackButton.text({
    Key key,
    this.brightness = Brightness.light,
    this.icon,
    this.text = true,
  }) : super(key: key);

  @override
  _AkuBackButtonState createState() => _AkuBackButtonState();
}

class _AkuBackButtonState extends State<AkuBackButton> {
  @override
  Widget build(BuildContext context) {
    return Navigator.canPop(context)
        ? widget.text
            ? AkuMaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  '取消',
                  style: TextStyle(
                    color: AppStyle.primaryTextColor,
                    fontSize: 28.w,
                    fontWeight: FontWeight.bold,
                  ),
                ))
            : IconButton(
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
