import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/log.dart';
import 'log_level.dart';
import 'logs.dart';

part 'filtered_logs.g.dart';
@riverpod
List<Log> filteredLogs(FilteredLogsRef ref) {
  final level = ref.watch(logLevelProvider);
  final logs = ref.watch(logsProvider);
  return logs.where((lv) => lv.isValid(level))
      .toList(growable: false);
}