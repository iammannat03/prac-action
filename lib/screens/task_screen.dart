import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<String> tasks = [];
  final TextEditingController controller = TextEditingController();

  void addTask() {
    if (controller.text.isNotEmpty) {
      setState(() {
        tasks.add(controller.text);
        controller.clear();
      });
      print(tasks);
    }
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        title: Text(
          "Hello everyone",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              if (value == "river-task") {
                Navigator.pushNamed(context, "/river-task");
              }
              if (value == "stream-task") {
                Navigator.pushNamed(context, "/stream-task");
              }
              if (value == "build-task") {
                Navigator.pushNamed(context, "/build-task");
              }
              if (value == "video") {
                Navigator.pushNamed(context, "/video");
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: "river-task",
                child: Text("River Task Tracker"),
              ),
              PopupMenuItem(
                value: "stream-task",
                child: Text("Stream Task Tracker"),
              ),
              PopupMenuItem(
                value: "build-task",
                child: Text("Build Task Tracker"),
              ),
              PopupMenuItem(value: "video", child: Text("Video")),
            ],
          ),
        ],
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
