import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/logs.dart';

import 'log.dart';

enum Level {debug, info, warn, error}
class Logger {
  final String classname;
  Logger(this.classname);

  void log(WidgetRef ref, Level level, String message) {
    Log lg = Log(DateTime.now(), level, classname: classname,
        message: message);
    ref.read(logsProvider.notifier).add(lg);
  }

  void debug(WidgetRef ref, String message) => log(ref, Level.debug, message);
  void info(WidgetRef ref, String message) => log(ref, Level.info, message);
  void warning(WidgetRef ref, String message) => log(ref, Level.warn, message);
  void error(WidgetRef ref, String message) => log(ref, Level.error, message);
}