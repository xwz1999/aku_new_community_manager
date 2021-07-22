part of 'grind.dart';

@Task('add minor version number')
void addVersion() async {
  String projectPath = Directory('.').absolute.path;
  String yamlPath = join(projectPath, 'pubspec.yaml');
  String yamlContent = await File(yamlPath).readAsString();
  dynamic content = loadYaml(yamlContent);
  String version = content['version'];
  //rename version

  Version resultVersion = VersionTool.fromText(version).nextMinorTag('dev');

  String result = yamlContent.replaceFirst(version, resultVersion.toString());
  await File(yamlPath).writeAsString(result);
}

@Task('add path version number')
void addVersionPatch() async {
  String projectPath = Directory('.').absolute.path;
  String yamlPath = join(projectPath, 'pubspec.yaml');
  String yamlContent = await File(yamlPath).readAsString();
  dynamic content = loadYaml(yamlContent);
  String version = content['version'];
  //rename version

  Version resultVersion = VersionTool.fromText(version).nextPatchTag('dev');

  String result = yamlContent.replaceFirst(version, resultVersion.toString());
  await File(yamlPath).writeAsString(result);
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