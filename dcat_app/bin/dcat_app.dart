import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';

const lineNumber = 'line-number';

void main(List<String> arguments) {
  getEnvInfo();
  writeFile2();
  // writeFile1();
  exitCode = 0; // presume success
  final parser = ArgParser()..addFlag(lineNumber, negatable: false, abbr: 'g');

  ArgResults argResults = parser.parse(arguments);
  final paths = argResults.rest;
  dcat(paths, showLineNumbers: argResults[lineNumber] as bool);
}

Future<void> dcat(List<String> paths, {bool showLineNumbers = false}) async {
  if (paths.isEmpty) {
    // No files provided as arguments. Read from stdin and print each line.
    await stdin.pipe(stdout);
  } else {
    for (final path in paths) {
      var lineNumber = 1;
      final lines = utf8.decoder
          .bind(File(path).openRead())
          .transform(const LineSplitter());
      try {
        await for (final line in lines) {
          if (showLineNumbers) {
            stdout.write('${lineNumber++} ');
          }
          stdout.writeln(line);
        }
      } catch (_) {
        await _handleError(path);
      }
    }
  }
}

Future<void> _handleError(String path) async {
  if (await FileSystemEntity.isDirectory(path)) {
    stderr.writeln('error: $path is a directory');
  } else {
    exitCode = 2;
  }
}

Future<void> writeFile1() async {
  final quotes = File('quotes.txt');
  const stronger = 'That which does not kill us makes us stronger. -Nietzsche\n';

  await quotes.writeAsString(stronger, mode: FileMode.append);
}
Future<void> writeFile2() async {
  final quotes = File('quotes.txt').openWrite(mode: FileMode.append);

  quotes.write("Don't cry because it's over, ");
  quotes.writeln('smile because it happened. -Dr. Seuss');
  await quotes.close();
}

Future<void> getEnvInfo() async {
  final envVarMap = Platform.environment;

  print('PWD = ${envVarMap['PWD']}');
  print('LOGNAME = ${envVarMap['LOGNAME']}');
  print('PATH = ${envVarMap['PATH']}');
}