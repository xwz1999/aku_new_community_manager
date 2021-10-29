class Config {
  ///用户根目录
  static const String homeDir = '/users/zhangmeng';

  ///包名
  static const String packageName = 'aku_community_manager';

  ///打包目录
  static String get buildPath =>
      './build/app/outputs/flutter-apk/app-release.apk';

  ///测试包文件夹
  static String get apkDevDir =>
      '/users/zhangmeng/team/bee/app/aku_community_manager/dev';

  ///正式包文件夹aku_community_manager
  static String get apkDir =>
      '/users/zhangmeng/team/bee/app/aku_community_manager/release';
}
