import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamTaskProvider = StreamProvider<List<String>>((ref) async* {
  List<String> tasks = [];

  for (int i = 0; i < 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    tasks.add("Task $i");
    yield tasks;
  }
});
