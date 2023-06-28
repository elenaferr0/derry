import 'package:derry/error.dart';

class InvalidPackageUriError extends DerryError {
  final String packageUri;
  InvalidPackageUriError({
    required this.packageUri,
  }) {
    buffer.writeln('$prefix Unable to resolve package URI "$packageUri".');
  }

  @override
  List<Object?> get props => [packageUri];
}
