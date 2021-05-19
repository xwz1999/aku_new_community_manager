// Package imports:
import 'package:common_utils/common_utils.dart';

extension DateExt on String {
  String akuDate({String format}) {
    return DateUtil.formatDateStr(this, format: format ?? "yyyy-MM-dd HH:mm");
  }
}
