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
buildIos() async {
  await runAsync('flutter',
      arguments: ['build', 'ios', '--dart-define', 'BUILD_TYPE=PRODUCT']);
}
