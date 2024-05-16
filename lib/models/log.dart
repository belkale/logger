import 'package:intl/intl.dart';

import 'logger.dart';

class Log {
  final DateTime dateTime;
  final Level level;
  final String classname;
  final String message;
  final String separator = ' |';
  static const int maxSize = 300;
  Log(this.dateTime, this.level,
      {required this.classname, required message})
      :message = message.length > maxSize?
        message.subString(0, maxSize) + '...': message;
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
    return data.join(separator);
  }
}