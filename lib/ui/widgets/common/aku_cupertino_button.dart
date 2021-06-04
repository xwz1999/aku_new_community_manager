import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AkuCupertinoButton extends CupertinoButton {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;
  final EdgeInsetsGeometry padding;
  final double radius;
  final double minHeight;
  final Color? nullColor;
  final double minWidth;

  AkuCupertinoButton({
    Key? key,
    /*required*/ required this.onPressed,
    /*required*/ required this.child,
    this.color = Colors.transparent,
    this.padding = EdgeInsets.zero,
    this.radius = 0,
    this.minHeight = 0,
    this.nullColor,
    required this.minWidth,
  }) : super(
          key: key,
          child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(minWidth: minWidth),
            child: child,
          ),
          color: color,
          onPressed: onPressed,
          padding: padding,
          borderRadius: BorderRadius.circular(radius),
          minSize: minHeight,
          disabledColor: nullColor ?? color.withAlpha(170),
        );
}