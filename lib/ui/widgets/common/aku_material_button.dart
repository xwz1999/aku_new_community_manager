import 'package:flutter/material.dart';

class AkuMaterialButton extends MaterialButton {
  final VoidCallback onPressed;
  final double elevation;
  final double disabledElevation;
  final double focusElevation;
  final double highlightElevation;
  final double hoverElevation;
  final double height;
  final double minWidth;
  final double radius;
  final EdgeInsets padding;
  final Color color;
  final Color nullColor;

  final Widget child;
  AkuMaterialButton({
    Key key,
    @required this.onPressed,
    this.elevation = 0,
    this.disabledElevation = 0,
    this.focusElevation = 0,
    this.highlightElevation = 0,
    this.hoverElevation = 0,
    this.height = 48,
    this.minWidth = 0,
    this.radius = 0,
    this.padding = EdgeInsets.zero,
    @required this.child,
    this.color = Colors.transparent,
    this.nullColor = Colors.transparent,
  }) : super(
          key: key,
          onPressed: onPressed,
          elevation: elevation,
          disabledElevation: disabledElevation,
          focusElevation: focusElevation,
          highlightElevation: highlightElevation,
          hoverElevation: hoverElevation,
          height: height,
          minWidth: minWidth,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: child,
          color: color,
          disabledColor: nullColor,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        );
}
