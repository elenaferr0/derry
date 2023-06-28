import 'dart:io' show Platform;

import 'package:derry/error.dart';

class NoScriptForCurrentOsError extends DerryError {
  final String script;

  NoScriptForCurrentOsError({
    required this.script,
  }) {
    buffer.writeln(
        "$script doesn't include a definition of script for your current OS (${Platform.operatingSystem})");
  }

  @override
  List<Object?> get props => [script];
}
