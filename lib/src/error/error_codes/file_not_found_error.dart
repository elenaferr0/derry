import 'package:derry/error.dart';

class FileNotFoundError extends DerryError {
  final String path;

  FileNotFoundError({required this.path}) {
    buffer.writeln('$prefix File not found at path "$path"');
  }

  @override
  List<Object?> get props => [path];
}
