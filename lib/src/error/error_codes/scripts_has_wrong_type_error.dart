import 'package:derry/error.dart';

class ScriptsHasWrongTypeError extends DerryError {
  ScriptsHasWrongTypeError() {
    buffer.writeln('$prefix Type of field `scripts` is invalid.');
    buffer.writeln('$prefix It should be a map of scripts or a file path.');
  }

  @override
  List<Object?> get props => [buffer];
}
