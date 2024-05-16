import 'package:logger/providers/log_level.dart';
import 'package:logger/providers/logs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/log.dart';

part 'filtered_logs.g.dart';
@riverpod
List<Log> filteredLogs(FilteredLogsRef ref) {
  final level = ref.watch(logLevelProvider);
  final logs = ref.watch(logsProvider);
  return logs.where((lv) => lv.isValid(level))
      .toList(growable: false);
}