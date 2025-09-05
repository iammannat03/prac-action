import 'package:flutter/material.dart';

class BuildTaskScreen extends StatefulWidget {
  const BuildTaskScreen({super.key});

  @override
  State<BuildTaskScreen> createState() => _BuildTaskScreenState();
}

class _BuildTaskScreenState extends State<BuildTaskScreen> {
  // Simulate a network call or async operation that returns a list of tasks after 2 seconds
  Stream<List<String>> taskStream() async* {
    final List<String> tasks = [];
    for (int i = 0; i < 5; i++) {
      await Future.delayed(const Duration(seconds: 1));
      tasks.add("Future Task ${i + 1}");
      yield tasks;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        title: const Text(
          "FutureBuilder Task Tracker",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<List<String>>(
          stream: taskStream(),
          builder: (context, snapshot) {
            // 1. While waiting for the future to complete, show a loading spinner
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            // 2. If the future completed with an error, show an error message
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
            // 3. If the future completed with data, show the list of tasks
            if (snapshot.hasData) {
              final tasks = snapshot.data!;
              if (tasks.isEmpty) {
                return const Center(child: Text('No tasks found.'));
              }
              return ListView.separated(
                itemCount: tasks.length,
                separatorBuilder: (_, index) => const SizedBox(height: 12),
                itemBuilder: (_, index) => ListTile(
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  title: Text(
                    tasks[index],
                    style: const TextStyle(color: Colors.black),
                  ),
                  leading: const Icon(Icons.task_alt, color: Colors.indigo),
                ),
              );
            }
            // 4. Fallback for any other state (shouldn't usually happen)
            return const Center(child: Text('No data.'));
          },
        ),
      ),
    );
  }
}
