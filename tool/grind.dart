import 'dart:io';

import 'package:common_utils/common_utils.dart';
import 'package:grinder/grinder.dart';
import 'package:yaml/yaml.dart';
import 'package:path/path.dart';

import 'config.dart';

main(args) => grind(args);

@Task()
test() => new TestRunner().testAsync();

@DefaultTask()
@Depends(test)
build() {
  Pub.build();
}

@Task()
clean() => defaultClean();

@Task()
buildApk() async {
  await runAsync('fvm', arguments: [
    'flutter',
    'build',
    'apk',
    '--target-platform=android-arm64',
    '--dart-define',
    'ISPRODUCT=true'
  ]);
  String date = DateUtil.formatDate(DateTime.now(), format: 'yy_MM_dd_HH_mm');
  String version = await getVersion();
  await runAsync('mv', arguments: [
    Config.buildPath,
    '${Config.buildDir}/${Config.packageName}_${version}_release_$date.apk'
  ]);
}

@Task()
buildApkDev() async {
  await runAsync('fvm', arguments: [
    'flutter',
    'build',
    'apk',
    '--target-platform=android-arm64',
    '--dart-define',
    'ISPRODUCT=false'
  ]);
  String date = DateUtil.formatDate(DateTime.now(), format: 'yy_MM_dd_HH_mm');
  String version = await getVersion();
  await runAsync('mv', arguments: [
    Config.buildPath,
    '${Config.buildDir}/${Config.packageName}_${version}_beta_$date.apk'
  ]);
}

@Task()
buildIos() async {
  await runAsync('fvm', arguments: [
    'flutter',
    'build',
    'ios',
    '--dart-define',
    'BUILD_TYPE=PRODUCT'
  ]);
}

@Task('import 排序')
void sort() {
  Pub.run('import_sorter:main');
}

@Task('代码格式化')
void format() {
  DartFmt.format(libDir);
}

@Task('生成model')
void gen() async {
  await Pub.run('build_runner', arguments: ['build']);
}

@Task()
Future<String> getVersion() async {
  String projectPath = Directory('.').absolute.path;
  String yamlPath = join(projectPath, 'pubspec.yaml');
  String yamlContent = await File(yamlPath).readAsString();
  dynamic content = loadYaml(yamlContent);
  String version = content['version'];
  return version;
}
