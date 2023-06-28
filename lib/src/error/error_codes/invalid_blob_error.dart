import 'package:derry/error.dart';

class InvalidBlobError extends DerryError {
  final String path;
  final Object origin;

  InvalidBlobError({
    required this.path,
    required this.origin,
  }) {
    buffer.writeln(
        '$prefix Unable to load dynamic library blob at "$path".\n$prefix Origin $origin');
  }

  @override
  List<Object?> get props => [path, origin];
}
