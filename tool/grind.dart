import 'package:grinder/grinder.dart';

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
  await runAsync('flutter', arguments: [
    'build',
    'apk',
    '--target-platform=android-arm64',
    '--dart-define',
    'ISPRODUCT=true'
  ]);
}

@Task()
buildApkDev() async {
  await runAsync('flutter', arguments: [
    'build',
    'apk',
    '--target-platform=android-arm64',
    '--dart-define',
    'ISPRODUCT=false'
  ]);
}

@Task()
buildIos() async {
  await runAsync('flutter',
      arguments: ['build', 'ios', '--dart-define', 'BUILD_TYPE=PRODUCT']);
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
