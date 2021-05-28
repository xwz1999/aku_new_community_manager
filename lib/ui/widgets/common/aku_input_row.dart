import 'package:aku_community_manager/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
class AkuInputRow extends StatefulWidget {

  final String title;
  final List<TextInputFormatter> formatters;
  final TextEditingController controller;
  final String hintText;
  AkuInputRow({Key key, this.title, this.formatters, this.controller, this.hintText}) : super(key: key);

  @override
  _AkuInputRowState createState() => _AkuInputRowState();
}

class _AkuInputRowState extends State<AkuInputRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title.text.size(28.sp).color(kTextPrimaryColor).make(),
          32.w.heightBox,
          TextField(
            inputFormatters: widget.formatters,
            controller: widget.controller,
            textAlign: TextAlign.start,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: widget.hintText ?? '',
              isDense: true,
              contentPadding: EdgeInsets.zero,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE8E8E8), width: 2.w),
              ),
            ),
            style: TextStyle(
              fontSize: 36.sp,
              fontWeight: FontWeight.bold,
              color: kTextPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}