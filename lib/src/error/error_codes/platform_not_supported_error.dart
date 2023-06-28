import 'dart:ffi';

import 'package:derry/error.dart';

class PlatformNotSupportedError extends DerryError {
  final Abi abi;

  PlatformNotSupportedError({
    required this.abi,
  }) {
    buffer.writeln('$prefix Platform "$abi" is not supported.');
  }

  @override
  List<Object?> get props => [abi];
}
