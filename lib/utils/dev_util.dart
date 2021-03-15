class DevUtil {
  static bool get isDev => _isDev;

  static setDev(bool state) => _isDev = state;

  static bool _isDev = true;
}
