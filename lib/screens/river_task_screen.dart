import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prac_1/providers/task_provider.dart';

class RiverTaskScreen extends ConsumerWidget {
  RiverTaskScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskListProvider);

    void addTask() {
      if (controller.text.isNotEmpty) {
        ref
            .read(taskListProvider.notifier)
            .update((state) => [...state, controller.text]);
        controller.clear();
      }
    }

    void deleteTask(int index) {
      final current = [...tasks];
      current.removeAt(index);
      ref.read(taskListProvider.notifier).state = current;
    }

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
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Enter something...",
                    suffixIcon: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: addTask,
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(12),
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemCount: tasks.length,
              itemBuilder: (context, index) => ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                title: Text(
                  tasks[index],
                  style: TextStyle(color: Colors.black),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => deleteTask(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
