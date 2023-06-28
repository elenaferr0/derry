import 'package:derry/error.dart';

class InvalidOsError extends DerryError {
  final String os;

  InvalidOsError({
    required this.os,
  }) {
    buffer.writeln(
        '$prefix OS "$os" is not supported.Choose between linux, windows and mac, or provide a default.');
  }

  @override
  List<Object?> get props => [os];
}
