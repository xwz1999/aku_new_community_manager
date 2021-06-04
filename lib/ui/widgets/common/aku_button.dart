import 'dart:io';

import 'package:aku_community_manager/ui/widgets/common/aku_cupertino_button.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_material_button.dart';
import 'package:flutter/material.dart';

class AkuButton extends StatefulWidget {
  @required
  final Widget child;
  final double height;
  final double radius;
  final EdgeInsets padding;
  @required
  final VoidCallback? onPressed;
  final Color color;
  final double width;
  AkuButton({
    Key? key,
    required this.child,
    this.height = 0,
    this.radius = 0,
     this.onPressed,
    this.padding = EdgeInsets.zero,
    this.color = Colors.transparent,
    this.width = 0,
  }) : super(key: key);

  @override
  _AkuButtonState createState() => _AkuButtonState();
}

class _AkuButtonState extends State<AkuButton> {
  bool get isIOS => Platform.isIOS;
  @override
  Widget build(BuildContext context) {
    return isIOS
        ? AkuCupertinoButton(
            onPressed: widget.onPressed!,
            child: widget.child,
            radius: widget.radius,
            minHeight: widget.height,
            padding: widget.padding,
            color: widget.color,
            minWidth: widget.width,
          )
        : AkuMaterialButton(
            onPressed: widget.onPressed,
            child: widget.child,
            radius: widget.radius,
            height: widget.height,
            padding: widget.padding,
            color: widget.color,
            minWidth: widget.width,
          );
  }
}
