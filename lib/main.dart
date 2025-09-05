import 'package:flutter/material.dart';
import 'package:prac_1/screens/build_task_screen.dart';
import 'package:prac_1/screens/demo_page.dart';
import 'package:prac_1/screens/stream_task.dart';
import 'package:prac_1/screens/river_task_screen.dart';
import 'package:prac_1/screens/task_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prac_1/screens/video_screen.dart';

void main() {
  runApp(const ProviderScope(child: TaskTracker()));
}

class TaskTracker extends StatelessWidget {
  const TaskTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task Tracker",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        appBarTheme: AppBarTheme(backgroundColor: Colors.indigo[100]),
      ),

      routes: {
        // "/": (context) => TaskScreen(),
        "/": (context) => DemoPage(),
        "/river-task": (context) => RiverTaskScreen(),
        "/stream-task": (context) => StreamTaskScreen(),
        "/build-task": (context) => BuildTaskScreen(),
        "/video": (context) => VideoPlayerWidget(),
      },
    );
  }
}
