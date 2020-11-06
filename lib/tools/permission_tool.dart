import 'package:permission_handler/permission_handler.dart';

class PermissionTool {
  static Future<bool> getLocationPermission() async {
    return await Permission.locationWhenInUse.request().isGranted;
  }
}
