// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:aku_new_community_manager/tools/screen_tool.dart';

class AkuTile extends StatefulWidget {
  final Widget? prefix;
  final Widget? suffix;
  final Widget title;
  final bool arrow;
  final Color color;
  final double? height;

  final VoidCallback? onTap;
  AkuTile({
    Key? key,
    this.prefix,
    this.suffix,
    required this.title,
    this.arrow = true,
    this.onTap,
    this.color = Colors.white,
    this.height,
  }) : super(key: key);

  @override
  _AkuTileState createState() => _AkuTileState();
}

class _AkuTileState extends State<AkuTile> {
  double get height => widget.height ?? 96.w;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Material(
        color: widget.color,
        child: InkWell(
          onTap: widget.onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Row(
              children: [
                widget.prefix ?? SizedBox(),
                DefaultTextStyle(
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 28.sp,
                  ),
                  child: widget.title,
                ),
                Spacer(),
                widget.suffix ?? SizedBox(),
                widget.suffix != null && widget.arrow
                    ? SizedBox(width: 24.w)
                    : SizedBox(),
                widget.arrow
                    ? Icon(
                        Icons.arrow_forward_ios,
                        size: 24.w,
                        color: Color(0xFF999999),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
