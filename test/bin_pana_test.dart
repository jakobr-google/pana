// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import 'package:io/io.dart';
import 'package:test/test.dart';
import 'package:test_process/test_process.dart';

void main() {
  test('run with no arguments', () async {
    var process = await TestProcess.start('pub', ['run', 'pana']);

    var output = await process.stdoutStream().join('\n');
    expect(output, startsWith('No package was provided.'));
    expect(output, endsWith(_helpOutput));

    await process.shouldExit(ExitCode.usage.code);
  });

  test('run with bad option', () async {
    var process = await TestProcess.start('pub', ['run', 'pana', '--monkey']);

    var output = await process.stdoutStream().join('\n');
    expect(output, startsWith('Could not find an option named "monkey".'));
    expect(output, endsWith(_helpOutput));

    await process.shouldExit(ExitCode.usage.code);
  });

  test('readme contains latest task output', () {
    var readme = new File('README.md');

    expect(readme.readAsStringSync(), contains('```\n$_helpOutput\n```'));
  });
}

final _helpOutput = '''Usage: pana [<options>] <package> [<version>]
       pana [<options>] --source path <directory>

Options:
  -j, --json            Output log items as JSON.
  -s, --source          The source used to find the package.
                        [hosted (default), path]
  
      --hosted-url      The server that hosts <package>.
                        (defaults to "https://pub.dartlang.org")
  
      --[no-]warning    Shows the warning message before potentially destructive operation.
                        (defaults to on)''';
