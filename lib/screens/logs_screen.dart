import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/filtered_logs.dart';
import '../providers/log_level.dart';
import '../models/log.dart';
import '../models/logger.dart';

class LogsScreen extends ConsumerWidget {
  const LogsScreen({super.key});

  Color getColor(Level level) {
    if (level == Level.warn) {
      // Yellow
      return const Color.fromARGB(20, 255, 255, 0);
    } else if (level == Level.error) {
      // Red
      return const Color.fromARGB(20, 255, 0, 0);
    } else {
      // Transparent
      return const Color.fromARGB(0, 255, 255, 255);
    }

  }
  Widget _logsWidget(List<Log> filtered) {
    return ListView.builder(
      itemCount: filtered.length,
      itemBuilder: (context, index) =>
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            color: getColor(filtered[index].level),
            child: Text(filtered[index].out())),
    );
  }

  Widget _menuWidget(WidgetRef ref) {
    final current = ref.watch(logLevelProvider);
    return DropdownMenu<Level>(
      initialSelection: current,
      onSelected: (level) {
        if (level != null) {
          ref.read(logLevelProvider.notifier).update(level);
        }
      },
      dropdownMenuEntries: Level.values.map(
          (lv) => DropdownMenuEntry(
            value: lv,
            label: lv.name,
          )
      ).toList(growable: false),
    );
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filtered = ref.watch(filteredLogsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logs Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _menuWidget(ref),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: filtered.isEmpty?
                  const Text('No logs to display'): _logsWidget(filtered)
              ),
            ),
          ]
        ),
      ),
    );
  }
}
