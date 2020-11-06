import 'package:aku_community_manager/ui/widgets/common/aku_back_button.dart';
import 'package:flutter/material.dart';
import 'package:aku_community_manager/tools/screen_tool.dart';

///用法大致同Scaffold

class AkuScaffold extends StatefulWidget {
  ///AppBar 使用该值 `title`,`titleStyle`,`leading`,
  ///`brightness`,`appBarColor`,`actions`将失效
  final PreferredSizeWidget appBar;

  ///title
  final String title;

  ///title style
  ///
  ///默认
  ///
  ///```
  ///TextStyle(
  ///   fontWeight: FontWeight.bold,
  ///   color: Color(0xFF333333),
  ///   fontSize: 36.sp,
  ///)
  ///```
  final TextStyle titleStyle;

  ///leading
  ///
  ///默认使用 `AkuBackButton`
  final Widget leading;

  ///brightness
  final Brightness brightness;

  ///body
  final Widget body;

  final Widget bottom;

  ///背景色
  ///
  ///默认`0xFFF9F9F9`
  final Color backgroundColor;

  final Color appBarColor;

  final List<Widget> actions;

  final PreferredSizeWidget appBarBottom;
  AkuScaffold({
    Key key,
    this.appBar,
    this.title,
    this.titleStyle,
    this.leading,
    this.brightness = Brightness.light,
    this.body,
    this.backgroundColor = const Color(0XFFF9F9F9),
    this.bottom,
    this.appBarColor = Colors.white,
    this.appBarBottom,
    this.actions = const [],
  }) : super(key: key);

  @override
  _AkuScaffoldState createState() => _AkuScaffoldState();
}

class _AkuScaffoldState extends State<AkuScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      appBar: widget.appBar ??
          AppBar(
            backgroundColor: widget.appBarColor,
            leading: widget.leading ?? AkuBackButton(),
            brightness: widget.brightness,
            elevation: 0,
            centerTitle: true,
            title: DefaultTextStyle(
              style: widget.titleStyle ??
                  TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                    fontSize: 36.sp,
                  ),
              child: Text(widget.title ?? ''),
            ),
            bottom: widget.appBarBottom,
            actions: widget.actions,
          ),
      body: widget.body,
      bottomNavigationBar: widget.bottom,
    );
  }
}
