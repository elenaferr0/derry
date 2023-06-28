import 'dart:io' show File, Directory;

import 'package:derry/error.dart' show DerryError, ErrorCode;
import 'package:derry/src/error/error_codes/invalid_yaml_error.dart';
import 'package:path/path.dart' as path;
import 'package:yaml/yaml.dart' show YamlDocument, loadYamlDocument, YamlMap;

import '../error/error_codes/file_not_found_error.dart';
import '../error/error_codes/invalid_yaml_map_error.dart';

/// Reads a yaml file and if it exists, returns a yaml document.
Future<YamlDocument> _readYamlFile(String filePath) async {
  final file = File(path.join(Directory.current.path, filePath));
  if (!await file.exists()) {
    throw FileNotFoundError(path: filePath);
  }

  final content = await file.readAsString();
  try {
    return loadYamlDocument(content);
  } catch (e) {
    throw InvalidYamlError(path: filePath, origin: e);
  }
}

/// Reads and returns a yaml file if exists and
/// if the content is a map.
Future<Map> readYamlMap(String filePath) async {
  final document = await _readYamlFile(filePath);

  if (document.contents is! YamlMap) {
    throw InvalidYamlMap(path: filePath, contents: document.contents);
  }

  return document.contents.value as Map;
}
