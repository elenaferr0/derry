import 'package:derry/error.dart';
import 'package:string_similarity/string_similarity.dart';

class InvalidScriptError extends DerryError {
  final String script;
  final List<String> paths;

  InvalidScriptError({required this.script, required this.paths}) {
    buffer.writeln('Script definition of "$script" is invalid.');

    final nestedScripts =
        paths.where((path) => path.startsWith('$script ')).toList();

    if (nestedScripts.isNotEmpty) {
      buffer.writeln('$prefix Script "$script" is a nested script.');

      final bestMatch =
          StringSimilarity.findBestMatch(script, nestedScripts).bestMatch;
      if (bestMatch.rating != null && bestMatch.rating! >= 0.5) {
        buffer.writeln();
        buffer.writeln('Did you mean to run this?');
        buffer.writeln('\t${bestMatch.target}');
      }
    }
  }

  @override
  List<Object?> get props => [script, paths];
}
