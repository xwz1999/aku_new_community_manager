// // Flutter imports:
// import 'package:flutter/material.dart';

// // Project imports:
// import 'package:aku_new_community_manager/mock_models/decoration/decoration_model.dart';
// import 'package:aku_new_community_manager/tools/screen_tool.dart';
// import 'package:aku_new_community_manager/tools/widget_tool.dart';
// import 'package:aku_new_community_manager/ui/sub_pages/decoration_manager/decoration_check_card_widget.dart';

// class DecorationCheckRow extends StatefulWidget {
//   final List<CHECK_TYPE> details;
//   final Function(List<CHECK_TYPE> details) onChange;
//   final bool canTap;
//   DecorationCheckRow(
//       {Key key, @required this.details, this.onChange, this.canTap = false})
//       : super(key: key);

//   @override
//   _DecorationCheckRowState createState() => _DecorationCheckRowState();
// }

// class _DecorationCheckRowState extends State<DecorationCheckRow> {
//   List<CHECK_TYPE> _tempCheckDetails = [];
//   List<CHECK_TYPE> _checkedDetails = [];
//   @override
//   void initState() {
//     super.initState();
//     _tempCheckDetails = widget.details;
//     widget.details.forEach((element) {
//       _checkedDetails.add(element);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 160.w,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: !widget.canTap
//                 ? null
//                 : () {
//                     widget.onChange(_checkedDetails);
//                     setState(() {
//                       _checkedDetails.indexOf(_tempCheckDetails[index]) != -1
//                           ? _checkedDetails.remove(_tempCheckDetails[index])
//                           : _checkedDetails.add(_tempCheckDetails[index]);
//                     });
//                   },
//             child: Material(
//               color: Colors.transparent,
//               child: DecorationCheckCardWidget(
//                 type: _tempCheckDetails[index],
//                 checked: !widget.canTap
//                     ? false
//                     : _checkedDetails.indexOf(_tempCheckDetails[index]) != -1,
//               ),
//             ),
//           );
//         },
//         itemCount: _tempCheckDetails.length,
//         separatorBuilder: (context, index) {
//           return AkuBox.w(16);
//         },
//       ),
//     );
//   }
// }
