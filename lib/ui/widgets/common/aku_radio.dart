import 'dart:ffi';

import 'package:aku_community_manager/style/app_style.dart';
import 'package:flutter/material.dart';

class AkuRadio extends StatefulWidget {
  final double size;
  final int grouvalue;
  final int value;
  final AkuValueChange onchanged;
  AkuRadio({Key key, this.size, this.grouvalue, this.value, this.onchanged})
      : super(key: key);

  @override
  _AkuRadioState createState() => _AkuRadioState();
}

class _AkuRadioState extends State<AkuRadio> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onchanged(widget.value);
      },
      child: Container(
        alignment: Alignment.center,
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFE8E8E8), width: 2.w),
            borderRadius: BorderRadius.circular(widget.size / 2),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: widget.grouvalue == widget.value
                    ? [Color(0xFFFFE080), Color(0xFFFFC40C)]
                    : [Color(0xFFFFFFFF), Color(0xFFFFFFFF)])),
        child: widget.grouvalue == widget.value
            ? Icon(
                Icons.check,
                size: widget.size * 0.8,
              )
            : SizedBox(),
      ),
    );
  }
}

typedef AkuValueChange = void Function(int);
