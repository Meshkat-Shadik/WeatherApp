import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// lib/design_system must stay drop-in portable: relative imports between its
/// own files, plus only these packages. Anything else (an app `package:`
/// import, a feature, core/) breaks copying the folder into another project.
const _allowed = [
  'dart:',
  'package:flutter/',
  'package:material_ui/',
  'package:google_fonts/',
  'package:flutter_hooks/',
];

void main() {
  test('design_system imports nothing from the host app', () {
    final root = Directory('lib/design_system');
    final violations = <String>[];
    for (final file in root.listSync(recursive: true).whereType<File>()) {
      if (!file.path.endsWith('.dart')) continue;
      final lines = file.readAsLinesSync();
      for (final (i, line) in lines.indexed) {
        final m = RegExp(r'''^(?:import|export)\s+['"]([^'"]+)['"]''')
            .firstMatch(line);
        if (m == null) continue;
        final uri = m[1]!;
        final relative = !uri.contains(':');
        final escapes =
            relative &&
            !File.fromUri(file.uri.resolve(uri)).absolute.path
                .startsWith(root.absolute.path);
        if ((!relative && !_allowed.any(uri.startsWith)) || escapes) {
          violations.add('${file.path}:${i + 1} → $uri');
        }
      }
    }
    expect(violations, isEmpty, reason: violations.join('\n'));
  });
}
