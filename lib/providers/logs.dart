import 'dart:collection';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/log.dart';

part 'logs.g.dart';

@Riverpod(keepAlive: true)
class Logs extends _$Logs {
  final int maxSize = 1000;
  @override
  Queue<Log> build() => ListQueue<Log>();

  void add(Log log) {
    if (state.length >= maxSize) {
      state.removeFirst();
    }
    state.add(log);
  }
}