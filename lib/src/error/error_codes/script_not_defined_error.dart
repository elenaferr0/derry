import 'package:derry/error.dart';
import 'package:string_similarity/string_similarity.dart';

class ScriptNotDefinedError extends DerryError {
  final String script;
  final List<String> suggestions;

  ScriptNotDefinedError({required this.script, required this.suggestions}) {
    buffer.writeln('Unable to find script named "$script".');

    final bestMatch =
        StringSimilarity.findBestMatch(script, suggestions).bestMatch;
    if (bestMatch.rating != null && bestMatch.rating! >= 0.5) {
      buffer.writeln();
      buffer.writeln('Did you mean to run this?');
      buffer.writeln('\t${bestMatch.target}');
    }
  }

  @override
  List<Object?> get props => [script, suggestions];
}
