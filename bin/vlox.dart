import 'dart:io';
import 'package:vlox/vlox.dart';

void main(List<String> args) {
  if (args.length > 1) {
    print('Usage: vlox [script]');
    exit(64);
  } else if (args.length == 1) {
    Lox.runFile(args[0]);
  } else {
    Lox.runPrompt();
  }
}
