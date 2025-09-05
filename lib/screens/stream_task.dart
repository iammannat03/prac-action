import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prac_1/providers/stream_task_provider.dart';

class StreamTaskScreen extends ConsumerWidget {
  const StreamTaskScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskStream = ref.watch(streamTaskProvider);

    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        title: Text(
          "RiverTask Tracker",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Add a task",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: taskStream.when(
              data: (tasks) => ListView.separated(
                padding: EdgeInsets.all(12),
                separatorBuilder: (context, index) => SizedBox(height: 12),
                itemCount: tasks.length,
                itemBuilder: (context, i) => ListTile(
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  title: Text(tasks[i], style: TextStyle(color: Colors.black)),
                ),
              ),
              loading: () => Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }
}
