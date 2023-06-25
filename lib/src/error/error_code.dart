/// Types of error that can/will be handled by derry.
enum ErrorCode {
  /// throw when a script is not defined
  scriptNotDefined,

  /// throw when a specific script definition is not valid
  invalidScript,

  /// throw when unable to locate script definitions
  /// due to missing `scripts` key in `pubspec.yaml`
  missingScripts,

  /// throw when `scripts` field is invalid
  invalidScripts,

  /// throw when a specific file cannot be located
  fileNotFound,

  /// throw when YAML format is invalid
  invalidYaml,

  /// throw when using on an unsupported platform
  platformNotSupported,

  /// throw when the package uri is not valid,
  /// this is used to locate dynamic library blobs
  invalidPackageUri,

  /// throw when dynamic library blobs are invalid and
  /// dart ffi cannot load them
  invalidBlob,

  /// throw when a yaml file is not a map
  invalidYamlMap,

  /// throw when the os specific script syntax is used
  /// but no script is defined for the current os
  noScriptForCurrentOs,

  /// throw when an os defined in yaml file is not valid
  invalidOs
}
