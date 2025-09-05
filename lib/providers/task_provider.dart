import 'package:flutter_riverpod/flutter_riverpod.dart';

final taskListProvider = StateProvider<List<String>>((ref) => []);
