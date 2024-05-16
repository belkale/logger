import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/logs.dart';

import '../models/log.dart';

class LogsScreen extends ConsumerWidget {
  const LogsScreen({super.key});

  Widget _logsWidget(Queue<Log> logs) {
    return ListView.builder(
      itemCount: logs.length,
      prototypeItem: ListTile(
        title: Text(logs.firstOrNull?.out()??''),
      ),
      itemBuilder: (context, index) => ListTile(
        title: Text(logs.elementAt(index).out()),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logs = ref.watch(logsProvider);
    print('Logs length on watch ${logs.length}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logs Screen'),
      ),
      body: logs.isEmpty? const Text('No logs to display'): _logsWidget(logs),
    );
  }
}
