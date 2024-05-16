import 'package:intl/intl.dart';

import 'logger.dart';

class Log {
  final DateTime dateTime;
  final Level level;
  final String classname;
  final String message;
  final String separator = '|';
  Log(this.dateTime, this.level,
      {required this.classname, required this.message});
  String out() {
    final now = DateFormat('yyyy-MM-dd kk:mm').format(dateTime);
    final data = [now, level.name.toUpperCase(), classname, message];
    return data.join(separator);
  }
}