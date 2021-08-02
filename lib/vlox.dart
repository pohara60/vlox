import 'dart:convert';
import 'dart:io';

class Lox {
  static bool hadError = false;
  static bool hadRuntimeError = false;

  static void runFile(String path) async {
    var file = File(path);
    var bytes = await file.readAsString(encoding: Encoding.getByName('ascii'));
    run(bytes);
    if (hadError) exit(65);
    if (hadRuntimeError) exit(70);
  }

  static void runPrompt() {
    while (true) {
      print('> ');
      var line = stdin.readLineSync(encoding: Encoding.getByName('ascii'));
      if (line == null) break;
      run(line, repl: true);
      hadError = false;
    }
  }

  static void run(String source, {bool repl = false}) {}

  static void error(int line, String message) {
    report(line, '', message);
  }

  static void report(int line, String where, String message) {
    stderr.writeln('[line ${line.toString()}] Error$where: $message');
    hadError = true;
  }
}
