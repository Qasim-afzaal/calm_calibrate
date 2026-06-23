// Syncs keys from app_en.arb into other locale ARB files.
// Preserves existing translations; new keys copy from English template.
//
// Run: dart run tool/sync_l10n.dart

import 'dart:convert';
import 'dart:io';

void main() {
  final l10nDir = Directory('lib/l10n');
  final enFile = File('${l10nDir.path}/app_en.arb');
  final en = jsonDecode(enFile.readAsStringSync()) as Map<String, dynamic>;

  for (final entity in l10nDir.listSync()) {
    if (entity is! File) continue;
    final name = entity.uri.pathSegments.last;
    if (!name.startsWith('app_') || !name.endsWith('.arb') || name == 'app_en.arb') {
      continue;
    }
    final locale = jsonDecode(entity.readAsStringSync()) as Map<String, dynamic>;
    var added = 0;
    for (final entry in en.entries) {
      if (entry.key.startsWith('@@') || entry.key.startsWith('@')) continue;
      if (!locale.containsKey(entry.key)) {
        locale[entry.key] = entry.value;
        added++;
      }
    }
    if (added > 0) {
      final encoder = JsonEncoder.withIndent('  ');
      entity.writeAsStringSync('${encoder.convert(locale)}\n');
      stdout.writeln('$name: added $added keys');
    }
  }
}
