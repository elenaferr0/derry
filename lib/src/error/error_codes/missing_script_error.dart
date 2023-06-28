import 'package:derry/error.dart';

class MissingScriptError extends DerryError {
  MissingScriptError() {
    buffer.writeln('$prefix Field `scripts` is not defined in `pubspec.yaml`.');
  }

  @override
  List<Object?> get props => [buffer];
}
