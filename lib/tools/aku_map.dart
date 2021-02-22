import 'package:aku_community_manager/ui/sub_pages/visitor_manager/visitor_manager_page.dart';

class AkuMap {
  static Map<int, VisitorStatus> vistorStatus = {
    1: VisitorStatus.NOT_VISIT,
    2: VisitorStatus.VISIT_DONE,
    3: VisitorStatus.OUTDATE,
    4: VisitorStatus.CANCEL
  };
}
