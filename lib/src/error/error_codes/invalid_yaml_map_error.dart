import 'package:derry/error.dart';

class InvalidYamlMap extends DerryError {
  final String path;
  final Object contents;

  InvalidYamlMap({
    required this.path,
    required this.contents,
  }) {
    buffer.writeln('$prefix YAML is not a map in "$path".');
    buffer.writeln('$prefix contents: $contents');
  }

  @override
  List<Object?> get props => [path];
}
