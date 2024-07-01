import 'package:flutter/foundation.dart';

void consoleLog(Object? obj, [String? message]) {
  debugPrint('''
    ----------------------------
    ${message == null ? obj : "$message : $obj"}
    ----------------------------
    ''');
}
