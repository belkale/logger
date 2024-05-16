import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

enum Level {debug, info, warn, error}
class Logger {
  final String className;
  final separator = '|';
  Logger(this.className);

  void log(WidgetRef ref, Level level, String message) {
    final now = DateFormat('yyyy-MM-dd kk:mm').format(DateTime.now());
    final data = [now, level.name.toUpperCase(), className, message];
    print(data.join(separator));
  }

  void debug(WidgetRef ref, String message) => log(ref, Level.debug, message);
  void info(WidgetRef ref, String message) => log(ref, Level.info, message);
  void warning(WidgetRef ref, String message) => log(ref, Level.warn, message);
  void error(WidgetRef ref, String message) => log(ref, Level.error, message);
}