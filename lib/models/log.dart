import 'package:intl/intl.dart';

import 'logger.dart';

class Log {
  final DateTime dateTime;
  final Level level;
  final String classname;
  final String message;
  final String separator = ' |';
  final int maxSize = 400;
  Log(this.dateTime, this.level,
      {required this.classname, required this.message});
  bool isValid(Level input) {
    switch(input) {
      case Level.debug: return true;
      case Level.info:
        return level == Level.info
          || level == Level.warn
          || level == Level.error;
      case Level.warn:
        return level == Level.warn
            || level == Level.error;
      case Level.error:
        return level == Level.error;
    }
  }
  String out() {
    final now = DateFormat('yyyy-MM-dd kk:mm').format(dateTime);
    final data = [now, level.name.toUpperCase(), classname, message];
    final line = data.join(separator);
    return line.length > maxSize? line.substring(0, maxSize): line;
  }
}