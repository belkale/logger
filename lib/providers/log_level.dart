import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/logger.dart';

part 'log_level.g.dart';
@riverpod
class LogLevel extends _$LogLevel {
  @override
  Level build() => Level.info;

  void update(Level level) {
    state = level;
  }
}