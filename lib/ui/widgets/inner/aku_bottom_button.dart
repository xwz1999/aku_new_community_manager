// Flutter imports:
import 'package:aku_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:flutter/material.dart';

// Package imports:

// Project imports:
import 'package:aku_community_manager/style/app_style.dart';

class AkuBottomButton extends StatefulWidget {
  final VoidCallback onTap;
  final String title;
  AkuBottomButton({Key key, this.onTap, @required this.title})
      : super(key: key);

  @override
  _AkuBottomButtonState createState() => _AkuBottomButtonState();
}

class _AkuBottomButtonState extends State<AkuBottomButton> {
  @override
  Widget build(BuildContext context) {
    return AkuMaterialButton(
      height: 98.w,
      color: AppStyle.primaryColor,
      nullColor: AppStyle.minorColor,
      onPressed: widget.onTap,
      child: Text(
        widget.title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: widget.onTap == null
              ? AppStyle.minorTextColor
              : AppStyle.primaryTextColor,
        ),
      ),
    );
  }
}
