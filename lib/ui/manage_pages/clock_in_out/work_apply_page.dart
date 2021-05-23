import 'package:aku_community_manager/style/app_style.dart';
import 'package:aku_community_manager/tools/aku_divider.dart';
import 'package:aku_community_manager/ui/widgets/app_widgets/aku_single_check_button.dart';
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:aku_community_manager/ui/widgets/common/bee_date_picker.dart';
import 'package:aku_community_manager/ui/widgets/inner/aku_bottom_button.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class WorkApplyPage extends StatefulWidget {
  WorkApplyPage({Key key}) : super(key: key);

  @override
  _WorkApplyPageState createState() => _WorkApplyPageState();
}

class _WorkApplyPageState extends State<WorkApplyPage> {
  int _type = 1; //请假为1 加班为2

  TextEditingController _nameController;
  TextEditingController _positionController;
  TextEditingController _phoneController;
  DateTime _beginTime ;
  DateTime _endTime ;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _positionController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController?.dispose();
    _positionController?.dispose();
    _phoneController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '填写申请',
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(32.w),
        children: [
          _headType(),
          _inputRowTile('姓名', _nameController),
          _inputRowTile('职位', _positionController),
          _inputRowTile('联系方式', _phoneController),
          _timePick(),
        ],
      ),
      bottom: AkuBottomButton(
        title: '确认提交',
        onTap: () {},
      ),
    );
  }

  Widget _headType() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          '申请类型'.text.size(32.sp).color(kTextPrimaryColor).make(),
          40.w.heightBox,
          Row(
            children: [
              AkuSingleCheckButton(
                text: '请假',
                value: 1,
                gropValue: _type,
                onPressed: () {
                  _type = 1;
                  setState(() {});
                },
              ),
              20.w.widthBox,
              AkuSingleCheckButton(
                text: '加班',
                value: 2,
                gropValue: _type,
                onPressed: () {
                  _type = 2;
                  setState(() {});
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _timePick() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          40.w.heightBox,
          '申请时间'.text.size(32.sp).color(kTextPrimaryColor).bold.make(),
          40.w.heightBox,
          Row(
            children: [
              MaterialButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                height: 120.w,
                onPressed: () async {
                  DateTime date = await BeeDatePicker.pick(
                    DateTime.now(),
                    mode: CupertinoDatePickerMode.dateAndTime,
                    min: DateTime.now().subtract(Duration(seconds: 1)),
                    max: DateTime.now().add(Duration(days: 30)),
                  );
                  if (date != null) {
                    _beginTime = date;
                    setState(() {});
                  }
                },
                child: Text(
                  _beginTime == null
                      ? '请选择开始时间'
                      : DateUtil.formatDate(
                          _beginTime,
                          format: 'yyyy-MM-dd HH:mm',
                        ),
                  style: TextStyle(
                    color: kTextSubColor,
                  ),
                ),
              ).expand(),
              Icon(Icons.arrow_forward),
              MaterialButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                height: 120.w,
                onPressed: () async {
                  DateTime date = await BeeDatePicker.pick(
                    _beginTime == null ? DateTime.now() : _beginTime,
                    min: _beginTime == null
                        ? DateTime.now().subtract(Duration(seconds: 1))
                        : _beginTime,
                    max: _beginTime == null
                        ? DateTime.now().add(Duration(days: 1))
                        : (_beginTime).add(Duration(days: 1)),
                    mode: CupertinoDatePickerMode.dateAndTime,
                  );
                  if (date != null) {
                    _endTime = date;
                    setState(() {});
                  }
                },
                child: Text(
                  _endTime == null
                      ? '请选择结束时间'
                      : DateUtil.formatDate(
                          _endTime,
                          format: 'yyyy-MM-dd HH:mm',
                        ),
                  style: TextStyle(
                    color: kTextSubColor,
                  ),
                ),
              ).expand(),
            ],
          ),
          16.w.heightBox,
          AkuDivider.horizontal(),
        ],
      ),
    );
  }

  Widget _inputRowTile(String title, TextEditingController controller,
      {String hintText, List<TextInputFormatter> formatters}) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          40.w.heightBox,
          title.text.size(28.sp).color(kTextPrimaryColor).make(),
          32.w.heightBox,
          TextField(
            inputFormatters: formatters,
            textAlign: TextAlign.start,
            onChanged: (value) {
              controller.text = value;
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: hintText ?? '',
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
