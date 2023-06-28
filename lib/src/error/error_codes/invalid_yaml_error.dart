import 'package:derry/error.dart';

class InvalidYamlError extends DerryError {
  final String path;
  final Object origin;

  InvalidYamlError({
    required this.path,
    required this.origin,
  }) {
    buffer.writeln(
        '$prefix Incorrect YAML format in "$path".\n$prefix Origin $origin');
  }

  @override
  List<Object?> get props => [path];
}
