import 'dart:io';

import 'package:equatable/equatable.dart' show EquatableMixin;
import 'package:tint/tint.dart';

abstract class DerryError extends Error with EquatableMixin {
  DerryError() {
    buffer.writeln('$prefix Code ${runtimeType.toString().cyan()}');
  }

  final buffer = StringBuffer();
  final prefix = 'derry ${"ERR!".red()}';

  void print() {
    stderr.write(buffer.toString());
  }
}
