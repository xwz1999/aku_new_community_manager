import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/widget_tool.dart';
import 'package:flutter/material.dart';

class DecorationCheckBox extends StatefulWidget {
  final bool initValue;
  final Function(bool state) onChange;
  DecorationCheckBox({Key key, this.initValue = true, this.onChange})
      : super(key: key);

  @override
  _DecorationCheckBoxState createState() => _DecorationCheckBoxState();
}

class _DecorationCheckBoxState extends State<DecorationCheckBox> {
  bool _nowValue;
  @override
  void initState() {
    super.initState();
    _nowValue = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildBox(
          rawChecked: true,
          color: AppStyle.successColor,
          subColor: AppStyle.subSuccessColor,
          title: '正常',
          icon: Icons.check,
        ),
        AkuBox.w(56),
        _buildBox(
          rawChecked: false,
          color: AppStyle.failColor,
          subColor: AppStyle.subFailColor,
          title: '异常',
          icon: Icons.check,
        ),
      ],
    );
  }

  _buildBox(
      {bool rawChecked,
      Color color,
      Color subColor,
      String title,
      IconData icon}) {
    final checked = _nowValue == rawChecked;
    return GestureDetector(
      onTap: widget.onChange == null
          ? null
          : () {
              setState(() {
                _nowValue = rawChecked;
              });
              widget.onChange(_nowValue);
            },
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              height: 40.w,
              width: 40.w,
              curve: Curves.easeInOutCubic,
              child: _buildIcon(icon, color, checked),
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.w),
                border: Border.all(
                  color: checked ? color : Color(0xFFE8E8E8),
                ),
                color: checked ? subColor : subColor.withOpacity(0),
              ),
            ),
            AkuBox.w(16),
            AkuBox.h(96),
            _buildText(title, color, checked),
          ],
        ),
      ),
    );
  }

  _buildText(String title, Color color, bool checked) {
    return Text(
      title,
      style: TextStyle(
        color: checked ? color : AppStyle.minorTextColor,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _buildIcon(IconData icon, Color color, bool checked) {
    return Icon(
      icon,
      color: checked ? color : Color(0xFFE8E8E8),
      size: 32.w,
    );
  }
}
